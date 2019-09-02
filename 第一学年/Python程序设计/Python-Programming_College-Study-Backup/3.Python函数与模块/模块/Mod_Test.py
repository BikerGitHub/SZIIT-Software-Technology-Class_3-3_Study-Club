import Max_and_Min#引用模块,调用时需要命名空间
print(Max_and_Min.Min(10,20))

from Max_and_Min import Max#引用模块中的某一部分
print(Max(10,20))

import Test.Max_and_Min#从下层目录引用模块,调用时需要包含目录的命名空间
print(Test.Max_and_Min.Min(10,20))

from Test.Max_and_Min import Min#从下层目录引用模块中的一部分
print(Max(10,20))

#python解释器识别命名大小写