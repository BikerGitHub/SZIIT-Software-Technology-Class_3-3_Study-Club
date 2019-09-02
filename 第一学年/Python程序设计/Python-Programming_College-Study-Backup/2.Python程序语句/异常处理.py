try:#异常检测
    raise Exception("Ho Wor!")#异常抛出
except Exception as error:#异常处理
    print(error)
else:#无异常
    print("Run well")
finally:#结束时运行
    print("finally")

#异常处理的层级高于函数
#with语句简化自销毁的异常处理,输入要求看不懂