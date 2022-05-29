scriptencoding utf-8
let s:assert = themis#helper('assert')
let s:suite = themis#suite('dynamic-programming')
let s:dp = levenshtein#dynamic#import()


function! s:suite.levenshtein() abort
  call s:assert.equals(
  \ s:dp.levenshtein_distance("", "abc"), 3,  printf('Failed at line %d',  expand('<sflnum>')))

  call s:assert.equals(
  \ s:dp.levenshtein_distance("abc", ""), 3,  printf('Failed at line %d',  expand('<sflnum>')))

  call s:assert.equals(
  \ s:dp.levenshtein_distance("", ""), 0,  printf('Failed at line %d',  expand('<sflnum>')))

  call s:assert.equals(
  \ s:dp.levenshtein_distance("abc", "abc"), 0,  printf('Failed at line %d',  expand('<sflnum>')))

  call s:assert.equals(
  \ s:dp.levenshtein_distance("ab", "abc"), 1,  printf('Failed at line %d',  expand('<sflnum>')))

  call s:assert.equals(
  \ s:dp.levenshtein_distance("abcd", "abc"), 1,  printf('Failed at line %d',  expand('<sflnum>')))

  call s:assert.equals(
  \ s:dp.levenshtein_distance("abcde", "abc"), 2,  printf('Failed at line %d',  expand('<sflnum>')))

  call s:assert.equals(
  \ s:dp.levenshtein_distance("abc", "abcde"), 2,  printf('Failed at line %d',  expand('<sflnum>')))

  call s:assert.equals(
  \ s:dp.levenshtein_distance("abd", "abc"), 1,  printf('Failed at line %d',  expand('<sflnum>')))

  call s:assert.equals(
  \ s:dp.levenshtein_distance("acb", "abc"), 2,  printf('Failed at line %d',  expand('<sflnum>')))

  call s:assert.equals(
  \ s:dp.levenshtein_distance("def", "abc"), 3,  printf('Failed at line %d',  expand('<sflnum>')))

  call s:assert.equals(
  \ s:dp.levenshtein_distance("defg", "abc"), 4,  printf('Failed at line %d',  expand('<sflnum>')))

  call s:assert.equals(
  \ s:dp.levenshtein_distance("efg", "abcd"), 4,  printf('Failed at line %d',  expand('<sflnum>')))

  call s:assert.equals(
  \ s:dp.levenshtein_distance("αβγ", "αβγ"), 0,  printf('Failed at line %d',  expand('<sflnum>')))

  call s:assert.equals(
  \ s:dp.levenshtein_distance("αβ", "αβγ"), 1,  printf('Failed at line %d',  expand('<sflnum>')))

  call s:assert.equals(
  \ s:dp.levenshtein_distance("αβγδ", "αβγ"), 1,  printf('Failed at line %d',  expand('<sflnum>')))

  call s:assert.equals(
  \ s:dp.levenshtein_distance("αβδ", "αβγ"), 1,  printf('Failed at line %d',  expand('<sflnum>')))

  call s:assert.equals(
  \ s:dp.levenshtein_distance("αγβ", "αβγ"), 2,  printf('Failed at line %d',  expand('<sflnum>')))

  call s:assert.equals(
  \ s:dp.levenshtein_distance("δεζ", "αβγ"), 3,  printf('Failed at line %d',  expand('<sflnum>')))

  call s:assert.equals(
  \ s:dp.levenshtein_distance("δεζη", "αβγ"), 4,  printf('Failed at line %d',  expand('<sflnum>')))

  call s:assert.equals(
  \ s:dp.levenshtein_distance("εζη", "αβγδ"), 4,  printf('Failed at line %d',  expand('<sflnum>')))
endfunction


function! s:suite.ristricted_damerau_levenshtein() abort
  call s:assert.equals(
  \ s:dp.ristricted_damerau_levenshtein_distance("", "abc"), 3,  printf('Failed at line %d',  expand('<sflnum>')))

  call s:assert.equals(
  \ s:dp.ristricted_damerau_levenshtein_distance("abc", ""), 3,  printf('Failed at line %d',  expand('<sflnum>')))

  call s:assert.equals(
  \ s:dp.ristricted_damerau_levenshtein_distance("", ""), 0,  printf('Failed at line %d',  expand('<sflnum>')))

  call s:assert.equals(
  \ s:dp.ristricted_damerau_levenshtein_distance("abc", "abc"), 0,  printf('Failed at line %d',  expand('<sflnum>')))

  call s:assert.equals(
  \ s:dp.ristricted_damerau_levenshtein_distance("ab", "abc"), 1,  printf('Failed at line %d',  expand('<sflnum>')))

  call s:assert.equals(
  \ s:dp.ristricted_damerau_levenshtein_distance("abcd", "abc"), 1,  printf('Failed at line %d',  expand('<sflnum>')))

  call s:assert.equals(
  \ s:dp.ristricted_damerau_levenshtein_distance("abcde", "abc"), 2,  printf('Failed at line %d',  expand('<sflnum>')))

  call s:assert.equals(
  \ s:dp.ristricted_damerau_levenshtein_distance("abc", "abcde"), 2,  printf('Failed at line %d',  expand('<sflnum>')))

  call s:assert.equals(
  \ s:dp.ristricted_damerau_levenshtein_distance("abd", "abc"), 1,  printf('Failed at line %d',  expand('<sflnum>')))

  call s:assert.equals(
  \ s:dp.ristricted_damerau_levenshtein_distance("acb", "abc"), 1,  printf('Failed at line %d',  expand('<sflnum>')))

  call s:assert.equals(
  \ s:dp.ristricted_damerau_levenshtein_distance("def", "abc"), 3,  printf('Failed at line %d',  expand('<sflnum>')))

  call s:assert.equals(
  \ s:dp.ristricted_damerau_levenshtein_distance("defg", "abc"), 4,  printf('Failed at line %d',  expand('<sflnum>')))

  call s:assert.equals(
  \ s:dp.ristricted_damerau_levenshtein_distance("efg", "abcd"), 4,  printf('Failed at line %d',  expand('<sflnum>')))

  call s:assert.equals(
  \ s:dp.ristricted_damerau_levenshtein_distance("αβγ", "αβγ"), 0,  printf('Failed at line %d',  expand('<sflnum>')))

  call s:assert.equals(
  \ s:dp.ristricted_damerau_levenshtein_distance("αβ", "αβγ"), 1,  printf('Failed at line %d',  expand('<sflnum>')))

  call s:assert.equals(
  \ s:dp.ristricted_damerau_levenshtein_distance("αβγδ", "αβγ"), 1,  printf('Failed at line %d',  expand('<sflnum>')))

  call s:assert.equals(
  \ s:dp.ristricted_damerau_levenshtein_distance("αβδ", "αβγ"), 1,  printf('Failed at line %d',  expand('<sflnum>')))

  call s:assert.equals(
  \ s:dp.ristricted_damerau_levenshtein_distance("αγβ", "αβγ"), 1,  printf('Failed at line %d',  expand('<sflnum>')))

  call s:assert.equals(
  \ s:dp.ristricted_damerau_levenshtein_distance("δεζ", "αβγ"), 3,  printf('Failed at line %d',  expand('<sflnum>')))

  call s:assert.equals(
  \ s:dp.ristricted_damerau_levenshtein_distance("δεζη", "αβγ"), 4,  printf('Failed at line %d',  expand('<sflnum>')))

  call s:assert.equals(
  \ s:dp.ristricted_damerau_levenshtein_distance("εζη", "αβγδ"), 4,  printf('Failed at line %d',  expand('<sflnum>')))

  call s:assert.equals(
  \ s:dp.ristricted_damerau_levenshtein_distance('RICK', 'RICK'), 0,  printf('Failed at line %d',  expand('<sflnum>')))

  call s:assert.equals(
  \ s:dp.ristricted_damerau_levenshtein_distance('MARTHA', 'MARHTA'), 1,  printf('Failed at line %d',  expand('<sflnum>')))

  call s:assert.equals(
  \ s:dp.ristricted_damerau_levenshtein_distance('DWAYNE', 'DUANE'), 2,  printf('Failed at line %d',  expand('<sflnum>')))

  call s:assert.equals(
  \ s:dp.ristricted_damerau_levenshtein_distance('DIXON',  'DICKSONX'), 4,  printf('Failed at line %d',  expand('<sflnum>')))

  call s:assert.equals(
  \ s:dp.ristricted_damerau_levenshtein_distance('ABCDE',  'FGHIJ'), 5,  printf('Failed at line %d',  expand('<sflnum>')))
endfunction

" vim:set sts=2 sw=2 tw=0:
