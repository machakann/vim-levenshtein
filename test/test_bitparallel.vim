scriptencoding utf-8
let s:assert = themis#helper('assert')
call themis#helper('command').with(s:assert)
let s:suite = themis#suite('bit-parallel:')
let s:bp = levenshtein#bitparallel#import()


function! s:suite.levenshtein() abort
  call s:assert.equals(
  \ s:bp.levenshtein_distance("", "abc"), 3, printf('Failed at line %d', expand('<sflnum>')))

  call s:assert.equals(
  \ s:bp.levenshtein_distance("abc", ""), 3, printf('Failed at line %d', expand('<sflnum>')))

  call s:assert.equals(
  \ s:bp.levenshtein_distance("", ""), 0, printf('Failed at line %d', expand('<sflnum>')))

  call s:assert.equals(
  \ s:bp.levenshtein_distance("abc", "abc"), 0, printf('Failed at line %d', expand('<sflnum>')))

  call s:assert.equals(
  \ s:bp.levenshtein_distance("ab", "abc"), 1, printf('Failed at line %d', expand('<sflnum>')))

  call s:assert.equals(
  \ s:bp.levenshtein_distance("abcd", "abc"), 1, printf('Failed at line %d', expand('<sflnum>')))

  call s:assert.equals(
  \ s:bp.levenshtein_distance("abcde", "abc"), 2, printf('Failed at line %d', expand('<sflnum>')))

  call s:assert.equals(
  \ s:bp.levenshtein_distance("abc", "abcde"), 2, printf('Failed at line %d', expand('<sflnum>')))

  call s:assert.equals(
  \ s:bp.levenshtein_distance("abd", "abc"), 1, printf('Failed at line %d', expand('<sflnum>')))

  call s:assert.equals(
  \ s:bp.levenshtein_distance("acb", "abc"), 2, printf('Failed at line %d', expand('<sflnum>')))

  call s:assert.equals(
  \ s:bp.levenshtein_distance("def", "abc"), 3, printf('Failed at line %d', expand('<sflnum>')))

  call s:assert.equals(
  \ s:bp.levenshtein_distance("defg", "abc"), 4, printf('Failed at line %d', expand('<sflnum>')))

  call s:assert.equals(
  \ s:bp.levenshtein_distance("efg", "abcd"), 4, printf('Failed at line %d', expand('<sflnum>')))

  call s:assert.equals(
  \ s:bp.levenshtein_distance("αβγ", "αβγ"), 0, printf('Failed at line %d', expand('<sflnum>')))

  call s:assert.equals(
  \ s:bp.levenshtein_distance("αβ", "αβγ"), 1, printf('Failed at line %d', expand('<sflnum>')))

  call s:assert.equals(
  \ s:bp.levenshtein_distance("αβγδ", "αβγ"), 1, printf('Failed at line %d', expand('<sflnum>')))

  call s:assert.equals(
  \ s:bp.levenshtein_distance("αβδ", "αβγ"), 1, printf('Failed at line %d', expand('<sflnum>')))

  call s:assert.equals(
  \ s:bp.levenshtein_distance("αγβ", "αβγ"), 2, printf('Failed at line %d', expand('<sflnum>')))

  call s:assert.equals(
  \ s:bp.levenshtein_distance("δεζ", "αβγ"), 3, printf('Failed at line %d', expand('<sflnum>')))

  call s:assert.equals(
  \ s:bp.levenshtein_distance("δεζη", "αβγ"), 4, printf('Failed at line %d', expand('<sflnum>')))

  call s:assert.equals(
  \ s:bp.levenshtein_distance("εζη", "αβγδ"), 4, printf('Failed at line %d', expand('<sflnum>')))
endfunction


function! s:suite.ristricted_damerau_levenshtein() abort
  call s:assert.equals(
  \ s:bp.ristricted_damerau_levenshtein_distance("", "abc"), 3, printf('Failed at line %d', expand('<sflnum>')))

  call s:assert.equals(
  \ s:bp.ristricted_damerau_levenshtein_distance("abc", ""), 3, printf('Failed at line %d', expand('<sflnum>')))

  call s:assert.equals(
  \ s:bp.ristricted_damerau_levenshtein_distance("", ""), 0, printf('Failed at line %d', expand('<sflnum>')))

  call s:assert.equals(
  \ s:bp.ristricted_damerau_levenshtein_distance("abc", "abc"), 0, printf('Failed at line %d', expand('<sflnum>')))

  call s:assert.equals(
  \ s:bp.ristricted_damerau_levenshtein_distance("ab", "abc"), 1, printf('Failed at line %d', expand('<sflnum>')))

  call s:assert.equals(
  \ s:bp.ristricted_damerau_levenshtein_distance("abcd", "abc"), 1, printf('Failed at line %d', expand('<sflnum>')))

  call s:assert.equals(
  \ s:bp.ristricted_damerau_levenshtein_distance("abcde", "abc"), 2, printf('Failed at line %d', expand('<sflnum>')))

  call s:assert.equals(
  \ s:bp.ristricted_damerau_levenshtein_distance("abc", "abcde"), 2, printf('Failed at line %d', expand('<sflnum>')))

  call s:assert.equals(
  \ s:bp.ristricted_damerau_levenshtein_distance("abd", "abc"), 1, printf('Failed at line %d', expand('<sflnum>')))

  call s:assert.equals(
  \ s:bp.ristricted_damerau_levenshtein_distance("acb", "abc"), 1, printf('Failed at line %d', expand('<sflnum>')))

  call s:assert.equals(
  \ s:bp.ristricted_damerau_levenshtein_distance("def", "abc"), 3, printf('Failed at line %d', expand('<sflnum>')))

  call s:assert.equals(
  \ s:bp.ristricted_damerau_levenshtein_distance("defg", "abc"), 4, printf('Failed at line %d', expand('<sflnum>')))

  call s:assert.equals(
  \ s:bp.ristricted_damerau_levenshtein_distance("efg", "abcd"), 4, printf('Failed at line %d', expand('<sflnum>')))

  call s:assert.equals(
  \ s:bp.ristricted_damerau_levenshtein_distance("αβγ", "αβγ"), 0, printf('Failed at line %d', expand('<sflnum>')))

  call s:assert.equals(
  \ s:bp.ristricted_damerau_levenshtein_distance("αβ", "αβγ"), 1, printf('Failed at line %d', expand('<sflnum>')))

  call s:assert.equals(
  \ s:bp.ristricted_damerau_levenshtein_distance("αβγδ", "αβγ"), 1, printf('Failed at line %d', expand('<sflnum>')))

  call s:assert.equals(
  \ s:bp.ristricted_damerau_levenshtein_distance("αβδ", "αβγ"), 1, printf('Failed at line %d', expand('<sflnum>')))

  call s:assert.equals(
  \ s:bp.ristricted_damerau_levenshtein_distance("αγβ", "αβγ"), 1, printf('Failed at line %d', expand('<sflnum>')))

  call s:assert.equals(
  \ s:bp.ristricted_damerau_levenshtein_distance("δεζ", "αβγ"), 3, printf('Failed at line %d', expand('<sflnum>')))

  call s:assert.equals(
  \ s:bp.ristricted_damerau_levenshtein_distance("δεζη", "αβγ"), 4, printf('Failed at line %d', expand('<sflnum>')))

  call s:assert.equals(
  \ s:bp.ristricted_damerau_levenshtein_distance("εζη", "αβγδ"), 4, printf('Failed at line %d', expand('<sflnum>')))

  call s:assert.equals(
  \ s:bp.ristricted_damerau_levenshtein_distance('RICK', 'RICK'), 0, printf('Failed at line %d', expand('<sflnum>')))

  call s:assert.equals(
  \ s:bp.ristricted_damerau_levenshtein_distance('MARTHA', 'MARHTA'), 1, printf('Failed at line %d', expand('<sflnum>')))

  call s:assert.equals(
  \ s:bp.ristricted_damerau_levenshtein_distance('DWAYNE', 'DUANE'), 2, printf('Failed at line %d', expand('<sflnum>')))

  call s:assert.equals(
  \ s:bp.ristricted_damerau_levenshtein_distance('DIXON',  'DICKSONX'), 4, printf('Failed at line %d', expand('<sflnum>')))

  call s:assert.equals(
  \ s:bp.ristricted_damerau_levenshtein_distance('ABCDE',  'FGHIJ'), 5, printf('Failed at line %d', expand('<sflnum>')))
endfunction

" vim:set sts=2 sw=2 tw=0:
