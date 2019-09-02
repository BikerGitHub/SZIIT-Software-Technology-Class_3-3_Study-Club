import numpy as np
csv_array=np.loadtxt('tourist_data.csv',dtype=str,delimiter=',')
place_num=csv_array[1:,1:].astype(np.int).sum(axis=0)
print(*[
    place+':'+str(place_num[int(np.argwhere(csv_array[0]==place))-1])
    for place in csv_array[0][1:]
],sep='\n')
