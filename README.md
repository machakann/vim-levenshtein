vim-levenshtein
===============

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

 4. character-wise transposition	`ab -> ba`

The Damerau-Levenshtein distance of `abc` and `acb` is 1 since a transposition of `b` and `c` make them equal, while the Levenshtein distance is 2 since two substitution is necessary.

Note that this library cannot follow the above rule of the Damerau-Levenshtein distance strictly.
There is a limitation for the fourth operation; only a transposition between two successive characters are allowed.

 4. character-wise transposition between two successive characters
    - Allowed		`abc -> bac`
    - Not allowed	`abc -> cba`

The ristricted Damerau-Levenshtein distance between `abc` and `cba` is 2 since two substitution, `a` to `c` and `c` to `a`, is necessary, while those (unristricted) Damerau-Levenshtein distance is 1 since a transposition of the first `a` and the third `c` does the job.
That's the reason why the function is called **ristricted** Damerau-Levenshtein distance.
It is also called optimal string alignment distance.



## How to use

```vim
echo levenshtein#levenshtein_distance('ab', 'abc')
echo levenshtein#ristricted_damerau_levenshtein_distance('abc', 'bac')

let g:ld = levenshtein#import()
let g:osa_distance = g:ld.ristricted_damerau_levenshtein_distance
echo g:osa_distance('abc', 'bac')
```

---

 - https://en.wikipedia.org/wiki/Levenshtein_distance
 - https://en.wikipedia.org/wiki/Damerau%E2%80%93Levenshtein_distance
 - Heikki Hyyrö, "A Bit-Vector Algorithm for Computing Levenshtein and Damerau Edit Distances", Journal Nordic Journal of Computing 10, 29-39, 2003
 - Heikki Hyyrö, "Explaining and Extending the Bit-parallel Approximate String Matching Algorithm of Myers", Technical report A2001-10 of the Department of Computer and Information Sciences, University of Tampere, 2001