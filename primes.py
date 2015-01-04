from time import time as t
def sundaram3(max_n):
    numbers = list(range(3, max_n+1, 2))
    half = (max_n)//2
    initial = 4
    
    for step in range(3, max_n+1, 2):
        for i in range(initial, half, step):
            numbers[i-1] = 0
        initial += 2*(step+1)
        
        if initial > half:
            return [2] + filter(None, numbers)
st = t()
print(sundaram3(1000000))
et = t()
pritn(st-et)
