vim9script
scriptencoding utf-8

def PatternMatchDict(A: string): dict<number>
  const char_list = split(A, '\zs')
  const uniq_char_list = uniq(sort(copy(char_list)))
  var pmd = reduce(uniq_char_list, (acc, val) => extend(acc, {[val]: 0}), {})
  var i = 0
  for c in char_list
    pmd[c] = or(pmd[c], 1 << i)
    i += 1
  endfor
  return pmd
enddef


def PatternMatchVector(B: string, pmd: dict<number>): list<number>
  const char_list = split(B, '\zs')
  var pm = repeat([0], strchars(B) + 1)
  var j = 0
  for c in char_list
    if has_key(pmd, c)
      pm[j + 1] = pmd[c]
    endif
    j += 1
  endfor
  return pm
enddef


def CalcLevenshteinDistance(A: string, B: string, Alen: number, Blen: number): number
  const pmd = PatternMatchDict(A)
  const pm = PatternMatchVector(B, pmd)
  var d0 = 0
  var hp = 0
  var hn = 0
  var vp = invert(0)
  var vn = 0
  var d = Alen
  const ms = 1 << (d - 1)
  for j in range(1, Blen)
    d0 = or(or(xor(and(pm[j], vp) + vp, vp), pm[j]), vn)
    hp = or(vn, invert(or(d0, vp)))
    hn = and(d0, vp)
    if and(hp, ms) != 0
      d += 1
    endif
    if and(hn, ms) != 0
      d -= 1
    endif
    vp = or(hn << 1, invert(or(d0, or(hp << 1, 1))))
    vn = and(d0, or(hp << 1, 1))
  endfor
  return d
enddef


export def LevenshteinDistance(A: string, B: string): number
  if A == ''
    return strchars(B)
  endif
  if B == ''
    return strchars(A)
  endif
  if A == B
    return 0
  endif

  const Alen = strchars(A)
  const Blen = strchars(B)
  if Alen > v:numbersize && Blen > v:numbersize
    echoerr printf('levenshtein: Bit-parallel algorithm cannot handle two strings both longer than %s characters!', v:numbersize)
  elseif Alen > v:numbersize
    return CalcLevenshteinDistance(B, A, Blen, Alen)
  elseif Blen > v:numbersize
    return CalcLevenshteinDistance(A, B, Alen, Blen)
  endif
  if Alen < Blen
    return CalcLevenshteinDistance(B, A, Blen, Alen)
  endif
  return CalcLevenshteinDistance(A, B, Alen, Blen)
enddef


def CalcRistrictedDamerauLevenshteinDistance(A: string, B: string, Alen: number, Blen: number): number
  const pmd = PatternMatchDict(A)
  const pm = PatternMatchVector(B, pmd)
  var d0 = 0
  var hp = 0
  var hn = 0
  var vp = invert(0)
  var vn = 0
  var d = Alen
  const ms = 1 << (d - 1)
  for j in range(1, Blen)
    d0 = and(and(invert(d0), pm[j]) << 1, pm[j - 1])
    d0 = or(or(or(d0, xor(and(pm[j], vp) + vp, vp)), pm[j]), vn)
    hp = or(vn, invert(or(d0, vp)))
    hn = and(d0, vp)
    if and(hp, ms) != 0
      d += 1
    endif
    if and(hn, ms) != 0
      d -= 1
    endif
    vp = or(hn << 1, invert(or(d0, or(hp << 1, 1))))
    vn = and(d0, or(hp << 1, 1))
  endfor
  return d
enddef


export def RistrictedDamerauLevenshteinDistance(A: string, B: string): number
  if A == ''
    return strchars(B)
  endif
  if B == ''
    return strchars(A)
  endif
  if A == B
    return 0
  endif

  const Alen = strchars(A)
  const Blen = strchars(B)
  if Alen > v:numbersize && Blen > v:numbersize
    echoerr printf('levenshtei Bit-parallel algorithm cannot handle two strings both longer than %s characters!', v:numbersize)
  elseif Alen > v:numbersize
    return CalcRistrictedDamerauLevenshteinDistance(B, A, Blen, Alen)
  elseif Blen > v:numbersize
    return CalcRistrictedDamerauLevenshteinDistance(A, B, Alen, Blen)
  endif
  if Alen < Blen
    return CalcRistrictedDamerauLevenshteinDistance(B, A, Blen, Alen)
  endif
  return CalcRistrictedDamerauLevenshteinDistance(A, B, Alen, Blen)
enddef

defcompile

# vim:set sts=2 sw=2 tw=0:
