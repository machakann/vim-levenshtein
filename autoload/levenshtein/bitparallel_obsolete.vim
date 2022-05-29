scriptencoding utf-8

function! s:pattern_match_dict(A) abort
  let l:char_list = split(a:A, '\zs')
  let l:uniq_char_list = uniq(sort(copy(l:char_list)))
  let l:pmd = reduce(l:uniq_char_list, {acc, val -> extend(acc, {val: 0})}, {})
  let l:i = 0
  for l:c in l:char_list
    let l:pmd[l:c] = or(l:pmd[l:c], float2nr(pow(2, l:i)))
    let l:i += 1
  endfor
  return l:pmd
endfunction


function! s:pattern_match_vector(B, pmd) abort
  let l:pm = repeat([0], strchars(a:B) + 1)
  let l:char_list = split(a:B, '\zs')
  let l:j = 0
  for l:c in l:char_list
    if has_key(a:pmd, l:c)
      let l:pm[l:j + 1] = a:pmd[l:c]
    endif
    let l:j += 1
  endfor
  return l:pm
endfunction


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

  let l:Alen = strchars(a:A)
  let l:Blen = strchars(a:B)
  if l:Alen > v:numbersize && l:Blen > v:numbersize
    echoerr printf('Bit-parallel algorithm cannot handle two strings both longer than %s characters!', v:numbersize)
  elseif l:Alen > v:numbersize
    return s:_levenshtein_distance(a:B, a:A, l:Blen, l:Alen)
  elseif l:Blen > v:numbersize
    return s:_levenshtein_distance(a:A, a:B, l:Alen, l:Blen)
  endif
  if l:Alen < l:Blen
    return s:_levenshtein_distance(a:B, a:A, l:Blen, l:Alen)
  endif
  return s:_levenshtein_distance(a:A, a:B, l:Alen, l:Blen)
endfunction


function! s:_levenshtein_distance(A, B, Alen, Blen) abort
  let l:pmd = s:pattern_match_dict(a:A)
  let l:pm = s:pattern_match_vector(a:B, l:pmd)
  let l:vp = invert(0)
  let l:vn = 0
  let l:d = a:Alen
  let l:ms = float2nr(pow(2, l:d - 1))
  for l:j in range(1, a:Blen)
    let l:d0 = or(or(xor(and(l:pm[l:j], l:vp) + l:vp, l:vp), l:pm[l:j]), l:vn)
    let l:hp = or(l:vn, invert(or(l:d0, l:vp)))
    let l:hn = and(l:d0, l:vp)
    if and(l:hp, l:ms) != 0
      let l:d += 1
    endif
    if and(l:hn, l:ms) != 0
      let l:d -= 1
    endif
    let l:vp = or(l:hn*2, invert(or(l:d0, or(l:hp*2, 1))))
    let l:vn = and(l:d0, or(l:hp*2, 1))
  endfor
  return l:d
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

  let l:Alen = strchars(a:A)
  let l:Blen = strchars(a:B)
  if l:Alen > v:numbersize && l:Blen > v:numbersize
    echoerr printf('Bit-parallel algorithm cannot handle two strings both longer than %s characters!', v:numbersize)
  elseif l:Alen > v:numbersize
    return s:_ristricted_damerau_levenshtein_distance(a:B, a:A, l:Blen, l:Alen)
  elseif l:Blen > v:numbersize
    return s:_ristricted_damerau_levenshtein_distance(a:A, a:B, l:Alen, l:Blen)
  endif
  if l:Alen < l:Blen
    return s:_ristricted_damerau_levenshtein_distance(a:B, a:A, l:Blen, l:Alen)
  endif
  return s:_ristricted_damerau_levenshtein_distance(a:A, a:B, l:Alen, l:Blen)
endfunction


function! s:_ristricted_damerau_levenshtein_distance(A, B, Alen, Blen) abort
  let l:pmd = s:pattern_match_dict(a:A)
  let l:pm = s:pattern_match_vector(a:B, l:pmd)
  let l:vp = invert(0)
  let l:vn = 0
  let l:d = a:Alen
  let l:d0 = 0
  let l:ms = float2nr(pow(2, l:d - 1))
  for l:j in range(1, a:Blen)
    let l:d0 = and(and(invert(l:d0), l:pm[l:j])*2, l:pm[l:j - 1])
    let l:d0 = or(or(or(l:d0, xor(and(l:pm[l:j], l:vp) + l:vp, l:vp)), l:pm[l:j]), l:vn)
    let l:hp = or(l:vn, invert(or(l:d0, l:vp)))
    let l:hn = and(l:d0, l:vp)
    if and(l:hp, l:ms) != 0
      let l:d += 1
    endif
    if and(l:hn, l:ms) != 0
      let l:d -= 1
    endif
    let l:vp = or(l:hn*2, invert(or(l:d0, or(l:hp*2, 1))))
    let l:vn = and(l:d0, or(l:hp*2, 1))
  endfor
  return l:d
endfunction


let s:bitparallel_obsolete = {
\   'levenshtein_distance': funcref('s:levenshtein_distance'),
\   'ristricted_damerau_levenshtein_distance': funcref('s:ristricted_damerau_levenshtein_distance'),
\ }
function! levenshtein#bitparallel_obsolete#import() abort
  return copy(s:bitparallel_obsolete)
endfunction

" Reference
" 1. "A Bit-Vector Algorithm for Computing Levenshtein and Damerau Edit Distances",
" Heikki Hyyrö, Journal Nordic Journal of Computing 10, 29-39, 2003
" 2. "Explaining and Extending the Bit-parallel Approximate String Matching Algorithm of Myers",
" Heikki Hyyrö, Technical report A2001-10 of the Department of Computer and Information Sciences, University of Tampere, 2001

" vim:set sts=2 sw=2 tw=0:
