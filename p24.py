def fact(n):
    ans = 1
    for i in range(2,n+1):
        ans *= i
    return ans

def nextDigit(xs,perm,c, solution = []):
    P = 9 - c
    n = (1000000-perm)//fact(P)
    digit = xs.pop(n)
    solution.append(digit)
    if xs:
        return nextDigit(xs,(n+1)*fact(P)+perm,c+1,solution)
    else:
        return solution

xs = [0,1,2,3,4,5,6,7,8,9]
c = 0
perm = 0
print(nextDigit(xs,perm,c))
