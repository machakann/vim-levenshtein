vim-levenshtein
===============

[![License: CC0-1.0](https://licensebuttons.net/l/zero/1.0/80x15.png)](http://creativecommons.org/publicdomain/zero/1.0/)
[![Test](https://github.com/machakann/vim-levenshtein/actions/workflows/test.yml/badge.svg)](https://github.com/machakann/vim-levenshtein/actions/workflows/test.yml)

This is a library plugin to calculate Levenshtein and its variant, ristricted Damerau-Levenshtein distance.

Levenshtein distance is a sort of edit distances.
It is defind as a minimum count to equate two strings by three kinds of operations.

 1. character-wise addition		`a  -> ab`
 2. character-wise deletion		`ab -> a`
 3. character-wise substitution		`a  -> b`

For example, the Levenshtein distance between `a` and `ab` is 1, since an addition of `b` makes the former equal as the latter.
Conversely, `ab` can be equated by a deletion of `b`, therefore it is 1 as same.
Similarly, the Levenshtein distance between `ab` and `ac` is 1, because a substitution of `b` with `c` make them equal.

Damerau-Levenshtein distance is a variant of the Levenshtein distance.
It accepts one additional operation.

 4. character-wise transposition of two adjacent characters	`ab -> ba`

The Damerau-Levenshtein distance of `abc` and `acb` is 1 since a transposition of `b` and `c` make them equal, while the Levenshtein distance is 2 since two substitution is necessary.

Note that this library cannot follow the above rule of the Damerau-Levenshtein distance strictly.
There is a limitation for the fourth operation; only a transposition between two successive characters are allowed.


Note that this library cannot follow the above rule of the Damerau-Levenshtein distance strictly.
There is a limitation for the four operations; these operations cannot backtrack.
Think on the distance between "abc" and "bca".
The (unristricted) Damerau-Levenshtein distance is 2 since a transpositions and an addition does the job.
However, the second operation has to insert a character behind the last edited character "c".
The ristricted Damerau-Levenshtein distance does not allow this operation and therefore results in 3 with three substitution.

    - Unristricted	ca -> ac -> abc
    - Ristricted	ca -> aa -> ab -> abc

That's the reason why the function is called **ristricted** Damerau-Levenshtein distance.
It is also called optimal string alignment distance.



# How to use

```vim
echo levenshtein#levenshtein_distance('ab', 'abc')
echo levenshtein#ristricted_damerau_levenshtein_distance('abc', 'bac')

let g:ld = levenshtein#import()
let g:osa_distance = g:ld.ristricted_damerau_levenshtein_distance
echo g:osa_distance('abc', 'bac')
```



# References

 - https://en.wikipedia.org/wiki/Levenshtein_distance
 - https://en.wikipedia.org/wiki/Damerau%E2%80%93Levenshtein_distance
 - Heikki Hyyrö, "A Bit-Vector Algorithm for Computing Levenshtein and Damerau Edit Distances", Journal Nordic Journal of Computing 10, 29-39, 2003
 - Heikki Hyyrö, "Explaining and Extending the Bit-parallel Approximate String Matching Algorithm of Myers", Technical report A2001-10 of the Department of Computer and Information Sciences, University of Tampere, 2001



# Links

https://machakann.hatenablog.com/entry/2022/05/29/194628
