import math
import csv
from sklearn import svm
from sklearn.model_selection import train_test_split
from sklearn import metrics
import numpy as np
from imblearn.ensemble import BalancedBaggingClassifier


def main():
    window_size = 17

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
    for pattern in sequence_patterns:
        n = len(pattern)
        row = []
        if pattern[window_size//2].islower():
            sequence_output_vector.append("+1")
        else:
            sequence_output_vector.append("-1")
        for i in range(n):
            temp_row = [0]*21
            temp_row[amino_acids.index(pattern[i].capitalize())] = 1
            row.extend(temp_row)
        sequence_vector.append(row)
    

    # x_tr, x_ts, y_tr, y_ts = train_test_split(sequence_vector, sequence_output_vector, test_size=0.2)
    sv = BalancedBaggingClassifier(svm.SVC(), n_estimators=30, sampling_strategy="auto", replacement=False, random_state=0)
    sv.fit(sequence_vector, sequence_output_vector)
    # predicted = sv.predict(x_ts)
    # print("Accuracy:",metrics.accuracy_score(y_ts, predicted))

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
        row = []
        for i in range(n):
            temp_row = [0]*21
            temp_row[amino_acids.index(pattern[i].capitalize())] = 1
            row.extend(temp_row)
        test_vector.append(row)

    predicted_output = sv.predict(test_vector)

    with open('SVM_output.csv', 'w', newline='') as file:
        w = csv.writer(file)
        w.writerow(['ID', 'Lable'])
        for i in range(len(test_ids)):
	        w.writerow([test_ids[i],predicted_output[i]])
    print("output saved in SVM_output.csv")

            




if __name__ == '__main__':
    main()