n, r = input().split()
n = int(n)
r = int(r)
mainlis = list(map(int, input().split()))
mainset = list(set(mainlis))
# mainset.sort()
iter = 0
lis1 = []
for i in mainset:
    if i*r in mainset and (i*r*r) in mainset:
        lis1.append([])
        lis1[iter].append(i)
        lis1[iter].append(i*r)
        lis1[iter].append(i*r*r)
        iter += 1
dic = {}
for i in range(0, len(mainlis)):
    try:
        dic[mainlis[i]].append(i)
    except KeyError:
        dic[mainlis[i]] = list()
        dic[mainlis[i]].append(i)
count = 0
# for i in range(0, len(lis1)):
#     for k in dic[lis1[i][0]]:
#         for j in dic[lis1[i][1]]:
#             for u in dic[lis1[i][2]]:
#                 count += 1
for i in range(0, len(lis1)):
    if r > 1:
        count = count + (len(dic[lis1[i][0]]) * len(dic[lis1[i][1]]) * len(dic[lis1[i][2]]))
    else:
        count = count + ((len(dic[lis1[i][0]]) * (len(dic[lis1[i][1]])-1) * (len(dic[lis1[i][2]])-2))//6)
print(count)