filmdb=['The Godfather\n','The Godfather: Part II\n','The Godfather Part III\n']
filename='Films.txt'
n=0
with open(filename,'rt') as films:
    for i in films:
        try:
            filmnum=filmdb.index(i)
        except ValueError:
            pass
        else:
            filmdb.pop(filmnum)
            n=n+1
print(n)
for i in filmdb:
    print(i)

'''
for i in filmdb:
    open(filename,'at').write(i)
'''
