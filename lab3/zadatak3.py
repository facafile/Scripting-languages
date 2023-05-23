import sys
import os

class Student:
    def __init__(self, jmbag, ime, prezime):
        self.jmbag = jmbag
        self.ime = ime
        self.prezime = prezime
        self.labs = {}

def addStudents(path):
    stList = []
    with open(path+"//studenti.txt","r", encoding='utf8') as file1:
        student = file1.readline()
        while student:
            student = student.split()
            stList.append(Student(student[0], student[2], student[1]))
            student = file1.readline()
    return stList

def addLabs(dir, stList):
    files = os.listdir(dir)
    labs = set()
    for el in files:
        if el == "studenti.txt":
            continue

        lab = "L" + el.split("_")[1]
        labs.add(lab)
        with open(dir + "//" + el, "r", encoding='utf8') as file1:
            st = file1.readline()
            while st:
                st = st.split()
                student = next(obj for obj in stList if obj.jmbag == st[0])
                if student.labs.get(lab ,"-") != "-":
                    print("value already exists for {} {}".format(student.ime + " " + student.prezime, lab))
                else:
                    student.labs[lab] = float(st[1])
                st = file1.readline()
    return labs

def formatOut(stList, labs):
    labs = list(labs)
    labs.sort()
    string = "{:15s} {:10s} {:10s}".format("JMBAG", "Prezime,", "Ime")
    for el in labs:
        string += "{:>6s}".format(el)
    string += "\n"
    for el in stList:
        string += "{:15s} {:10s} {:10s}".format(el.jmbag, el.prezime+",", el.ime)
        for el2 in labs:
            score = el.labs.get(el2, "-")
            if score == "-":
                string += "{:>6s}".format(score)
            else:
                string += "{:6.2f}".format(score)
        string += "\n"
    print(string)




dir = sys.argv[1]
stList = addStudents(dir)
labs = addLabs(dir, stList)
formatOut(stList, labs)

