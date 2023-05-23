import sys

def imp(path):
    lista = []
    with open(path, "r") as file1:
        inner = file1.readline()
        while inner:
            inner = inner.split()
            inner.sort()
            lista.append(inner)
            inner = file1.readline()


    size = len(lista[0])
    return lista, size

def printAndFormat(list, size):
    string = "Hyp#Q10#Q20#Q30#Q40#Q50#Q60#Q70#Q80#Q90\n"
    for i in range(len(list)):
        string += "{:03d}".format(i+1)
        for j in range(9):
            index = int(size * (j+1) / 10) - 1
            string += "#{:3.1f}".format(float(list[i][index]))
        string += "\n"

    print(string)


path = sys.argv[1]
list, size = imp(path)
printAndFormat(list, size)


