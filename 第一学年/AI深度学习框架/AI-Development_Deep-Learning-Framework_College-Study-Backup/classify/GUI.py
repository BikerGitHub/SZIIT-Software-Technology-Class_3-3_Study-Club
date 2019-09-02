import tkinter as tk
from tkinter.filedialog import askopenfilename  
from PIL import Image,ImageTk
import numpy as np
import keras

IMG_ROWS, IMG_COLS = 32,32

def color_preprocessing(x_test):
    x_test = x_test.astype('float32')
    mean = [125.3, 123.0, 113.9]
    std  = [63.0,  62.1,  66.7]
    for i in range(3):
        x_test[:,:,:,i] = (x_test[:,:,:,i] - mean[i]) / std[i]

    return x_test

class Application(tk.Frame):
    
    label_dict={0:'中性笔',1:'胶布',2:'资料夹',3:'打印纸',4:'美工刀',5:'回形针',6:'尺子',7:'订书机',8:'圆规',9:'剪刀'}

    def __init__(self, master=None):
        super().__init__(master)
        self.master = master
        self.pack()
        self.create_widgets()        
        self.model=keras.models.load_model('wresnet.h5')

    def create_widgets(self):
        # self.hi_there = tk.Button(self)
        # self.hi_there["text"] = "Hello World\n(click me)"
        # self.hi_there["command"] = self.say_hi
        # self.hi_there.pack(side="top")

        self.path=tk.StringVar()
        self.path_entry=tk.Entry(self,text=self.path)
        # self.path_entry.pack(side='bottom')
        self.path_entry.pack()

        self.show_image=tk.Button(self)
        self.show_image['text']='显示图片'
        self.show_image['command']=self.show_image_label
        # self.show_image.pack(side='bottom')
        self.show_image.pack()

        self.quit = tk.Button(self, text="QUIT", fg="red",command=self.master.destroy)
        # self.quit.pack(side="bottom")
        self.quit.pack()

        self.image=tk.Label(self)
        self.image.pack(side='left')

        self.result_label=tk.Label(self)
        self.result_label['text']='结果:\n'
        self.result_label.pack(side='right')

    def show_image_label(self):
        path_=askopenfilename()  
        self.path.set(path_)
        img_open = Image.open(self.path_entry.get()).convert("RGB")
        img=ImageTk.PhotoImage(img_open)
        self.image.config(image=img)
        self.image.image=img #keep a reference
        
        img_small=img_open.resize((IMG_ROWS, IMG_COLS))
        img_small=np.array(img_small)
        img_small=np.expand_dims(img_small, axis=0)
        img_small=color_preprocessing(img_small)
        result=self.model.predict(img_small)
        result_str='结果:\n'
        for index in range(10):
            result_str=result_str+self.label_dict[index]+':'+str(result[0][index])+'\n'
        self.result_label['text']=result_str
        #self.result_label.config(text=result)
        #print(result)

root = tk.Tk()
app = Application(master=root)
app.mainloop()
