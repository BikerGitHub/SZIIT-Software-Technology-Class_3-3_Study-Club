p=0
p=input('input p')
p=int(p)

q=0
q=input('input q')
q=int(q)

n=0
n=input('input n')
n=int(n)

s=str(p//q)
r=p%q
if r!=0:
    s=s+'.'
i=0
while r!=0 and i<n:
    r=10*r
    s=s+str(r//q)
    r=r%q
    i=i+1
print('%d/%d=%f' %(p,q,p/q))
print('%d/%d=%s' %(p,q,s))