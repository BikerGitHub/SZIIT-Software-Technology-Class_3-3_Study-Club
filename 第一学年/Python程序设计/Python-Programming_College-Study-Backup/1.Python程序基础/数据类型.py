'''
变量可以被*指向*任意类型的数据
'''
x=1024
x=str(x)#数值转字符串
x=int(x)#字符串转整型
x=float(x)#字符串转浮点
print("|%010d|"%x)#整型输出
#正数右对齐,负数左对齐
x=5
print("Time:%04d-%02d-%02d %02d:%02d:%02d"%(x,x,x,x,x,x))#整型多变量输出
x=3141.5926
print("|%16.8f|"%x)#浮点输出,总位数.小数位数
x="str"#'/''/'''/"/""/"""都可以定义str类型,交叉使用还可以支持嵌套
print("|%10s|"%x)