import csv
from sklearn import svm
from tensorflow.keras.models import Sequential
from tensorflow.keras.layers import Dense
import math

def main():
    window_size = 7

    amino_acids = ['A', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'K', 'L', 'M', 'N', 'P', 'Q', 'R', 'S', 'T', 'V', 'W', 'Y', 'X']

    sequence_list = []
    with open('train.data') as csv_file:
        csv_reader = csv.reader(csv_file, delimiter=',')
        next(csv_reader)
        for row in csv_reader:
            sequence_list.append("X"*((window_size-1)//2) + row[1] + "X"*((window_size-1)//2))

    
    sequence_patterns = []
    for sequence in sequence_list:
        n = len(sequence)
        for i in range(n-window_size+1):
            sequence_patterns.append(sequence[i : i+window_size])


    sequence_vector = []
    sequence_output_vector = []

    for patterns in sequence_patterns:
        for pattern in patterns:
            n = len(pattern)
            row = [0]*n
            if pattern[window_size//2].islower():
                sequence_output_vector.append("+1")
            else:
                sequence_output_vector.append("-1")
            for i in range(n):
                row[i] = ord(pattern[i].capitalize()) - 65
            sequence_vector.append(row)
    print(len(sequence_vector))
    # n = len(sequence_patterns)
    # l = window_size
    # scoring_matrix = [[0.0]*(21*4) for i in range(l*4)]
    # sequence_output_vector = [0]*n
    # for i in range(l):
    #     for j in range(21):
    #         m=1
    #         for k in range(n):
    #             if i==l//2:
    #                 if sequence_patterns[k][i].islower():
    #                     sequence_output_vector[k] = "+1"
    #                 else:
    #                     sequence_output_vector[k] = "-1"
    #             if amino_acids[j]==sequence_patterns[k][i].capitalize():
    #                 m=m+1
    #         v=m/(21+n)
    #         scoring_matrix[i][j]=(math.log(v/0.05))/math.log(10)
    
    model = Sequential()
    model.add(Dense(8, input_shape = (8,)))

    test_ids = []
    test_sequence = ""
    with open('test1.txt') as csv_file:
        csv_reader = csv.reader(csv_file, delimiter=',')
        next(csv_reader)
        for row in csv_reader:
            test_ids.append(row[0])
            test_sequence += row[1]

    test_sequence = 'X'*((window_size-1)//2) + test_sequence + 'X'*((window_size-1)//2)
    test_patterns = []
    test_n = len(test_sequence)
    for i in range(test_n-window_size+1):
        test_patterns.append(test_sequence[i : i+window_size])

    test_vector = []
    for pattern in test_patterns:
        n = len(pattern)
        row = [0]*n
        for i in range(n):
            row[i] = ord(pattern[i].capitalize()) - 65
        test_vector.append(row)

    # n = len(test_patterns)
    # test_matrix = [[0.0]*(21*4) for i in range(l*4)]
    # for i in range(l):
    #     for j in range(21):
    #         m=1
    #         for k in range(n):
    #             if amino_acids[j]==test_patterns[k][i]:
    #                 m=m+1
    #         v=m/(21+n)
    #         test_matrix[i][j]=(math.log(v/0.05))/math.log(10)

    predicted_output = sv.predict(test_matrix)

    with open('SVM_output.csv', 'w', newline='') as file:
        w = csv.writer(file)
        w.writerow(['ID', 'Lable'])
        for i in range(len(test_ids)):
	        w.writerow([test_ids[i],predicted_output[i]])
    print("output saved in SVM_output.csv")

            




if __name__ == '__main__':
    main()