#三元表达式好用！！！
def Max(x,y):
    return x if x>y else y

def Min(x,y):
    return (x,y)[x>y]#利用数组,不推荐
