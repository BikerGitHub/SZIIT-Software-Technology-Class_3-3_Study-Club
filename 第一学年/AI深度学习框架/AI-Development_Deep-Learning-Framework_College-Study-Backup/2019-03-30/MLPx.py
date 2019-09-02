
# coding: utf-8

# In[1]:


from keras.utils import np_utils
from keras.datasets import mnist
import numpy as np

# In[2]:


from keras.models import Sequential
from keras.layers import Dense

# In[8]:

(x_train_image,y_train_label),(x_test_image,y_test_label)=mnist.load_data()
x_train=x_train_image.reshape(60000,784).astype('float32')
x_test=x_test_image.reshape(10000,784).astype('float32')
x_train_normalize=x_train/255
y_train_ohe=np_utils.to_categorical(y_train_label)
units_list=[256,512,1024,2048,4096,8192]
def fit_run(super_model):
    best_acc_num_all=1
    if super_model['layer']:
        units_list=[512,1024,2048]
    else:
        units_list=[512,1024,2048]
    for units in units_list:
        model=Sequential()
        if super_model['layer']:
            model.add(Dense(units=super_model['layer'][0],input_dim=784,kernel_initializer='normal',activation='tanh'))
            for super_units in super_model['layer'][1:]:
                model.add(Dense(units=super_units,kernel_initializer='normal',activation='tanh'))
            model.add(Dense(units=units,kernel_initializer='normal',activation='tanh'))
        else:
            model.add(Dense(units=units,input_dim=784,kernel_initializer='normal',activation='tanh'))
        model.add(Dense(units=10,kernel_initializer='normal',activation='softmax'))
        model.compile(loss=super_model['loss'],optimizer=super_model['optimizer'],metrics=[super_model['metric']])
        epochs=int(8388608/model.count_params())
        if epochs>=16:
            epochs=16
        if model.count_params()<8388608:
            train_history=model.fit(x=x_train_normalize,y=y_train_ohe,validation_split=0.2,epochs=epochs,batch_size=256,verbose=0)
            result=model.predict_classes(x_test,verbose=2).astype(int) 
            true_acc=0
            for index in range(len(result)):
                if result[index]==y_test_label[index]:
                    true_acc+=1
            true_acc/=len(result)
            best_acc_num=true_acc
            print(super_model['optimizer']+'\t'+super_model['loss']+'\t'+str(super_model['layer']+[units])+'\t'+str(best_acc_num))
            result_file=open('result.csv','a')
            result_file.write(super_model['optimizer']+'\t'+super_model['loss']+'\t'+str(super_model['layer']+[units])+'\t'+str(best_acc_num)+'\n')
            result_file.close()
            del train_history
            if best_acc_num/best_acc_num_all>0.9 and best_acc_num>0.97:
                best_acc_num_all=best_acc_num
            else:
                break
            if best_acc_num/super_model['acc']>0.9 and len(super_model['layer'])<10:
                model={
                    'optimizer':super_model['optimizer'],
                    'loss':super_model['loss'],
                    'metric':super_model['metric'],
                    'layer':super_model['layer']+[units],
                    'acc':best_acc_num
                }
                fit_run(model)


# In[5]:


losses=['mean_squared_error','mean_absolute_error','mean_absolute_percentage_error','mean_squared_logarithmic_error','squared_hinge','hinge','categorical_hinge','logcosh','categorical_crossentropy','sparse_categorical_crossentropy','binary_crossentropy','kullback_leibler_divergence','poisson','cosine_proximity']
metrics=['acc','binary_accuracy','categorical_accuracy','sparse_categorical_accuracy','top_k_categorical_accuracy','sparse_top_k_categorical_accuracy']
optimizers=['sgd','rmsprop','adagrad','adadelta','adam','adamax','nadam']
activations=['softmax','elu','selu','softplus','softsign','relu','tanh','sigmoid','hard_sigmoid','exponential','linear']

# losses_blacklist=['sparse_categorical_crossentropy']
# losses=list(set(losses)-set(losses_blacklist))
# metrics_blacklist=['sparse_categorical_accuracy','sparse_top_k_categorical_accuracy']
# metrics=list(set(metrics)-set(metrics_blacklist))
# optimizers_blacklist=['sgd']
# optimizers=list(set(optimizers)-set(optimizers_blacklist))
# activations_blacklist=['elu','selu','relu','exponential','linear']
# activations=list(set(activations)-set(activations_blacklist))

losses=['categorical_hinge','poisson','categorical_crossentropy']
metrics=['binary_accuracy','categorical_accuracy']
optimizers=['rmsprop','adamax']
activations=['tanh','sigmoid']

from functools import reduce
possibility=reduce(lambda x, y: [i+j for i in x for j in y], map(lambda x:[[i] for i in x],[losses,metrics,optimizers,activations,['softmax']]))
# possibility=reduce(lambda x, y: [i+j for i in x for j in y], map(lambda x:[[i] for i in x],[losses,optimizers]))

import csv
csv_list=list(csv.reader(open('top.csv','r')))
possibility=csv_list
possibility_back=possibility
for index in range(1,32):
    possibility=possibility+possibility_back

# In[ ]:

#'\033[1;32;41mxxxxxxx\033[0m'
#optimizers=['Nadam']
#losses=['binary_crossentropy']
#for optimizer in optimizers:
    #for loss in losses:
        #model={
            #'optimizer':optimizer,
            #'loss':loss,
            #'layer':[],
            #'acc':0.95
        #}
        #fit_run(model)
#num=len(open('result.csv','r').readlines())
best_acc_all=0
num=1
try:
    for item in possibility:
        print(num,'/',len(possibility),item)
        model={
            'optimizer':item[2],
            'loss':item[0],
            'metric':item[1],
            'layer':[],
            'acc':0.95
        }
        fit_run(model)
        #model=Sequential()
        #model.add(Dense(units=1024,input_dim=784,kernel_initializer='normal',activation=item[3]))
        #model.add(Dense(units=10,kernel_initializer='normal',activation=item[4]))
        #model.compile(loss=item[0],optimizer=item[2],metrics=[item[1]])
    #     model.add(Dense(units=1024,input_dim=784,kernel_initializer='normal',activation='relu'))
    #     model.add(Dense(units=10,kernel_initializer='normal',activation='softmax'))
    #     model.compile(loss=item[0],optimizer=item[1],metrics=['acc'])
        #train_history=model.fit(x=x_train_normalize,y=y_train_ohe,validation_split=0.2,epochs=32,batch_size=500,verbose=0)
        #best_acc_num=max(train_history.history['val_'+item[1]])
        #result=model.predict_classes(x_test,verbose=2).astype(int) 
        #true_acc=0
        #for index in range(len(result)):
            #if result[index]==y_test_label[index]:
                #true_acc+=1
        #true_acc/=len(result)
        #print(str(item)[1:-1]+'\t'+str(best_acc_num)+'\t'+str(true_acc))
        #print(str(best_acc_num)+'\t'+str(true_acc))
        #result_file.write(str(item)[1:-1]+','+str(best_acc_num)+','+str(true_acc)+'\n')
        #del model
        num+=1
        #if best_acc_all<true_acc:
            #print('\033[1;32;41m                              best_acc='+str(true_acc)+'                              \033[0m')
            #best_acc_all=true_acc
except Exception:
    #clean memory
    import tensorflow as tf
    import keras.backend
    keras.backend.clear_session()
    tf.reset_default_graph()
    raise(Exception)
else:
    result_file.close()
    print('over')


