let s:dynamic = levenshtein#dynamic#import()
let s:bitparallel = levenshtein#bitparallel#import()
let s:bitparallel_obsolete = levenshtein#bitparallel_obsolete#import()

let s:default_seed = srand(123456)

function! s:randstr(n, ...) abort
  let l:basket = split(get(a:000, 0, '0123456789abcdefghijklmnopqrstuvwxyz'), '\zs')
  let l:seed = get(a:000, 1, s:default_seed)
  let l:m = len(l:basket) - 1
  let l:chars = map(range(a:n), 'l:basket[rand(l:seed) % l:m]')
  return join(l:chars, '')
endfunction


function! s:profile_once(F, A, B) abort
  let l:start = reltime()
  call a:F(a:A, a:B)
  return str2float(reltimestr(reltime(l:start)))
endfunction


function! s:sort_float(list) abort
  return sort(copy(a:list), {i1, i2 -> i1 - i2 == 0 ? 0 : i1 - i2 > 0 ? 1 : -1})
endfunction


function! s:min(sortedlist) abort
  return a:sortedlist[0]
endfunction


function! s:max(sortedlist) abort
  return a:sortedlist[-1]
endfunction


function! s:sum(list) abort
  return reduce(a:list, {acc, val -> acc + val}, 0)
endfunction


function! s:mean(list) abort
  return s:sum(a:list)/len(a:list)
endfunction


function! s:median(sortedlist) abort
  let l:len = len(a:sortedlist)
  if l:len % 2 == 1
    return a:sortedlist[l:len/2]
  endif
  return (a:sortedlist[l:len/2 - 1] + a:sortedlist[l:len/2])/2
endfunction


function! s:profile_func(F, A, B, n) abort
  let l:results = map(range(a:n), 's:profile_once(a:F, a:A[v:val], a:B[v:val])')
  let l:sorted = s:sort_float(l:results)
  let l:minimum = s:min(l:sorted)
  let l:maximum = s:max(l:sorted)
  let l:mean = s:mean(l:sorted)
  let l:median = s:median(l:sorted)
  return [l:minimum, l:maximum, l:mean, l:median]
endfunction


function! s:output_line(name, result) abort
  let l:template = '%-24s min: %2.6f    max: %2.6f    mean: %2.6f    median: %2.6f'
  return call('printf', [l:template, a:name] + a:result)
endfunction


function! s:profile(n) abort
  let l:A = map(range(a:n), 's:randstr(64)')
  let l:B = map(range(a:n), 's:randstr(64)')
  let result_dynamic = s:profile_func(s:dynamic.levenshtein_distance, l:A, l:B, a:n)
  let result_bitparallel_obsolete = s:profile_func(s:bitparallel_obsolete.levenshtein_distance, l:A, l:B, a:n)
  let result_bitparallel = s:profile_func(s:bitparallel.levenshtein_distance, l:A, l:B, a:n)
  echomsg printf('evaluated %d times', a:n)
  echomsg s:output_line('dynamic programming:', result_dynamic)
  echomsg s:output_line('bit-parallel (obsolete):', result_bitparallel_obsolete)
  echomsg s:output_line('bit-parallel:', result_bitparallel)
endfunction

call s:profile(1000)
