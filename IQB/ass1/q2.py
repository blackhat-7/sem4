import sys

def getTitle(output, f1):
    return " ".join(f1[0].split()[:2]) + "\n"

def getHeader(output, f1):
    for i in f1:
        temp = i.split()
        if temp[0] == "TITLE":
            return i[:-1] + "\n"

def getResolution(output, f1):
    for i in f1:
        temp = i.split()
        if len(temp) > 2 and temp[2] == "RESOLUTION.":
            return " ".join(temp[2:]) + "\n"

def main():
    f = open(sys.argv[2], "r")
    f1 = f.readlines()

    output = ""

    output += getTitle(output, f1)
    output += getHeader(output, f1)
    output += getResolution(output, f1)

    f.close()

    f = open(sys.argv[4], "w+")
    f.write(output + "\n")
    f.close()

if __name__ == "__main__":
    main()
