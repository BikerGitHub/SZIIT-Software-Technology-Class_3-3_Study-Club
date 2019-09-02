import csv
csv_list=list(csv.reader(open('tourist_data.csv','r')))
print(*[
    place+':'+str(sum(
        int(day[csv_list[0].index(place)]) 
        for day in csv_list[1:]
        ))
    for place in csv_list[0][1:]
],sep='\n')
