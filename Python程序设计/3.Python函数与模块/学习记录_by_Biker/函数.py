
'''
函数必须定义在调用前面
函数内为局部变量
函数外全局变量无法被函数直接使用
'''
x=0
def sample():
    global x#声明创建或使用全局变量,无法与已存在的局部变量同名
    return
'''
return后函数立刻停止
finally优先级高于不可被return跳过
无表达式或无return函数返回<class 'NoneType'>
'''

print(sample())


def de(a,b=1,c=2):#可以用此种方式设置默认参数
    print(a,b,c)

de(0)
de(0,c=2,b=1)#可以用此种方式给指定参数赋值

def 可变参数量(*name,step=''):#定义可变参数量的函数,后面可接带默认值的参数
    print(type(name))
可变参数量(0)#自动将参数转为tuple传给函数

