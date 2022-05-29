scriptencoding utf-8
let s:assert = themis#helper('assert')
call themis#helper('command').with(s:assert)
let s:suite = themis#suite('levenshtein:')
let s:levenshtein = levenshtein#import()


function! s:suite.func_levenshtein() abort
  call s:assert.equals(
  \ levenshtein#levenshtein_distance("", "abc"), 3, printf('Failed at line %d', expand('<sflnum>')))

  call s:assert.equals(
  \ levenshtein#levenshtein_distance("abc", ""), 3, printf('Failed at line %d', expand('<sflnum>')))

  call s:assert.equals(
  \ levenshtein#levenshtein_distance("", ""), 0, printf('Failed at line %d', expand('<sflnum>')))

  call s:assert.equals(
  \ levenshtein#levenshtein_distance("abc", "abc"), 0, printf('Failed at line %d', expand('<sflnum>')))

  call s:assert.equals(
  \ levenshtein#levenshtein_distance("ab", "abc"), 1, printf('Failed at line %d', expand('<sflnum>')))

  call s:assert.equals(
  \ levenshtein#levenshtein_distance("abcd", "abc"), 1, printf('Failed at line %d', expand('<sflnum>')))

  call s:assert.equals(
  \ levenshtein#levenshtein_distance("abcde", "abc"), 2, printf('Failed at line %d', expand('<sflnum>')))

  call s:assert.equals(
  \ levenshtein#levenshtein_distance("abc", "abcde"), 2, printf('Failed at line %d', expand('<sflnum>')))

  call s:assert.equals(
  \ levenshtein#levenshtein_distance("abd", "abc"), 1, printf('Failed at line %d', expand('<sflnum>')))

  call s:assert.equals(
  \ levenshtein#levenshtein_distance("acb", "abc"), 2, printf('Failed at line %d', expand('<sflnum>')))

  call s:assert.equals(
  \ levenshtein#levenshtein_distance("def", "abc"), 3, printf('Failed at line %d', expand('<sflnum>')))

  call s:assert.equals(
  \ levenshtein#levenshtein_distance("defg", "abc"), 4, printf('Failed at line %d', expand('<sflnum>')))

  call s:assert.equals(
  \ levenshtein#levenshtein_distance("efg", "abcd"), 4, printf('Failed at line %d', expand('<sflnum>')))

  call s:assert.equals(
  \ levenshtein#levenshtein_distance(repeat("a", 65), "abcd"), 64, printf('Failed at line %d', expand('<sflnum>')))

  call s:assert.equals(
  \ levenshtein#levenshtein_distance("abcd", repeat("b", 65)), 64, printf('Failed at line %d', expand('<sflnum>')))

  call s:assert.equals(
  \ levenshtein#levenshtein_distance(repeat("a", 65), repeat("b", 65)), 65, printf('Failed at line %d', expand('<sflnum>')))

  call s:assert.equals(
  \ levenshtein#levenshtein_distance("αβγ", "αβγ"), 0, printf('Failed at line %d', expand('<sflnum>')))

  call s:assert.equals(
  \ levenshtein#levenshtein_distance("αβ", "αβγ"), 1, printf('Failed at line %d', expand('<sflnum>')))

  call s:assert.equals(
  \ levenshtein#levenshtein_distance("αβγδ", "αβγ"), 1, printf('Failed at line %d', expand('<sflnum>')))

  call s:assert.equals(
  \ levenshtein#levenshtein_distance("αβδ", "αβγ"), 1, printf('Failed at line %d', expand('<sflnum>')))

  call s:assert.equals(
  \ levenshtein#levenshtein_distance("αγβ", "αβγ"), 2, printf('Failed at line %d', expand('<sflnum>')))

  call s:assert.equals(
  \ levenshtein#levenshtein_distance("δεζ", "αβγ"), 3, printf('Failed at line %d', expand('<sflnum>')))

  call s:assert.equals(
  \ levenshtein#levenshtein_distance("δεζη", "αβγ"), 4, printf('Failed at line %d', expand('<sflnum>')))

  call s:assert.equals(
  \ levenshtein#levenshtein_distance("εζη", "αβγδ"), 4, printf('Failed at line %d', expand('<sflnum>')))

  call s:assert.equals(
  \ levenshtein#levenshtein_distance(repeat("α", 65), "abcd"), 65, printf('Failed at line %d', expand('<sflnum>')))

  call s:assert.equals(
  \ levenshtein#levenshtein_distance("abcd", repeat("β", 65)), 65, printf('Failed at line %d', expand('<sflnum>')))

  call s:assert.equals(
  \ levenshtein#levenshtein_distance(repeat("α", 65), repeat("β", 65)), 65, printf('Failed at line %d', expand('<sflnum>')))
endfunction


function! s:suite.module_levenshtein() abort
  call s:assert.equals(
  \ s:levenshtein.levenshtein_distance("", "abc"), 3, printf('Failed at line %d', expand('<sflnum>')))

  call s:assert.equals(
  \ s:levenshtein.levenshtein_distance("abc", ""), 3, printf('Failed at line %d', expand('<sflnum>')))

  call s:assert.equals(
  \ s:levenshtein.levenshtein_distance("", ""), 0, printf('Failed at line %d', expand('<sflnum>')))

  call s:assert.equals(
  \ s:levenshtein.levenshtein_distance("abc", "abc"), 0, printf('Failed at line %d', expand('<sflnum>')))

  call s:assert.equals(
  \ s:levenshtein.levenshtein_distance("ab", "abc"), 1, printf('Failed at line %d', expand('<sflnum>')))

  call s:assert.equals(
  \ s:levenshtein.levenshtein_distance("abcd", "abc"), 1, printf('Failed at line %d', expand('<sflnum>')))

  call s:assert.equals(
  \ s:levenshtein.levenshtein_distance("abcde", "abc"), 2, printf('Failed at line %d', expand('<sflnum>')))

  call s:assert.equals(
  \ s:levenshtein.levenshtein_distance("abc", "abcde"), 2, printf('Failed at line %d', expand('<sflnum>')))

  call s:assert.equals(
  \ s:levenshtein.levenshtein_distance("abd", "abc"), 1, printf('Failed at line %d', expand('<sflnum>')))

  call s:assert.equals(
  \ s:levenshtein.levenshtein_distance("acb", "abc"), 2, printf('Failed at line %d', expand('<sflnum>')))

  call s:assert.equals(
  \ s:levenshtein.levenshtein_distance("def", "abc"), 3, printf('Failed at line %d', expand('<sflnum>')))

  call s:assert.equals(
  \ s:levenshtein.levenshtein_distance("defg", "abc"), 4, printf('Failed at line %d', expand('<sflnum>')))

  call s:assert.equals(
  \ s:levenshtein.levenshtein_distance("efg", "abcd"), 4, printf('Failed at line %d', expand('<sflnum>')))

  call s:assert.equals(
  \ s:levenshtein.levenshtein_distance(repeat("a", 65), "abcd"), 64, printf('Failed at line %d', expand('<sflnum>')))

  call s:assert.equals(
  \ s:levenshtein.levenshtein_distance("abcd", repeat("b", 65)), 64, printf('Failed at line %d', expand('<sflnum>')))

  call s:assert.equals(
  \ s:levenshtein.levenshtein_distance(repeat("a", 65), repeat("b", 65)), 65, printf('Failed at line %d', expand('<sflnum>')))

  call s:assert.equals(
  \ s:levenshtein.levenshtein_distance("αβγ", "αβγ"), 0, printf('Failed at line %d', expand('<sflnum>')))

  call s:assert.equals(
  \ s:levenshtein.levenshtein_distance("αβ", "αβγ"), 1, printf('Failed at line %d', expand('<sflnum>')))

  call s:assert.equals(
  \ s:levenshtein.levenshtein_distance("αβγδ", "αβγ"), 1, printf('Failed at line %d', expand('<sflnum>')))

  call s:assert.equals(
  \ s:levenshtein.levenshtein_distance("αβδ", "αβγ"), 1, printf('Failed at line %d', expand('<sflnum>')))

  call s:assert.equals(
  \ s:levenshtein.levenshtein_distance("αγβ", "αβγ"), 2, printf('Failed at line %d', expand('<sflnum>')))

  call s:assert.equals(
  \ s:levenshtein.levenshtein_distance("δεζ", "αβγ"), 3, printf('Failed at line %d', expand('<sflnum>')))

  call s:assert.equals(
  \ s:levenshtein.levenshtein_distance("δεζη", "αβγ"), 4, printf('Failed at line %d', expand('<sflnum>')))

  call s:assert.equals(
  \ s:levenshtein.levenshtein_distance("εζη", "αβγδ"), 4, printf('Failed at line %d', expand('<sflnum>')))

  call s:assert.equals(
  \ s:levenshtein.levenshtein_distance(repeat("α", 65), "abcd"), 65, printf('Failed at line %d', expand('<sflnum>')))

  call s:assert.equals(
  \ s:levenshtein.levenshtein_distance("abcd", repeat("β", 65)), 65, printf('Failed at line %d', expand('<sflnum>')))

  call s:assert.equals(
  \ s:levenshtein.levenshtein_distance(repeat("α", 65), repeat("β", 65)), 65, printf('Failed at line %d', expand('<sflnum>')))
endfunction


function! s:suite.func_ristricted_damerau_levenshtein() abort
  call s:assert.equals(
  \ levenshtein#ristricted_damerau_levenshtein_distance("", "abc"), 3, printf('Failed at line %d', expand('<sflnum>')))

  call s:assert.equals(
  \ levenshtein#ristricted_damerau_levenshtein_distance("abc", ""), 3, printf('Failed at line %d', expand('<sflnum>')))

  call s:assert.equals(
  \ levenshtein#ristricted_damerau_levenshtein_distance("", ""), 0, printf('Failed at line %d', expand('<sflnum>')))

  call s:assert.equals(
  \ levenshtein#ristricted_damerau_levenshtein_distance("abc", "abc"), 0, printf('Failed at line %d', expand('<sflnum>')))

  call s:assert.equals(
  \ levenshtein#ristricted_damerau_levenshtein_distance("ab", "abc"), 1, printf('Failed at line %d', expand('<sflnum>')))

  call s:assert.equals(
  \ levenshtein#ristricted_damerau_levenshtein_distance("abcd", "abc"), 1, printf('Failed at line %d', expand('<sflnum>')))

  call s:assert.equals(
  \ levenshtein#ristricted_damerau_levenshtein_distance("abcde", "abc"), 2, printf('Failed at line %d', expand('<sflnum>')))

  call s:assert.equals(
  \ levenshtein#ristricted_damerau_levenshtein_distance("abc", "abcde"), 2, printf('Failed at line %d', expand('<sflnum>')))

  call s:assert.equals(
  \ levenshtein#ristricted_damerau_levenshtein_distance("abd", "abc"), 1, printf('Failed at line %d', expand('<sflnum>')))

  call s:assert.equals(
  \ levenshtein#ristricted_damerau_levenshtein_distance("acb", "abc"), 1, printf('Failed at line %d', expand('<sflnum>')))

  call s:assert.equals(
  \ levenshtein#ristricted_damerau_levenshtein_distance("def", "abc"), 3, printf('Failed at line %d', expand('<sflnum>')))

  call s:assert.equals(
  \ levenshtein#ristricted_damerau_levenshtein_distance("defg", "abc"), 4, printf('Failed at line %d', expand('<sflnum>')))

  call s:assert.equals(
  \ levenshtein#ristricted_damerau_levenshtein_distance("efg", "abcd"), 4, printf('Failed at line %d', expand('<sflnum>')))

  call s:assert.equals(
  \ levenshtein#ristricted_damerau_levenshtein_distance(repeat("a", 65), "abcd"), 64, printf('Failed at line %d', expand('<sflnum>')))

  call s:assert.equals(
  \ levenshtein#ristricted_damerau_levenshtein_distance("abcd", repeat("b", 65)), 64, printf('Failed at line %d', expand('<sflnum>')))

  call s:assert.equals(
  \ levenshtein#ristricted_damerau_levenshtein_distance(repeat("a", 65), repeat("b", 65)), 65, printf('Failed at line %d', expand('<sflnum>')))

  call s:assert.equals(
  \ levenshtein#ristricted_damerau_levenshtein_distance("αβγ", "αβγ"), 0, printf('Failed at line %d', expand('<sflnum>')))

  call s:assert.equals(
  \ levenshtein#ristricted_damerau_levenshtein_distance("αβ", "αβγ"), 1, printf('Failed at line %d', expand('<sflnum>')))

  call s:assert.equals(
  \ levenshtein#ristricted_damerau_levenshtein_distance("αβγδ", "αβγ"), 1, printf('Failed at line %d', expand('<sflnum>')))

  call s:assert.equals(
  \ levenshtein#ristricted_damerau_levenshtein_distance("αβδ", "αβγ"), 1, printf('Failed at line %d', expand('<sflnum>')))

  call s:assert.equals(
  \ levenshtein#ristricted_damerau_levenshtein_distance("αγβ", "αβγ"), 1, printf('Failed at line %d', expand('<sflnum>')))

  call s:assert.equals(
  \ levenshtein#ristricted_damerau_levenshtein_distance("δεζ", "αβγ"), 3, printf('Failed at line %d', expand('<sflnum>')))

  call s:assert.equals(
  \ levenshtein#ristricted_damerau_levenshtein_distance("δεζη", "αβγ"), 4, printf('Failed at line %d', expand('<sflnum>')))

  call s:assert.equals(
  \ levenshtein#ristricted_damerau_levenshtein_distance("εζη", "αβγδ"), 4, printf('Failed at line %d', expand('<sflnum>')))

  call s:assert.equals(
  \ levenshtein#ristricted_damerau_levenshtein_distance('RICK', 'RICK'), 0, printf('Failed at line %d', expand('<sflnum>')))

  call s:assert.equals(
  \ levenshtein#ristricted_damerau_levenshtein_distance('MARTHA', 'MARHTA'), 1, printf('Failed at line %d', expand('<sflnum>')))

  call s:assert.equals(
  \ levenshtein#ristricted_damerau_levenshtein_distance('DWAYNE', 'DUANE'), 2, printf('Failed at line %d', expand('<sflnum>')))

  call s:assert.equals(
  \ levenshtein#ristricted_damerau_levenshtein_distance('DIXON',  'DICKSONX'), 4, printf('Failed at line %d', expand('<sflnum>')))

  call s:assert.equals(
  \ levenshtein#ristricted_damerau_levenshtein_distance('ABCDE',  'FGHIJ'), 5, printf('Failed at line %d', expand('<sflnum>')))

  call s:assert.equals(
  \ levenshtein#ristricted_damerau_levenshtein_distance(repeat("α", 65), "abcd"), 65, printf('Failed at line %d', expand('<sflnum>')))

  call s:assert.equals(
  \ levenshtein#ristricted_damerau_levenshtein_distance("abcd", repeat("β", 65)), 65, printf('Failed at line %d', expand('<sflnum>')))

  call s:assert.equals(
  \ levenshtein#ristricted_damerau_levenshtein_distance(repeat("α", 65), repeat("β", 65)), 65, printf('Failed at line %d', expand('<sflnum>')))
endfunction


function! s:suite.module_ristricted_damerau_levenshtein() abort
  call s:assert.equals(
  \ levenshtein#ristricted_damerau_levenshtein_distance("", "abc"), 3, printf('Failed at line %d', expand('<sflnum>')))

  call s:assert.equals(
  \ levenshtein#ristricted_damerau_levenshtein_distance("abc", ""), 3, printf('Failed at line %d', expand('<sflnum>')))

  call s:assert.equals(
  \ levenshtein#ristricted_damerau_levenshtein_distance("", ""), 0, printf('Failed at line %d', expand('<sflnum>')))

  call s:assert.equals(
  \ levenshtein#ristricted_damerau_levenshtein_distance("abc", "abc"), 0, printf('Failed at line %d', expand('<sflnum>')))

  call s:assert.equals(
  \ levenshtein#ristricted_damerau_levenshtein_distance("ab", "abc"), 1, printf('Failed at line %d', expand('<sflnum>')))

  call s:assert.equals(
  \ levenshtein#ristricted_damerau_levenshtein_distance("abcd", "abc"), 1, printf('Failed at line %d', expand('<sflnum>')))

  call s:assert.equals(
  \ levenshtein#ristricted_damerau_levenshtein_distance("abcde", "abc"), 2, printf('Failed at line %d', expand('<sflnum>')))

  call s:assert.equals(
  \ levenshtein#ristricted_damerau_levenshtein_distance("abc", "abcde"), 2, printf('Failed at line %d', expand('<sflnum>')))

  call s:assert.equals(
  \ levenshtein#ristricted_damerau_levenshtein_distance("abd", "abc"), 1, printf('Failed at line %d', expand('<sflnum>')))

  call s:assert.equals(
  \ levenshtein#ristricted_damerau_levenshtein_distance("acb", "abc"), 1, printf('Failed at line %d', expand('<sflnum>')))

  call s:assert.equals(
  \ levenshtein#ristricted_damerau_levenshtein_distance("def", "abc"), 3, printf('Failed at line %d', expand('<sflnum>')))

  call s:assert.equals(
  \ levenshtein#ristricted_damerau_levenshtein_distance("defg", "abc"), 4, printf('Failed at line %d', expand('<sflnum>')))

  call s:assert.equals(
  \ levenshtein#ristricted_damerau_levenshtein_distance("efg", "abcd"), 4, printf('Failed at line %d', expand('<sflnum>')))

  call s:assert.equals(
  \ levenshtein#ristricted_damerau_levenshtein_distance(repeat("a", 65), "abcd"), 64, printf('Failed at line %d', expand('<sflnum>')))

  call s:assert.equals(
  \ levenshtein#ristricted_damerau_levenshtein_distance("abcd", repeat("b", 65)), 64, printf('Failed at line %d', expand('<sflnum>')))

  call s:assert.equals(
  \ levenshtein#ristricted_damerau_levenshtein_distance(repeat("a", 65), repeat("b", 65)), 65, printf('Failed at line %d', expand('<sflnum>')))

  call s:assert.equals(
  \ levenshtein#ristricted_damerau_levenshtein_distance("αβγ", "αβγ"), 0, printf('Failed at line %d', expand('<sflnum>')))

  call s:assert.equals(
  \ levenshtein#ristricted_damerau_levenshtein_distance("αβ", "αβγ"), 1, printf('Failed at line %d', expand('<sflnum>')))

  call s:assert.equals(
  \ levenshtein#ristricted_damerau_levenshtein_distance("αβγδ", "αβγ"), 1, printf('Failed at line %d', expand('<sflnum>')))

  call s:assert.equals(
  \ levenshtein#ristricted_damerau_levenshtein_distance("αβδ", "αβγ"), 1, printf('Failed at line %d', expand('<sflnum>')))

  call s:assert.equals(
  \ levenshtein#ristricted_damerau_levenshtein_distance("αγβ", "αβγ"), 1, printf('Failed at line %d', expand('<sflnum>')))

  call s:assert.equals(
  \ levenshtein#ristricted_damerau_levenshtein_distance("δεζ", "αβγ"), 3, printf('Failed at line %d', expand('<sflnum>')))

  call s:assert.equals(
  \ levenshtein#ristricted_damerau_levenshtein_distance("δεζη", "αβγ"), 4, printf('Failed at line %d', expand('<sflnum>')))

  call s:assert.equals(
  \ levenshtein#ristricted_damerau_levenshtein_distance("εζη", "αβγδ"), 4, printf('Failed at line %d', expand('<sflnum>')))

  call s:assert.equals(
  \ levenshtein#ristricted_damerau_levenshtein_distance('RICK', 'RICK'), 0, printf('Failed at line %d', expand('<sflnum>')))

  call s:assert.equals(
  \ levenshtein#ristricted_damerau_levenshtein_distance('MARTHA', 'MARHTA'), 1, printf('Failed at line %d', expand('<sflnum>')))

  call s:assert.equals(
  \ levenshtein#ristricted_damerau_levenshtein_distance('DWAYNE', 'DUANE'), 2, printf('Failed at line %d', expand('<sflnum>')))

  call s:assert.equals(
  \ levenshtein#ristricted_damerau_levenshtein_distance('DIXON',  'DICKSONX'), 4, printf('Failed at line %d', expand('<sflnum>')))

  call s:assert.equals(
  \ levenshtein#ristricted_damerau_levenshtein_distance('ABCDE',  'FGHIJ'), 5, printf('Failed at line %d', expand('<sflnum>')))

  call s:assert.equals(
  \ levenshtein#ristricted_damerau_levenshtein_distance(repeat("α", 65), "abcd"), 65, printf('Failed at line %d', expand('<sflnum>')))

  call s:assert.equals(
  \ levenshtein#ristricted_damerau_levenshtein_distance("abcd", repeat("β", 65)), 65, printf('Failed at line %d', expand('<sflnum>')))

  call s:assert.equals(
  \ levenshtein#ristricted_damerau_levenshtein_distance(repeat("α", 65), repeat("β", 65)), 65, printf('Failed at line %d', expand('<sflnum>')))
endfunction

" vim:set sts=2 sw=2 tw=0:
