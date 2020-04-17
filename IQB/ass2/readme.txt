 About the Assignment
---------------------

Our submission uses SVM (Support Vector Machine) machine learning technique to predict AFP and non AFP. It uses the nucleotide sequences to calculate the percentage 1. AAC (Amino Acid Composition)
2. DPC(Di Peptide Composition) and 
3. TPC (Tri Peptide Composition) 
which is then passed as input to SVM library as X and y is the give label in train.csv. Uses train.csv to train and tests on nucleotides from test.csv

Functions and Procedures Explained:-

    1. get_training_data
    We have taken training data set 'train.csv' and put it inside a inforamtion in shortlisted list. 

    2. calculate_probability_amino_acids_train
    All the sequences in shortlisted containing
    G', 'T', 'I', 'F', 'D', 'C', 'E', 'S', 'L', 'Y', 'K', 'W', 'N', 'A', 'R', 'H', 'V', 'P', 'Q', 'M' amino acids have certain probabilities of occurance which has been stored in an array probabilities.

    3. train_the_data
    Using SVC(Support Vector Classification), taking gamma = 15(scale) and kernel = 'rbf'(also as default)
    Now the data is appended to array X and y.
    Further fit(self, X, y) is called to fit the SVM model according to the given training data.

    4. get_test_and_sample_data
    Now, from given file 'test.csv' test raw data is taken and kept in 
    the array test_data. The array sample_data is filled by file 'sample.csv' .

    5. calculate_probability_amino_acids_test
    Here we again put the probabilities of occurance of 'test_data.csv'
    into an array probabilities_test.

    6. predict_outputs
    Eventually predicted values of svm are stored in an array final_sv_predicted.

    7. write_to_csv
    Moreover, the output is saved in a file 'SVM_output.csv'.


How to run (for best result):
-----------------------------
python SVMcode_tri_15.py

Predicted output:
-----------------
SVM_output.csv