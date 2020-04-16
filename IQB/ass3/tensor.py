# import tensorflow as tf
import csv
from sklearn import svm

def main():
    window_size = 9

    amino_acids = ['A', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'K', 'L', 'M', 'N', 'P', 'Q', 'R', 'S', 'T', 'V', 'W', 'Y', 'X']

    sequence_list = []
    with open('traintemp.data.txt') as csv_file:
        csv_reader = csv.reader(csv_file, delimiter=',')
        next(csv_reader)
        for row in csv_reader:
            sequence_list.append("X"*((window_size-1)//2) + row[1] + "X"*((window_size-1)//2))

    
    sequence_patterns = []
    for sequence in sequence_list:
        n = len(sequence)
        patterns = []
        for i in range(n-window_size+1):
            patterns.append(sequence[i : i+window_size])
        sequence_patterns.append(patterns)


    sequence_binary_vector = []
    sequence_output_vector = []
    for patterns in sequence_patterns:
        for pattern in patterns:
            row = []
            if pattern[window_size//2].islower():
                sequence_output_vector.append("+1")
            else:
                sequence_output_vector.append("-1")
            for char in pattern:
                temp_row = [0]*21
                temp_row[amino_acids.index(char.capitalize())] = 1
                row.extend(temp_row)
            sequence_binary_vector.append(row)
    
    sv = svm.SVC()
    print(len(sequence_binary_vector))
    sv.fit(sequence_binary_vector, sequence_output_vector)

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
    
    test_binary_vector = []
    for pattern in test_patterns:
        for char in pattern:
            temp_row = [0]*21
            temp_row[amino_acids.index(char.capitalize())] = 1
            row.extend(temp_row)
        test_binary_vector.append(row)

    predicted_output = sv.predict(test_binary_vector)

    with open('SVM_output.csv', 'w', newline='') as file:
        w = csv.writer(file)
        w.writerow(['ID', 'Lable'])
        for i in range(len(test_ids)):
	        w.writerow([test_ids[i],predicted_output[i]])
    print("output saved in SVM_output.csv")

            




if __name__ == '__main__':
    main()