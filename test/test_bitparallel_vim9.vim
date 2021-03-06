scriptencoding utf-8
let s:assert = themis#helper('assert')
call themis#helper('command').with(s:assert)
let s:suite = themis#suite('bit-parallel(vim9):')
import expand('<sfile>:h:h') .. '/autoload/levenshtein/bitparallel_vim9.vim'


function! s:suite.levenshtein() abort
  if has('patch-8.2.5003')
    call s:assert.equals(
    \ s:bitparallel_vim9.LevenshteinDistance("", "abc"), 3, printf('Failed at line %d', expand('<sflnum>')))

    call s:assert.equals(
    \ s:bitparallel_vim9.LevenshteinDistance("abc", ""), 3, printf('Failed at line %d', expand('<sflnum>')))

    call s:assert.equals(
    \ s:bitparallel_vim9.LevenshteinDistance("", ""), 0, printf('Failed at line %d', expand('<sflnum>')))

    call s:assert.equals(
    \ s:bitparallel_vim9.LevenshteinDistance("abc", "abc"), 0, printf('Failed at line %d', expand('<sflnum>')))

    call s:assert.equals(
    \ s:bitparallel_vim9.LevenshteinDistance("ab", "abc"), 1, printf('Failed at line %d', expand('<sflnum>')))

    call s:assert.equals(
    \ s:bitparallel_vim9.LevenshteinDistance("abcd", "abc"), 1, printf('Failed at line %d', expand('<sflnum>')))

    call s:assert.equals(
    \ s:bitparallel_vim9.LevenshteinDistance("abcde", "abc"), 2, printf('Failed at line %d', expand('<sflnum>')))

    call s:assert.equals(
    \ s:bitparallel_vim9.LevenshteinDistance("abc", "abcde"), 2, printf('Failed at line %d', expand('<sflnum>')))

    call s:assert.equals(
    \ s:bitparallel_vim9.LevenshteinDistance("abd", "abc"), 1, printf('Failed at line %d', expand('<sflnum>')))

    call s:assert.equals(
    \ s:bitparallel_vim9.LevenshteinDistance("acb", "abc"), 2, printf('Failed at line %d', expand('<sflnum>')))

    call s:assert.equals(
    \ s:bitparallel_vim9.LevenshteinDistance("def", "abc"), 3, printf('Failed at line %d', expand('<sflnum>')))

    call s:assert.equals(
    \ s:bitparallel_vim9.LevenshteinDistance("defg", "abc"), 4, printf('Failed at line %d', expand('<sflnum>')))

    call s:assert.equals(
    \ s:bitparallel_vim9.LevenshteinDistance("efg", "abcd"), 4, printf('Failed at line %d', expand('<sflnum>')))

    call s:assert.equals(
    \ s:bitparallel_vim9.LevenshteinDistance("??????", "??????"), 0, printf('Failed at line %d', expand('<sflnum>')))

    call s:assert.equals(
    \ s:bitparallel_vim9.LevenshteinDistance("????", "??????"), 1, printf('Failed at line %d', expand('<sflnum>')))

    call s:assert.equals(
    \ s:bitparallel_vim9.LevenshteinDistance("????????", "??????"), 1, printf('Failed at line %d', expand('<sflnum>')))

    call s:assert.equals(
    \ s:bitparallel_vim9.LevenshteinDistance("??????", "??????"), 1, printf('Failed at line %d', expand('<sflnum>')))

    call s:assert.equals(
    \ s:bitparallel_vim9.LevenshteinDistance("??????", "??????"), 2, printf('Failed at line %d', expand('<sflnum>')))

    call s:assert.equals(
    \ s:bitparallel_vim9.LevenshteinDistance("??????", "??????"), 3, printf('Failed at line %d', expand('<sflnum>')))

    call s:assert.equals(
    \ s:bitparallel_vim9.LevenshteinDistance("????????", "??????"), 4, printf('Failed at line %d', expand('<sflnum>')))

    call s:assert.equals(
    \ s:bitparallel_vim9.LevenshteinDistance("??????", "????????"), 4, printf('Failed at line %d', expand('<sflnum>')))
  else
    call s:assert.skip('Bit-parallel module requires patch-8.2.5003')
  endif
endfunction


function! s:suite.ristricted_damerau_levenshtein() abort
  if has('patch-8.2.5003')
    call s:assert.equals(
    \ s:bitparallel_vim9.RistrictedDamerauLevenshteinDistance("", "abc"), 3, printf('Failed at line %d', expand('<sflnum>')))

    call s:assert.equals(
    \ s:bitparallel_vim9.RistrictedDamerauLevenshteinDistance("abc", ""), 3, printf('Failed at line %d', expand('<sflnum>')))

    call s:assert.equals(
    \ s:bitparallel_vim9.RistrictedDamerauLevenshteinDistance("", ""), 0, printf('Failed at line %d', expand('<sflnum>')))

    call s:assert.equals(
    \ s:bitparallel_vim9.RistrictedDamerauLevenshteinDistance("abc", "abc"), 0, printf('Failed at line %d', expand('<sflnum>')))

    call s:assert.equals(
    \ s:bitparallel_vim9.RistrictedDamerauLevenshteinDistance("ab", "abc"), 1, printf('Failed at line %d', expand('<sflnum>')))

    call s:assert.equals(
    \ s:bitparallel_vim9.RistrictedDamerauLevenshteinDistance("abcd", "abc"), 1, printf('Failed at line %d', expand('<sflnum>')))

    call s:assert.equals(
    \ s:bitparallel_vim9.RistrictedDamerauLevenshteinDistance("abcde", "abc"), 2, printf('Failed at line %d', expand('<sflnum>')))

    call s:assert.equals(
    \ s:bitparallel_vim9.RistrictedDamerauLevenshteinDistance("abc", "abcde"), 2, printf('Failed at line %d', expand('<sflnum>')))

    call s:assert.equals(
    \ s:bitparallel_vim9.RistrictedDamerauLevenshteinDistance("abd", "abc"), 1, printf('Failed at line %d', expand('<sflnum>')))

    call s:assert.equals(
    \ s:bitparallel_vim9.RistrictedDamerauLevenshteinDistance("acb", "abc"), 1, printf('Failed at line %d', expand('<sflnum>')))

    call s:assert.equals(
    \ s:bitparallel_vim9.RistrictedDamerauLevenshteinDistance("def", "abc"), 3, printf('Failed at line %d', expand('<sflnum>')))

    call s:assert.equals(
    \ s:bitparallel_vim9.RistrictedDamerauLevenshteinDistance("defg", "abc"), 4, printf('Failed at line %d', expand('<sflnum>')))

    call s:assert.equals(
    \ s:bitparallel_vim9.RistrictedDamerauLevenshteinDistance("efg", "abcd"), 4, printf('Failed at line %d', expand('<sflnum>')))

    call s:assert.equals(
    \ s:bitparallel_vim9.RistrictedDamerauLevenshteinDistance("??????", "??????"), 0, printf('Failed at line %d', expand('<sflnum>')))

    call s:assert.equals(
    \ s:bitparallel_vim9.RistrictedDamerauLevenshteinDistance("????", "??????"), 1, printf('Failed at line %d', expand('<sflnum>')))

    call s:assert.equals(
    \ s:bitparallel_vim9.RistrictedDamerauLevenshteinDistance("????????", "??????"), 1, printf('Failed at line %d', expand('<sflnum>')))

    call s:assert.equals(
    \ s:bitparallel_vim9.RistrictedDamerauLevenshteinDistance("??????", "??????"), 1, printf('Failed at line %d', expand('<sflnum>')))

    call s:assert.equals(
    \ s:bitparallel_vim9.RistrictedDamerauLevenshteinDistance("??????", "??????"), 1, printf('Failed at line %d', expand('<sflnum>')))

    call s:assert.equals(
    \ s:bitparallel_vim9.RistrictedDamerauLevenshteinDistance("??????", "??????"), 3, printf('Failed at line %d', expand('<sflnum>')))

    call s:assert.equals(
    \ s:bitparallel_vim9.RistrictedDamerauLevenshteinDistance("????????", "??????"), 4, printf('Failed at line %d', expand('<sflnum>')))

    call s:assert.equals(
    \ s:bitparallel_vim9.RistrictedDamerauLevenshteinDistance("??????", "????????"), 4, printf('Failed at line %d', expand('<sflnum>')))

    call s:assert.equals(
    \ s:bitparallel_vim9.RistrictedDamerauLevenshteinDistance('RICK', 'RICK'), 0, printf('Failed at line %d', expand('<sflnum>')))

    call s:assert.equals(
    \ s:bitparallel_vim9.RistrictedDamerauLevenshteinDistance('MARTHA', 'MARHTA'), 1, printf('Failed at line %d', expand('<sflnum>')))

    call s:assert.equals(
    \ s:bitparallel_vim9.RistrictedDamerauLevenshteinDistance('DWAYNE', 'DUANE'), 2, printf('Failed at line %d', expand('<sflnum>')))

    call s:assert.equals(
    \ s:bitparallel_vim9.RistrictedDamerauLevenshteinDistance('DIXON',  'DICKSONX'), 4, printf('Failed at line %d', expand('<sflnum>')))

    call s:assert.equals(
    \ s:bitparallel_vim9.RistrictedDamerauLevenshteinDistance('ABCDE',  'FGHIJ'), 5, printf('Failed at line %d', expand('<sflnum>')))
  else
    call s:assert.skip('Bit-parallel module requires patch-8.2.5003')
  endif
endfunction

" vim:set sts=2 sw=2 tw=0:
