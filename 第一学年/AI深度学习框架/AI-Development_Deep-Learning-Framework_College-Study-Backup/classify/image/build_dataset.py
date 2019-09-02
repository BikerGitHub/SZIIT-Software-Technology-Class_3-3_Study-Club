import os
from PIL import Image
import numpy as np
import random
#np.save('.npy',x)
#np.load

IMG_ROWS, IMG_COLS = 32,32

label_list=os.listdir()
trainfilelist=np.empty((0),dtype=str)
testfilelist=np.empty((0),dtype=str)
for label in label_list:
    if '.' not in label:
        label_list=os.listdir(label)
        train_num=int(len(label_list)*0.8)
        random.shuffle(label_list)
        for item in label_list[:train_num]:
            trainfilelist=np.append(trainfilelist,label+'/'+item)
        for item in label_list[train_num:]:
            testfilelist=np.append(testfilelist,label+'/'+item)
random.shuffle(trainfilelist)
random.shuffle(testfilelist)

image_list=np.empty((0,IMG_ROWS, IMG_COLS,3),dtype=np.uint8)
label_list=np.empty((0),dtype=np.uint8)
for item in trainfilelist:
    img=Image.open(item).convert("RGB")
    img=img.resize((IMG_ROWS, IMG_COLS))
    img=np.array(img)
    image_list=np.append(image_list,[img],axis=0)
    label_list=np.append(label_list,int(item[0]))
label_list=label_list.reshape((label_list.size,1))
np.save('train_image.npy',image_list)
np.save('train_label.npy',label_list)

image_list=np.empty((0,IMG_ROWS, IMG_COLS,3),dtype=np.uint8)
label_list=np.empty((0),dtype=np.uint8)
for item in testfilelist:
    img=Image.open(item).convert("RGB")
    img=img.resize((IMG_ROWS, IMG_COLS))
    img=np.array(img)
    image_list=np.append(image_list,[img],axis=0)
    label_list=np.append(label_list,int(item[0]))
label_list=label_list.reshape((label_list.size,1))
np.save('test_image.npy',image_list)
np.save('test_label.npy',label_list)
