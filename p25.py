def fib(n):
    start = [0,1,1]
    for i in range(1,n-1):
        start.append(start[-2]+start[-1])
    return start
fibs = fib(5000)
count = 0
for e in fibs:
    if len(str(e)) >= 1000:
        print(count)
        break
    else:
        count += 1
        
