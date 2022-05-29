" A vim script library to calculate Levenshtein distance and its variant
" Maintainer : Masaaki Nakamura <mckn{at}outlook.jp>
" License    : CC0
scriptencoding utf-8

let s:dynamic = levenshtein#dynamic#import()
if has('patch-8.2.5003')
  let s:bitparallel = levenshtein#bitparallel#import()
else
  let s:bitparallel = levenshtein#bitparallel_obsolete#import()
endif


function! levenshtein#levenshtein_distance(A, B) abort
  let l:Alen = strchars(a:A)
  let l:Blen = strchars(a:B)
  if l:Alen > v:numbersize && l:Blen > v:numbersize
    return s:dynamic.levenshtein_distance(a:A, a:B)
  endif
  return s:bitparallel.levenshtein_distance(a:A, a:B)
endfunction


function! levenshtein#ristricted_damerau_levenshtein_distance(A, B) abort
  let l:Alen = strchars(a:A)
  let l:Blen = strchars(a:B)
  if l:Alen > v:numbersize && l:Blen > v:numbersize
    return s:dynamic.ristricted_damerau_levenshtein_distance(a:A, a:B)
  endif
  return s:bitparallel.ristricted_damerau_levenshtein_distance(a:A, a:B)
endfunction


let s:levenshtein = {
\   'levenshtein_distance': funcref('levenshtein#levenshtein_distance'),
\   'ristricted_damerau_levenshtein_distance': funcref('levenshtein#ristricted_damerau_levenshtein_distance'),
\   'dynamic': s:dynamic,
\   'bitparallel': s:bitparallel,
\ }
function! levenshtein#import() abort
  return copy(s:levenshtein)
endfunction


" vim:set sts=2 sw=2 tw=0:
