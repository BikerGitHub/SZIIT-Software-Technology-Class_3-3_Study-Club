from keras.utils import np_utils
import numpy as np

IMG_ROWS, IMG_COLS = 32,32

x_img_train=np.load('train_image.npy')
y_label_train=np.load('train_label.npy')
x_img_test=np.load('test_image.npy')
y_label_test=np.load('test_label.npy')
x_img_train_normalize=x_img_train.astype(float)/255
x_img_test_normalize=x_img_test.astype(float)/255
y_label_train_oht=np_utils.to_categorical(y_label_train)
y_label_test_oht=np_utils.to_categorical(y_label_test)

from keras.models import Sequential
from keras.layers import Dense,Dropout,Activation,Flatten
from keras.layers import Conv2D,MaxPooling2D,ZeroPadding2D
model=Sequential()
model.add(Conv2D(filters=64,kernel_size=(5,5),input_shape=(IMG_ROWS, IMG_COLS,3),activation='relu',padding='same'))
# model.add(Conv2D(filters=32,kernel_size=(5,5),input_shape=(28,28,1),activation='relu',padding='same'))
model.add(Dropout(rate=0.25))
model.add(MaxPooling2D(pool_size=(2,2)))
model.add(Conv2D(filters=128,kernel_size=(3,3),activation='relu',padding='same'))
model.add(Dropout(rate=0.25))
model.add(MaxPooling2D(pool_size=(2,2)))
model.add(Flatten())
model.add(Dropout(rate=0.25))
model.add(Dense(units=1024,activation='relu'))
model.add(Dropout(rate=0.25))
model.add(Dense(units=10,activation='softmax'))

model.compile(loss='categorical_crossentropy',optimizer='adam',metrics=['acc'])
train_history=model.fit(x_img_train_normalize,y_label_train_oht,validation_split=0.2,epochs=8,batch_size=16,verbose=1)

result=model.predict_classes(x_img_test_normalize).astype(int) 
true_acc=0
acc_classes=np.zeros(10)
classes_num=np.zeros(10)
for index in range(len(result)):
    if result[index]==y_label_test[index]:
        true_acc+=1
        acc_classes[y_label_test[index]]+=1
    classes_num[y_label_test[index]]+=1
true_acc/=len(result)
print(true_acc)
label_dict={0:'中性笔',1:'胶布',2:'资料夹',3:'图钉',4:'美工刀',5:'回形针',6:'尺子',7:'订书机',8:'圆规',9:'剪刀'}
i=0
result_file=open('result.txt','w')
result_file.write(str(true_acc)+'\n')
for item in acc_classes/classes_num:
    print(label_dict[i],item)
    result_file.write(label_dict[i]+str(item)+'\n')
    i+=1

