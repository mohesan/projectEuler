#def main(n):
#    numbers = range(3, n+1,2)
#    indexer = numbers.pop(0)
#    for p in range(indexer-1,len(numbers),indexer):
#        numbers[p] = 0
#    numbers = filter(None,numbers)
#    return numbers
#
#print main(35)
from math import sqrt

def main(n):
    numbers = range(3,n+1,2)
    initial = 0
    sizeN   = n//2-1
    stopPos  =int(sqrt(n)//2)

    for indexer in numbers[0:stopPos]:
        if indexer == 0:
            continue
        for p in range(initial+indexer,sizeN,indexer):
            numbers[p] = 0
        initial += 1
    return [2]+ filter(None,numbers)
prime = main(2000000)
sum = sum(prime)
print sum




