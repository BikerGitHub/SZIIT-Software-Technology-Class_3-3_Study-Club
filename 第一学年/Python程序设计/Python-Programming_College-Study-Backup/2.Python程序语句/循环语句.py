#while和for都带else,正常结束后运行
#while
i=0
while i<5:
    print(i)
    i+=1#优先使用+=节约生命并少量提升代码速度
    if i>10:
        break#跳出该层循环
        continue#跳过本层循环的余下部分直接开始下一次循环
        pass#官方不干活占位符
else:
    print("end")

words = ['cat', 'window', 'defenestrate']
for w in words[:]:#in后可以为任意有序序列,复制一份words防止死循环
    if len(w) > 6:
        words.insert(0, w)
print(words)

print(range(10,20,2))
print(list(range(10,20,2)))
for i in range(5):#range默认参数为(start=0,i,step=1)
    print(i)
else:
    print("end")

print("*",end="")#print函数需要定义结尾字符,否则默认为"\n"