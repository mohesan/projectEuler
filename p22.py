import re
def main(String):
    names = String.split(',')
    names = [e.strip('"') for e in names]
    names.sort()
    N = len(names)
    scoreT = 0
    for i in range(0,N):
        scoreT += scorer(names[i],i)
    return scoreT
    
def scorer(name,position):
    return sum([ord(c)-96 for c in name.lower()])*(position+1)

txt = open("/Users/rjphayes/Desktop/p022_names.txt",'r')
for n in txt:
    print(main(n))

test = '"Tom"'
test.strip()
print(test[1:-1])
