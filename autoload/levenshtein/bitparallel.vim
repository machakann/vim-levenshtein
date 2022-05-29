scriptencoding utf-8

" pattern_match_dict は文字列 A に含まれる文字をキーに持つ辞書。
" その値は整数であり、二進数表現でキーの文字がn文字目にある時、
" n桁目が1となる。例えば、A が "aba" の場合、
" {'a': 101 = 5, 'b':010 = 2}
" pattern_match_vector を生成する上で必須ではないが、
" 一つの文字列 A に対して、たくさんの候補 B との編集距離を計算
" する場合、Aの情報をキャッシュすることができる。
function! s:pattern_match_dict(A) abort
  let l:char_list = split(a:A, '\zs')
  let l:uniq_char_list = uniq(sort(copy(l:char_list)))
  let l:pmd = reduce(l:uniq_char_list, {acc, val -> extend(acc, {val: 0})}, {})
  let l:i = 0
  for l:c in l:char_list
    let l:pmd[l:c] = or(l:pmd[l:c], 1 << l:i)
    let l:i += 1
  endfor
  return l:pmd
endfunction


" pattern_match_vector は文字列 B の各文字が文字列 A の
" どの位置に出現するかという情報を収めたリスト
" 最初の要素は必ず0で以降の要素が B の各文字に相当する。
" 基本は値が0だが、Aに現れる文字の場合は pattern_match_dictの
" 対応するキーの値になる
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
  " Levenshtein距離Dはその定義上、D(A, B) == D(B, A)となる
  if l:Alen > v:numbersize && l:Blen > v:numbersize
    echoerr printf('levenshtein: Bit-parallel algorithm cannot handle two strings both longer than %s characters!', v:numbersize)
  elseif l:Alen > v:numbersize
    return s:_levenshtein_distance(a:B, a:A, l:Blen, l:Alen)
  elseif l:Blen > v:numbersize
    return s:_levenshtein_distance(a:A, a:B, l:Alen, l:Blen)
  endif
  " もし A と B の両方が v:numbersize 文字以下なら
  " s:_levenshtein_distance() の第二引数が短いほうが速度面で有利
  if l:Alen < l:Blen
    return s:_levenshtein_distance(a:B, a:A, l:Blen, l:Alen)
  endif
  return s:_levenshtein_distance(a:A, a:B, l:Alen, l:Blen)
endfunction


" Bit-parallelアルゴリズムによるLevenshtein距離の計算[1, 2]
" 文字列 A は v:numbersize 文字以下でなければいけない。
function! s:_levenshtein_distance(A, B, Alen, Blen) abort
  let l:pmd = s:pattern_match_dict(a:A)
  let l:pm = s:pattern_match_vector(a:B, l:pmd)
  let l:vp = invert(0)
  let l:vn = 0
  let l:d = a:Alen
  let l:ms = 1 << (l:d - 1)
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
    let l:vp = or(l:hn << 1, invert(or(l:d0, or(l:hp << 1, 1))))
    let l:vn = and(l:d0, or(l:hp << 1, 1))
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
  " Damerau-Levenshtein距離Dはその定義上、D(A, B) == D(B, A)となる
  if l:Alen > v:numbersize && l:Blen > v:numbersize
    echoerr printf('levenshtein: Bit-parallel algorithm cannot handle two strings both longer than %s characters!', v:numbersize)
  elseif l:Alen > v:numbersize
    return s:_ristricted_damerau_levenshtein_distance(a:B, a:A, l:Blen, l:Alen)
  elseif l:Blen > v:numbersize
    return s:_ristricted_damerau_levenshtein_distance(a:A, a:B, l:Alen, l:Blen)
  endif
  " もし A と B の両方が v:numbersize 文字以下なら
  " s:_ristricted_damerau_levenshtein_distance() の第二引数が短いほうが速度面で有利
  if l:Alen < l:Blen
    return s:_ristricted_damerau_levenshtein_distance(a:B, a:A, l:Blen, l:Alen)
  endif
  return s:_ristricted_damerau_levenshtein_distance(a:A, a:B, l:Alen, l:Blen)
endfunction


" Bit-parallelアルゴリズムによる制限Damerau-Levenshtein距離の計算[1, 2]
" 文字列 A は v:numbersize 文字以下でなければいけない
function! s:_ristricted_damerau_levenshtein_distance(A, B, Alen, Blen) abort
  let l:pmd = s:pattern_match_dict(a:A)
  let l:pm = s:pattern_match_vector(a:B, l:pmd)
  let l:vp = invert(0)
  let l:vn = 0
  let l:d = a:Alen
  let l:d0 = 0
  let l:ms = 1 << (l:d - 1)
  for l:j in range(1, a:Blen)
    let l:d0 = and(and(invert(l:d0), l:pm[l:j]) << 1, l:pm[l:j - 1])
    let l:d0 = or(or(or(l:d0, xor(and(l:pm[l:j], l:vp) + l:vp, l:vp)), l:pm[l:j]), l:vn)
    let l:hp = or(l:vn, invert(or(l:d0, l:vp)))
    let l:hn = and(l:d0, l:vp)
    if and(l:hp, l:ms) != 0
      let l:d += 1
    endif
    if and(l:hn, l:ms) != 0
      let l:d -= 1
    endif
    let l:vp = or(l:hn << 1, invert(or(l:d0, or(l:hp << 1, 1))))
    let l:vn = and(l:d0, or(l:hp << 1, 1))
  endfor
  return l:d
endfunction


let s:bitparallel = {
\   'levenshtein_distance': funcref('s:levenshtein_distance'),
\   'ristricted_damerau_levenshtein_distance': funcref('s:ristricted_damerau_levenshtein_distance'),
\ }
function! levenshtein#bitparallel#import() abort
  return copy(s:bitparallel)
endfunction

" Reference
" 1. "A Bit-Vector Algorithm for Computing Levenshtein and Damerau Edit Distances",
" Heikki Hyyrö, Journal Nordic Journal of Computing 10, 29-39, 2003
" 2. "Explaining and Extending the Bit-parallel Approximate String Matching Algorithm of Myers",
" Heikki Hyyrö, Technical report A2001-10 of the Department of Computer and Information Sciences, University of Tampere, 2001

" vim:set sts=2 sw=2 tw=0:
