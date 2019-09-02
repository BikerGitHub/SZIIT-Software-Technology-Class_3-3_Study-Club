class person:#定义类
    name='xxxxxx'#定义变量
    _name='12345'#定义私有变量,不可外部访问
    def print_name(self):#定义函数
        print(self.name,self._name)
    def __init__(self, *args, **kwargs):#定义实例初始化函数
        return super().__init__(*args, **kwargs)#调用父类的初始化函数
    def __del__(self):
        print(self,'has been deleted.')
    @staticmethod
    def static():#静态方法,不受实例化影响
        print('person class static output');

person.print_name(person)#我调用我自己的定义

p=person()#实例化类
p.print_name()#调用类函数

#未特指的实例属性是链接到原始定义类上的
person.name='xx'
p.print_name()

#x.f()与MyClass.f(x)等价
#类中初始定义的序列类型总是与所有实例共享

p.static()