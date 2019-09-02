def isleap(y):
    return y%400==0 or y%4==0 and y%100!=0

def maxdays(y,m):
    d=30
    month=[1,3,5,7,8,10,12]
    if m in month:
        d=31
    elif m==2:
        if isleap(y):
            d=28
        else:
            d=29
    return d

def countdays(y,m,d):
    days=d
    if m>=2:
        days+=31
    if m>=3:
        if isleap(y):
            d=28
        else:
            d=29
    if m>=4:
        days+=31
    if m>=5:
        days+=30
    if m>=6:
        days+=31
    if m>=7:
        days+=30
    if m>=8:
        days+=31
    if m>=9:
        days+=31
    if m>=10:
        days+=30
    if m>=11:
        days+=31
    if m>=12:
        days+=30
    return days

def countweek(y,m):
    return ((y-1)+(y-1)//400+(y-1)//4-(y-1)//100+countdays(y,m,1))%7

def printmonth(y,m):
    w=countweek(y,m)
    md=maxdays(y,m)
    print("%-6s%-6s%-6s%-6s%-6s%-6s%-6s"%("7","1","2","3","4","5","6"))
    for i in range(w):
        print("%-6s"%" ",end="")
    for d in range(1,md+1):
        print("%-6d"%d,end="")
        w=w+1
        if w%7==0:
            print()

y=input("y:")
y=int(y)
for m in range(1,13):
    print()
    print("-------------",y,"年",m,"月------------")
    printmonth(y,m)
    print()
