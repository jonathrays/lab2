import re

ips = []
dict = {}

f = open("access.log", "r")
ips = re.findall(r'[0-9]+(?:\.[0-9]+){3}', f.read())
f.close()

ips = list(set(ips))

while ips:
    a = '.'.join(ips[0].split('.')[0:3])
    if dict.get(a) is None:
        dict.update([(a, [ips.pop()])])
    else:
        dict[a].append(ips.pop())

for i in dict.keys():
    print(i, ' :', ', '.join(dict[i]))
