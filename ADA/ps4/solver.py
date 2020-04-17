import rubik
import random
import time
import sys
import collections


avgTimeN = 0
avgTimeO = 0


def shortest_path(start, end):
    """
    For Question 1, using BFS, finds the shortest path from start_position to
    end_position. Returns a list of moves.

    You can use the rubik.quarter_twists move set.
    Each move can be applied using rubik.perm_apply
    """
    moves = dict()
    moves[start] = []
    finalm = []
    q = collections.deque([start])
    found = False
    while(len(q) != 0 and not found):
        s = q.popleft()
        m = moves[s]
        if s == end:
            found = True
            finalm = m
            break

        for i in range(6):
            x = rubik.perm_apply(rubik.quarter_twists[i], s)
            if x not in moves:
                q.append(x)
                moves[x] = m + [rubik.quarter_twists_names[rubik.quarter_twists[i]]]
    if found:
        sys.stdout.write(str(finalm) + "\n")
        return finalm
    else:
        sys.stdout.write(str("No solution\n"))
        return [None]
            
    

def shortest_path_optmized(start, end):
    """
    For Question 2, using 2-way BFS, finds the shortest path from start_position to
    end_position. Returns a list of moves. 

    You can use the rubik.quarter_twists move set.
    Each move can be applied using rubik.perm_apply
    """
    movesStart = dict()
    movesStart[start] = []
    movesEnd = dict()
    movesEnd[end] = []
    qStart = collections.deque()
    qEnd = collections.deque()
    qStart.append(start)
    qEnd.append(end)
    found = False
    finalMoves = []

    while(len(qStart) != 0 and len(qEnd) != 0  and not found):
        s = qStart.popleft()
        e = qEnd.popleft()
        m = movesStart[s]
        n = movesEnd[e]
        if len(m) > 8 and len(n) > 8:
            break
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
    if found:
        sys.stdout.write(str(finalMoves) + "\n")
        return finalMoves
    else:
        sys.stdout.write(str("No solution\n"))
        return [None]

#Check whether sol actually solves the rubik from start to end
def check(start, end, sol): 
    for i in sol:
        x = rubik.quarter_twists_names.keys()[rubik.quarter_twists_names.values().index(i)]
        start = rubik.perm_apply(x, start)
    if start == end:
        sys.stdout.write("Correct\n")
    else:
        sys.stdout.write("Wrong\n")

#Compare time
def compareTime(time1, time2):
    sys.stdout.write(str(time1/time2) + " times faster\n")

#Main function that runs the normal and the optimized algorithm, check the solutions and time the solutions
def main(start):
    global avgTimeN
    global avgTimeO
    end = (0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23)
    sys.stdout.write("Normal: \n")
    startTime = time.time()
    route = shortest_path(start, end)
    endTime = time.time()
    sys.stdout.write("time: " + str(endTime-startTime) + "\n")
    avgTimeN += endTime-startTime
    if route != [None]:
        check(start, end, route)
    
    sys.stdout.write("Optimized: \n")
    startTime = time.time()
    routeOptimized = shortest_path_optmized(start, end)
    endTime = time.time()
    sys.stdout.write("time: " + str(endTime-startTime) + "\n")
    avgTimeO += endTime-startTime
    if routeOptimized != [None]:
        check(start, end, routeOptimized)

def test():
    global avgTimeN
    global avgTimeO
    numTestCases = 100                                                                                          #Number of tests
    maxLengthOfSolution = 10                                                                                    #Max number of steps it takes to solve

    for k in range(numTestCases):
        start = (0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23)
        for i in range(maxLengthOfSolution):
            x = random.randint(0, 5)
            start = rubik.perm_apply(rubik.quarter_twists[x], start)
        main(start)

    avgTimeN /= numTestCases
    avgTimeO /= numTestCases
    sys.stdout.write("Average time bfs: " + str(avgTimeN) + "\n")
    sys.stdout.write("Average time optimized bfs: " + str(avgTimeO) + "\n")
    compareTime(avgTimeN, avgTimeO)

if __name__ == '__main__':
    start = (7, 8, 6, 20, 18, 19, 3, 4, 5, 16, 17, 15, 0, 1, 2, 14, 12, 13, 10, 11, 9, 21, 22, 23)            #Specify your own start
    main(start)
    # test()                                                                                                  #Uncomment to generates 100 random testcases and check