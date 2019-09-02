class Student:
    def __init__(self,No,Name,Gender,Age):
        self.No=No
        self.Name=Name
        self.Gender=Gender
        self.Age=Age

    def show(self):
        print("%-16s %-16s %-8s %-4d" %(self.No,self.Name,self.Gender,self.Age))

class StudentList:
    def __init__(self):
        self.students=[]

    def show(self):
        print("%-16s %-16s %-8s %-4s" %("No","Name","Gender","Age"))
        for s in self.students:
            s.show()

    def __insert(self,s):
        i=0
        while (i<len(self.students) and s.No>self.students[i].No):
            i=i+1
        if (i<len(self.students) and s.No==self.students[i].No):
            print(s.No+" 已经存在")
            return False
        self.students.insert(i,s)
        print("增加成功")
        return True

    def __update(self,s):
        flag=False
        for i in range(len(self.students)):
            if (s.No==self.students[i].No):
                self.students[i].Name=s.Name
                self.students[i].Gender = s.Gender
                self.students[i].Age = s.Age
                print("修改成功")
                flag=True
                break
            if (not flag):
                print("没有这个学生")
            return flag

    def __delete(self,No):
        flag=False
        for i in range(len(self.students)):
            if (self.students[i].No == No):
                del self.students[i]
                print("删除成功")
                flag=True
                break
            if (not flag):
                print("没有这个学生")
            return flag

    def delete(self):
        No=input("No=")
        if(No!=""):
            self.__delete(No)

    def insert(self):
        No=input("No=")
        Name=input("Name=")
        while True:
            Gender=input("Gender=")
            if (Gender=="男" or Gender=="女"):
                Age=input("Age=")
                if(Age==""):
                    Age=0
                else:
                    Age=int(Age)
                break
            else:
                print("Gender is not valid")
        if No!="" and Name!="":
            self.__insert(Student(No,Name,Gender,Age))
        else:
            print("学号、姓名不能为空")

    def update(self):
        No=input("No=")
        Name=input("Name=")
        while True:
            Gender=input("Gender=")
            if(Gender=="男" or Gender=="女"):
                Age=input("Age=")
                if(Age==""):
                    Age=0
                else:
                    Age=int(Age)
                break
            else:
                print("Gender is not vaild")
        if No!="" and Name!="":
            self.__update(Student(No,Name,Gender,Age))
        else:
            print("学号、姓名不能为空")

    def process(self):
        while True:
            s = input(">")
            if (s == "show"):
                self.show()
            elif (s == "insert"):
                self.insert()
            elif (s == "update"):
                self.update()
            elif (s == "delete"):
                self.delete()
            elif (s == "exit"):
                break
            else:
                print("show: show students")
                print("insert: insert a new students")
                print("update: insert a new students")
                print("delete: delete a student")
                print("exit: exit")

st=StudentList()
st.process()