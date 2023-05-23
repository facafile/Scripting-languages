import sys

def inputMatrix(path):
    matrixA = {}
    matrixB = {}
    with open(path, "r") as file:
        dim_a = file.readline().split()
        line = file.readline()
        while line != "\n":
            i, j, k = line.split()
            if (int(i), int(j)) >= (int(dim_a[0]), int(dim_a[1])):
                print("index out of range")
                return None,None,None,None
            matrixA[(int(i), int(j))] = int(k)
            line =file.readline()

        dim_b = file.readline().split()
        line = file.readline()
        while line:
            i, j, k = line.split()
            if (int(i), int(j)) >= (int(dim_b[0]),int(dim_b[1])):
                print("index out of range")
                return None,None,None,None
            matrixB[(int(i), int(j))] = int(k)
            line = file.readline()
    return matrixA, (int(dim_a[0]), int(dim_a[1])), matrixB, (int(dim_b[0]), int(dim_b[1]))



def save(path, matrix, dim):
    string = str(dim[0]) + " " + str(dim[1]) + "\n"
    for el in matrix.keys():
        string += "{} {} {:4.2f}\n".format(el[0], el[1], matrix[el])
    with open(path, "w") as file:
        file.write(string)

def multiply(A, B, dimm_a, dimm_b):
    C = {}
    if dimm_a[1] != dimm_b[0]: return None
    for i in range(dimm_a[0]):
        for j in range(dimm_a[1]):
            for k in range(dimm_b[0]):
                if A.get((int(i), int(k)), 0) != 0 and B.get((int(k), int(j)), 0) != 0:
                    if C.get((int(i), int(j)),0):
                        C[(int(i), int(j))] += A.get((int(i), int(k)), 0) * B.get((int(k), int(j)), 0)
                    else:
                        C[(int(i), int(j))] = A.get((int(i), int(k)), 0) * B.get((int(k), int(j)), 0)
    return C


def printMatrix(matrix, dim):
    string = ""
    for i in range(dim[0]):
        for j in range(dim[1]):
            string +="{:4.2f} ".format(matrix.get((i,j), 0.00))
        string += "\n"
    print(string)



args = sys.argv[1:]

A, dim_a, B, dim_b = inputMatrix(args[0])
if None in (A,dim_a,B,dim_b):
    pass
else:
    C = multiply(A, B, dim_a, dim_b)
    print("A:")
    printMatrix(A, dim_a)
    print("B:")
    printMatrix(B, dim_b)
    print("A*B:")
    if C != None:
        printMatrix(C, (dim_a[0], dim_b[1]))
        save(args[1], C, (dim_a[0],dim_b[1]))
    else:
        print("wrong matrix dimensions")