import pandas as pd
csv_data=pd.read_csv('tourist_data.csv',index_col=u'日期')
print(csv_data.sum())