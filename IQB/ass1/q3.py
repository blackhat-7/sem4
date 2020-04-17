import sys

def match_value(string1, string2, x, y):
    if string1[y] == string2[x]:
        return 1
    else:
        return 0

# def print_mat(mat):
#     for i in range(len(mat)):
#         for j in range(len(mat[0])):
#             print(mat[i][j], end = " ")
#         print()
#     print()

def dotplot_to_string(arr):
    s=""
    for i in arr:
        s+="".join(i)
        s+="\n"
    return s

def mat_to_string(arr):
    s=""
    for i in range(len(arr)):
        for j in range(len(arr[0])):
            s+=str(arr[i][j]) + " "
            if len(str(arr[i][j]))==1:
                s += " "

        s+="\n"
    return s

def dotPlot(mat, string1, string2):
    l1 = len(string1)
    l2 = len(string2)

    arr = [[0]*(l1+1) for i in range(l2+1)]

    for i in range(1,l1+1):
        arr[0][i] = " " + string1[i-1]
    for i in range(1,l2+1):
        arr[i][0] = string2[i-1]

    for i in range(1,l2+1):
        for j in range(1,l1+1):
            if string1[j-1] == string2[i-1]:
                arr[i][j]=" ."
            else:
                arr[i][j]="  "

    arr[0][0]=" "
    ans=dotplot_to_string(arr)
    ans1=mat_to_string(mat)

    f = open(sys.argv[4], "w+")
    f.write(ans1)
    f.write("\n")
    f.write(ans)
    f.close()

def main():
    my_file = open(sys.argv[2], "r")
    fa1 = my_file.readlines()
    string1=fa1[1][:-1]
    string2=fa1[5][:-1]
    m = len(string1)+1
    n = len(string2)+1

    mat = [[0]*m for i in range(n)]
    pointer = [[None]*m for i in range(n)]

    for i in range(m):
        pointer[0][i] = "←"
    for i in range(n):
        pointer[i][0] = "↑"

    for j in range(1, m):
        for i in range(1, n):
            diagonal = mat[i-1][j-1]+match_value(string1,string2,i-1,j-1)
            vertical = mat[i-1][j]
            horizontal = mat[i][j-1]
            ma = max(diagonal, vertical, horizontal)
            mat[i][j] = ma
            pointer[i][j] = "↖" if ma == diagonal else ("↑" if ma == vertical else "←")
    
    finalString = ""
    finalString2 = ""
    j = m-1
    i = n-1
    while(i > 0 or j > 0):
        if pointer[i][j] == "↖":
            finalString = string1[j-1] + finalString
            finalString2 = string2[i-1] + finalString2
            i -= 1; j -= 1
            
        elif pointer[i][j] == "↑":
            finalString = "-" + finalString
            finalString2 = string2[i-1] + finalString2
            i -= 1
            
        elif pointer[i][j] == "←":
            finalString = string1[j-1] + finalString
            finalString2 = "-" + finalString2
            j -= 1
    

    dotPlot(mat, string1, string2)



if __name__ == "__main__":
    main()




