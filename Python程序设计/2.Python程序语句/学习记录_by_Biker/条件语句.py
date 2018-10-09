#注意elif的特殊点,此处if elif else处于同一逻辑层
a=0
if a:
    print(1)
elif not a:
    print(2)
else:
    print(3)

#;有分割语句的功能,但是逻辑缩进仍然是必须的
x=1;y=2;z=3
if x < y < z: print(x); print(y); print(z)
else:
    pass