def Divisors(n):
    div = [[][:] for x in range(0,n+1)]
    for index in range(1,n+1):
        for i in range(index*2,n+1,index):
            div[i].append(index)
    return div

def AbundantList(n):
    divList = Divisors(n)
    return [i for i in range(1,n+1) if sum(divList[i]) >i]

def nonAbSum(n):
    abSum = AbundantList(n)
    naturals  = [i for i in range(0,n+1)]
    while abSum:
        abby = abSum.pop(0)
        try:
            naturals[abby*2] = 0
        except IndexError:
            pass
        for n in abSum:
            try:
                naturals[abby+n] = 0
            except IndexError:
                continue
    return [n for n in naturals if n]
        
print(nonAbSum(28123))
print(sum(nonAbSum(28123)))
