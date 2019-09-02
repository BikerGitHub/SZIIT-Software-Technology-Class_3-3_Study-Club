words=[{"word":"about","note":"在附近,关于"},{"word":"post","note":"邮寄、投递"}]
def show():
    for w in words:
        print("%-16s : %s" % (w["word"],w["note"]))
        print()

def enter():
    w={}
    w["word"]=input("单词:")
    w["note"]=input("注释:")
    return w

def seek(word):
    i=0
    j=len(words)-1
    while i<=j:
        m=(i+j)//2
        if words[m]["word"] == word:
            print("%-16s : %s" % (word, words[m] ["note"]))
            return
        elif words[m]["word"]>word:
            j=m-1
        else:
            i=m+1
    print(word + " --- 查找失败")
def insert(w):
    global words
    i=0
    j=len(words)-1
    while i<=j:
        m=(i+j)//2
        if words[m]["word"] == w["word"]:
            print(w["word"]+" --- 已经存在")
            return
        elif words[m]["word"]>w["word"]:
            j=m-1
        else:
            i=m+1
    words.insert(i,w)
    print(w["word"] + " --- 增加成功")

def update(w):
    global words
    i=0
    j=len(words)-1
    while i<=j:
        m=(i+j)//2
        if words[m]["word"] == w["word"]:
            words[m]["note"]=w["note"]
            print(w["word"]+" --- 更新成功")
            return
        elif words[m]["word"]>w["word"]:
            j=m-1
        else:
            i=m+1
    print(w["word"] + " --- 查找失败")

def delete(word):
    global words
    i=0
    j=len(words)-1
    while i<=j:
        m=(i+j)//2
        if words[m]["word"] == word:
            del words[m]
            print(word+" --- 删除成功")
            return
        elif words[m]["word"]>word:
            j=m-1
        else:
            i=m+1
    print(word + " --- 查找失败")

while True:
    print("1.显示 2.查找 3.增加 4.更新 5.删除 6.退出")
    s=input("请选择(1,2,3,4,5):")
    if s=="1":
        show()
    elif s == "2":
        word = input("单词:")
        seek(word)
    elif s=="3":
        w=enter()
        insert(w)
    elif s=="4":
        w=enter()
        update(w)
    elif s=="5":
        word=input("单词:")
        delete(word)
    elif s=="6":
        break
print("Finished")