import rubik
import random
import time
import sys


avgTimeN = 0
avgTimeO = 0


def shortest_path(start, end):
    """
    For Question 1, using BFS, finds the shortest path from start_position to
    end_position. Returns a list of moves.

    You can use the rubik.quarter_twists move set.
    Each move can be applied using rubik.perm_apply
    """
    visited = [start]
    moves = dict()
    moves[start] = []
    finalm = []
    q = [start]
    found = False
    while(len(q) != 0 and not found):
        s = q.pop(0)
        m = moves[s]
        visited.append(s)
        if s == end:
            found = True
            finalm = m
            break

        for i in range(6):
            x = rubik.perm_apply(rubik.quarter_twists[i], s)
            if x not in moves:
                q.append(x)
                moves[x] = m + [rubik.quarter_twists_names[rubik.quarter_twists[i]]]
    # if found:
        # sys.stdout.write(str(finalm) + "\n")
    return finalm
            
    

def shortest_path_optmized(start, end):
    """
    For Question 2, using 2-way BFS, finds the shortest path from start_position to
    end_position. Returns a list of moves. 

    You can use the rubik.quarter_twists move set.
    Each move can be applied using rubik.perm_apply
    """
    startTime = time.time()
    movesStart = dict()
    movesStart[start] = []
    movesEnd = dict()
    movesEnd[end] = []
    qStart = []
    qEnd = []
    qStart.append(start)
    qEnd.append(end)
    found = False
    finalMoves = []

    while(len(qStart) != 0 and len(qEnd) != 0  and not found):
        s = qStart.pop(0)
        e = qEnd.pop(0)
        m = movesStart[s]
        n = movesEnd[e]

        if s == end:
            finalMoves = m
            found = True
            break
        if s in movesEnd:
            finalMoves = m + movesEnd[s][::-1]
            found = True
            break
        if e in movesStart:
            finalMoves = movesStart[e] + n[::-1]
            found = True
            break

        for i in range(6):
            x = rubik.perm_apply(rubik.quarter_twists[i], s)
            y = rubik.perm_apply(rubik.quarter_twists[i], e)
            if x not in movesStart:
                qStart.append(x)
                movesStart[x] = m + [rubik.quarter_twists_names[rubik.quarter_twists[i]]]
            if y not in movesEnd:
                qEnd.append(y)
                movesEnd[y] = n + [rubik.quarter_twists_names[rubik.perm_inverse(rubik.quarter_twists[i])]]
    # if found:
        # sys.stdout.write(str(finalMoves) + "\n")
    sys.stdout.write("time: " + str(time.time()-startTime) + "\n")
    return finalMoves

def check(start, end, sol): #['F', 'F', 'Ui', 'L', 'Ui', 'F', 'Li', 'U', 'Li', 'Fi', 'Li', 'U', 'Li', 'Fi']
    for i in sol:
        x = rubik.quarter_twists_names.keys()[rubik.quarter_twists_names.values().index(i)]
        start = rubik.perm_apply(x, start)
    if start == end:
        sys.stdout.write("Correct\n")
    else:
        sys.stdout.write("Wrong\n")

def compareTime(time1, time2):
    sys.stdout.write(str(time1/time2) + " times faster")

def main(start):
    global avgTimeN
    global avgTimeO
    end = (0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23)
    # sys.stdout.write("Normal: \n")
    startTime = time.time()
    route = shortest_path(start, end)
    avgTimeN += time.time()-startTime
    # check(start, end, route)
    
    # sys.stdout.write("Optimized: \n")
    startTime = time.time()
    routeOptimized = shortest_path_optmized(start, end)
    avgTimeO += time.time()-startTime
    # check(start, end, routeOptimized)

    sys.stdout.write("\n")



if __name__ == '__main__':
    timesRun = 30
    for k in range(timesRun):
        start = (0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23)
        for i in range(8):
            x = random.randint(0, 5)
            # print(rubik.quarter_twists_names[rubik.quarter_twists[x]])
            start = rubik.perm_apply(rubik.quarter_twists[x], start)
        main(start)
    avgTimeN /= timesRun
    avgTimeO /= timesRun
    compareTime(avgTimeN, avgTimeO)
    # print(rubik.perm_apply(rubik.quarter_twists[5], end))
    # main()