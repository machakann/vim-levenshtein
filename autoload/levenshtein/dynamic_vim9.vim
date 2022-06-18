vim9script
scriptencoding utf-8

def Distancemap(n: number): list<list<number>>
  var d = [range(n + 1)]
  for i in range(1, n)
    d += [[i] + repeat([0], n)]
  endfor
  return d
enddef
const dmax = 20
const distancemap = Distancemap(dmax)

export def LevenshteinDistance(Astr: string, Bstr: string): number
  if Astr == ''
    return strchars(Bstr)
  endif
  if Bstr == ''
    return strchars(Astr)
  endif
  if Astr == Bstr
    return 0
  endif
  return SubLevenshteinDistance(Astr, Bstr)
enddef


def SubLevenshteinDistance(Astr: string, Bstr: string): number
  const A = split(Astr, '\zs')
  const B = split(Bstr, '\zs')
  const Alen = len(A)
  const Blen = len(B)
  const nmax = max([Alen, Blen])
  var d = nmax > dmax ? Distancemap(nmax) : deepcopy(distancemap)
  for i in range(1, Alen)
    for j in range(1, Blen)
      var inc = A[i - 1] == B[j - 1] ? 0 : 1
      d[i][j] = min([d[i - 1][j] + 1,
                     d[i][j - 1] + 1,
                     d[i - 1][j - 1] + inc])
    endfor
  endfor
  return d[Alen][Blen]
enddef


export def RistrictedDamerauLevenshteinDistance(Astr: string, Bstr: string): number
  if Astr == ''
    return strchars(Bstr)
  endif
  if Bstr == ''
    return strchars(Astr)
  endif
  if Astr == Bstr
    return 0
  endif
  return SubRistrictedDamerauLevenshteinDistance(Astr, Bstr)
enddef


def SubRistrictedDamerauLevenshteinDistance(Astr: string, Bstr: string): number
  const A = split(Astr, '\zs')
  const B = split(Bstr, '\zs')
  const Alen = len(A)
  const Blen = len(B)
  const nmax = max([Alen, Blen])
  var d = nmax > dmax ? Distancemap(nmax) : deepcopy(distancemap)
  for i in range(1, Alen)
    for j in range(1, Blen)
      var inc = A[i - 1] == B[j - 1] ? 0 : 1
      if i > 1 && j > 1 && A[i - 1] == B[j - 2] && A[i - 2] == B[j - 1]
        d[i][j] = min([d[i - 1][j] + 1,
                       d[i][j - 1] + 1,
                       d[i - 1][j - 1] + inc,
                       d[i - 2][j - 2] + inc])
      else
        d[i][j] = min([d[i - 1][j] + 1,
                       d[i][j - 1] + 1,
                       d[i - 1][j - 1] + inc])
      endif
    endfor
  endfor
  return d[Alen][Blen]
enddef

defcompile

# vim:set sts=2 sw=2 tw=0:
