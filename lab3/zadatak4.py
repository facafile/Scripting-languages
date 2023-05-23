import urllib.request
import re
import sys

link = sys.argv[1]
stranica = urllib.request.urlopen(link)
mybytes = stranica.read()
mystr = mybytes.decode("utf8")

#linkovi
x = list(set(re.findall("href=\"\S*\"", mystr)))
for el in x:
    print(el)

#hosts
x = list(set(re.findall("href=(\"\S*\")", mystr)))
for el in x:
    print(el)

#num of times
for el in x:
    print("num of times " + el + " --> " + str(len(re.findall(el ,mystr))))

#emails
x = re.findall("[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}", mystr)
for el in x:
    print(el)
#slike
x = re.findall("<img [^>]* src=\"\S*\"[^>]*", mystr)
print("num of images with links: " + str(len(x)))