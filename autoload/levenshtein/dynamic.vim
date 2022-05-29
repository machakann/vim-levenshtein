scriptencoding utf-8


function! s:distancemap(n) abort
  let l:d = [range(a:n + 1)]
  for l:i in range(1, a:n)
    let l:d += [[l:i] + repeat([0], a:n)]
  endfor
  return l:d
endfunction
let s:dmax = 20
let s:distancemap = s:distancemap(s:dmax)


function! s:levenshtein_distance(A, B) abort
  if a:A is# ''
    return strchars(a:B)
  endif
  if a:B is# ''
    return strchars(a:A)
  endif
  if a:A is# a:B
    return 0
  endif
  return s:_levenshtein_distance(a:A, a:B)
endfunction


" 動的計画法 (dynamic programming) による Levenshtein 距離の計算。
function! s:_levenshtein_distance(A, B) abort
  let l:A = split(a:A, '\zs')
  let l:B = split(a:B, '\zs')
  let l:Alen = len(l:A)
  let l:Blen = len(l:B)
  let l:nmax = max([l:Alen, l:Blen])
  if l:nmax > s:dmax
    let l:d = s:distancemap(l:nmax)
  else
    let l:d = copy(s:distancemap)
  endif
  for l:i in range(1, l:Alen)
    for l:j in range(1, l:Blen)
      let l:const = l:A[l:i - 1] ==# l:B[l:j - 1] ? 0 : 1
      let l:d[l:i][l:j] = min([l:d[l:i - 1][l:j] + 1,
                              \l:d[l:i][l:j - 1] + 1,
                              \l:d[l:i - 1][l:j - 1] + l:const])
    endfor
  endfor
  return l:d[l:Alen][l:Blen]
endfunction


function! s:ristricted_damerau_levenshtein_distance(A, B) abort
  if a:A is# ''
    return strchars(a:B)
  endif
  if a:B is# ''
    return strchars(a:A)
  endif
  if a:A is# a:B
    return 0
  endif
  return s:_ristricted_damerau_levenshtein_distance(a:A, a:B)
endfunction


" 動的計画法 (dynamic programming) による制限付き Damerau-Levenshtein 距離の計算。
function! s:_ristricted_damerau_levenshtein_distance(A, B) abort
  let l:A = split(a:A, '\zs')
  let l:B = split(a:B, '\zs')
  let l:Alen = len(l:A)
  let l:Blen = len(l:B)
  let l:nmax = max([l:Alen, l:Blen])
  if l:nmax > s:dmax
    let l:d = s:distancemap(l:nmax)
  else
    let l:d = copy(s:distancemap)
  endif
  for l:i in range(1, l:Alen)
    for l:j in range(1, l:Blen)
      let l:const = l:A[l:i - 1] ==# l:B[l:j - 1] ? 0 : 1
      if l:i > 1 && l:j > 1 && l:A[l:i - 1] ==# l:B[l:j - 2] && l:A[l:i - 2] ==# l:B[l:j - 1]
        let l:d[l:i][l:j] = min([l:d[l:i - 1][l:j] + 1,
                                \l:d[l:i][l:j - 1] + 1,
                                \l:d[l:i - 1][l:j - 1] + l:const,
                                \l:d[l:i - 2][l:j - 2] + l:const])
      else
        let l:d[l:i][l:j] = min([l:d[l:i - 1][l:j] + 1,
                                \l:d[l:i][l:j - 1] + 1,
                                \l:d[l:i - 1][l:j - 1] + l:const])
      endif
    endfor
  endfor
  return l:d[l:Alen][l:Blen]
endfunction


let s:dynamic = {
\   'levenshtein_distance': funcref('s:levenshtein_distance'),
\   'ristricted_damerau_levenshtein_distance': funcref('s:ristricted_damerau_levenshtein_distance'),
\ }
function! levenshtein#dynamic#import() abort
  return copy(s:dynamic)
endfunction

" vim:set sts=2 sw=2 tw=0:
