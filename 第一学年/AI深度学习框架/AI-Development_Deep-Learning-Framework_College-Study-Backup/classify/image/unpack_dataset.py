import os
from PIL import Image
import numpy as np
import random
#np.save('.npy',x)
#np.load

x_img_train=np.load('../train_image.npy')
y_label_train=np.load('../train_label.npy')
x_img_test=np.load('../test_image.npy')
y_label_test=np.load('../test_label.npy')

label_dict={0:'中性笔',1:'胶布',2:'资料夹',3:'图钉',4:'美工刀',5:'回形针',6:'尺子',7:'订书机',8:'圆规',9:'剪刀'}

def save_image(dir,img_list,label_list):
    os.mkdir(dir)
    for index in range(len(img_list)):
        img=Image.fromarray(np.uint8(img_list[index]))
        path=dir+'/'+label_dict[label_list[index][0]]+str(random.random()+index)+'.png'
        img.save(path)

save_image('train',x_img_train,y_label_train)
save_image('test',x_img_test,y_label_test)
