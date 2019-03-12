#!/usr/bin/env python
# coding: utf-8

# # 可视化初步

# ### 绘制函数曲线
# 通常使用matplotlib.pyplot包

# 在作业中回答的问题，需要在markdown类型的单元格中，以语言或者公式进行描述

# In[35]:


# step 1: 引入需要使用的包（库）
import numpy as np
import matplotlib.pyplot as plt


# In[36]:


# step 2: 创建横坐标（明确绘制的图形样式）
x = np.arange(0,10,0.01)
# print(x)


# In[37]:


# step 2: 创建纵坐标（明确绘制的图形样式）
y = np.sin(x)
# print(y)
z = np.sin(x ** 2)


# In[60]:


# step 3: 调用绘图包进行绘图并显示

# 设置图的大小
plt.figure( figsize=(6,5) )
# 设置图的名称
plt.title('Volt/time Waveforms')

# 设置横纵轴的名称
plt.xlabel("Time(s)")
plt.ylabel('Volt(v)')

# 设置纵轴的表示范围
plt.ylim(-1.3,1.2)

# puzzle 1: 设置横轴的表示范围为[-1,12]
#  to be filled

plt.plot(x,y,color='red',label='$y=sin(x)$')

plt.plot(x,z)
plt.legend()
# puzzle 2: 如下代码绘制的曲线是什么？
# plt.plot(x,y,z)

plt.show()


# In[49]:


# puzzle 3 ：为另一条曲线设置属性，图示等属性，并将图调整至美观


# In[ ]:





# In[ ]:




