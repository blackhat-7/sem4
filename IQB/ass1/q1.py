import sys

map = {"UUU":"F", "UUC":"F", "UUA":"L", "UUG":"L",
    "UCU":"S", "UCC":"s", "UCA":"S", "UCG":"S",
    "UAU":"Y", "UAC":"Y", "UAA":"-", "UAG":"-",
    "UGU":"C", "UGC":"C", "UGA":"-", "UGG":"W",
    "CUU":"L", "CUC":"L", "CUA":"L", "CUG":"L",
    "CCU":"P", "CCC":"P", "CCA":"P", "CCG":"P",
    "CAU":"H", "CAC":"H", "CAA":"Q", "CAG":"Q",
    "CGU":"R", "CGC":"R", "CGA":"R", "CGG":"R",
    "AUU":"I", "AUC":"I", "AUA":"I", "AUG":"M",
    "ACU":"T", "ACC":"T", "ACA":"T", "ACG":"T",
    "AAU":"N", "AAC":"N", "AAA":"K", "AAG":"K",
    "AGU":"S", "AGC":"S", "AGA":"R", "AGG":"R",
    "GUU":"V", "GUC":"V", "GUA":"V", "GUG":"V",
    "GCU":"A", "GCC":"A", "GCA":"A", "GCG":"A",
    "GAU":"D", "GAC":"D", "GAA":"E", "GAG":"E",
    "GGU":"G", "GGC":"G", "GGA":"G", "GGG":"G"}

def convert(line):
    RNA = ""
    for i in line:
        if i != "\n":
            if i == "T":
                RNA += "U"
            else:
                RNA += i
        
    return RNA

def divideToTriplets(RNA):
    protein = ""
    count = 0
    for i in range(0, len(RNA), 3):
        protein += map[RNA[i:i+3]]

    return protein

def new_line(protein):
    final_protien = ""
    for i in range(len(protein)):
        if(i % 60 == 0 and i != 0):
            final_protien += "\n"
        final_protien += protein[i]
    final_protien += "\n"
    return final_protien





def main():
    f = open(sys.argv[2], "r")
    f1 = f.readlines()
    RNA = ""
    for i in f1[1:]:
        RNA += convert(i)
    protein = divideToTriplets(RNA)
    final_protein = new_line(protein)
    f.close()

    f = open(sys.argv[4], "w+")
    f.write(f1[0])
    f.write(final_protein + "\n")
    f.close()


if __name__ == "__main__":
    main()
