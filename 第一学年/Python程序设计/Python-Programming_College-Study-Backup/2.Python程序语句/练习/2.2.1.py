m=input('enter mark:')
m=float(m)
if m<0 or m>100:
    print('invalid')
elif m>=90:
    print('A')
elif m>=80:
    print('B')
elif m>=70:
    print('C')
elif m>=60:
    print('D')
else:
    print('E')