import math

a=input('a=')
a=float(a)
b=input('b=')
b=float(b)
c=input('c=')
c=float(c)

if a!=0:
    d=b*b-4*a*c
    if d>0:
        d=math.sqrt(d)
        x1=(-b+d)/2/a
        x2=(-b-d)/2/a
        print('x1=',x1,'x2=',x2)
    elif d==0:
        print('x1,x2=',-b/2/a)
    else:
        print('无实数解')
else:
    print('不是一元二次方程')