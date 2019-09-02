import keras
import numpy as np

x_test=np.load('test_image.npy')
y_test=np.load('test_label.npy')

def color_preprocessing(x_test):
    x_test = x_test.astype('float32')
    mean = [125.3, 123.0, 113.9]
    std  = [63.0,  62.1,  66.7]
    for i in range(3):
        x_test[:,:,:,i] = (x_test[:,:,:,i] - mean[i]) / std[i]

    return x_test

y_test_ohe = keras.utils.to_categorical(y_test, 10)
x_test = color_preprocessing(x_test)

model=keras.models.load_model('wresnet.h5')
print(model.evaluate(x_test,y_test_ohe))

result=np.argmax(model.predict(x_test),axis=1)
#result=model.predict_classes(x_test).astype(int) 
true_acc=0
acc_classes=np.zeros(10)
classes_num=np.zeros(10)
for index in range(len(result)):
    if result[index]==y_test[index]:
        true_acc+=1
        acc_classes[y_test[index]]+=1
    classes_num[y_test[index]]+=1
true_acc/=len(result)
print(true_acc)
label_dict={0:'中性笔',1:'胶布',2:'资料夹',3:'打印纸',4:'美工刀',5:'回形针',6:'尺子',7:'订书机',8:'圆规',9:'剪刀'}
i=0
result_file=open('result.txt','w')
result_file.write(str(true_acc)+'\n')
for item in acc_classes/classes_num:
    print(label_dict[i],item)
    result_file.write(label_dict[i]+str(item)+'\n')
    i+=1
