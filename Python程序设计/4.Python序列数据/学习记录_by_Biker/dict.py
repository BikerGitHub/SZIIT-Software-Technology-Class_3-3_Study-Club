#字典,映射类型dict,哈希存储
d={'abc':1,'bcd':2}
print(type(d))
'''
字典内每个元素是有:分割的二元组,分别是键和值
键只能是可哈希的简单类型,值可以任意取
访问元素依靠键来定位
'''

print(d['abc'])#访问元素

d['cde']=3#添加元素

del d['cde']#删除元素

l=[1,2,3]
def test(a_list,a_dict):
    '''参数中的序列数据类型(如list/dict)不传送值,只传送指针'''
    #可以通过test.__doc__访问函数第一行如前的注释
    a_list[0]=0
    a_dict['abc']=0
print(test.__doc__)
test(l,d)
print(l,d)

def sample(*a_tuple,**a_dict):
    '''
    可变参数数量升级版
    将前面的参数全部合并为一个tuple
    将后面的元素全部合并为一个dict
    '''
    pass
