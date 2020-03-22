import sys
import csv
# import pandas as pd
from sklearn.linear_model import LogisticRegression
from sklearn import svm


shortlisted = [] # will contains the input with all columns
def makedic():
	a="GTIFDCESLYKWNARHVPQM"
	dic={}
	for i in a:
		dic.update({i:0})
	for i in range(len(a)):
		for j in range(len(a)):
			dic.update({a[i]+a[j]:0})
	for i in range(len(a)):
		for j in range(len(a)):
			for k in range(len(a)):
				dic.update({a[i]+a[j]+a[k]:0})
	# dic={'G': 0, 'T': 0, 'I': 0, 'F': 0, 'D': 0, 'C': 0, 'E': 0, 'S': 0, 'L': 0, 'Y': 0, 'K': 0, 'W': 0, 'N': 0, 'A': 0, 'R': 0, 'H': 0, 'V': 0, 'P': 0, 'Q': 0, 'M': 0, 'GG': 0, 'GT': 0, 'GI': 0, 'GF': 0, 'GD': 0, 'GC': 0, 'GE': 0, 'GS': 0, 'GL': 0, 'GY': 0, 'GK': 0, 'GW': 0, 'GN': 0, 'GA': 0, 'GR': 0, 'GH': 0, 'GV': 0, 'GP': 0, 'GQ': 0, 'GM': 0, 'TG': 0, 'TT': 0, 'TI': 0, 'TF': 0, 'TD': 0, 'TC': 0, 'TE': 0, 'TS': 0, 'TL': 0, 'TY': 0, 'TK': 0, 'TW': 0, 'TN': 0, 'TA': 0, 'TR': 0, 'TH': 0, 'TV': 0, 'TP': 0, 'TQ': 0, 'TM': 0, 'IG': 0, 'IT': 0, 'II': 0, 'IF': 0, 'ID': 0, 'IC': 0, 'IE': 0, 'IS': 0, 'IL': 0, 'IY': 0, 'IK': 0, 'IW': 0, 'IN': 0, 'IA': 0, 'IR': 0, 'IH': 0, 'IV': 0, 'IP': 0, 'IQ': 0, 'IM': 0, 'FG': 0, 'FT': 0, 'FI': 0, 'FF': 0, 'FD': 0, 'FC': 0, 'FE': 0, 'FS': 0, 'FL': 0, 'FY': 0, 'FK': 0, 'FW': 0, 'FN': 0, 'FA': 0, 'FR': 0, 'FH': 0, 'FV': 0, 'FP': 0, 'FQ': 0, 'FM': 0, 'DG': 0, 'DT': 0, 'DI': 0, 'DF': 0, 'DD': 0, 'DC': 0, 'DE': 0, 'DS': 0, 'DL': 0, 'DY': 0, 'DK': 0, 'DW': 0, 'DN': 0, 'DA': 0, 'DR': 0, 'DH': 0, 'DV': 0, 'DP': 0, 'DQ': 0, 'DM': 0, 'CG': 0, 'CT': 0, 'CI': 0, 'CF': 0, 'CD': 0, 'CC': 0, 'CE': 0, 'CS': 0, 'CL': 0, 'CY': 0, 'CK': 0, 'CW': 0, 'CN': 0, 'CA': 0, 'CR': 0, 'CH': 0, 'CV': 0, 'CP': 0, 'CQ': 0, 'CM': 0, 'EG': 0, 'ET': 0, 'EI': 0, 'EF': 0, 'ED': 0, 'EC': 0, 'EE': 0, 'ES': 0, 'EL': 0, 'EY': 0, 'EK': 0, 'EW': 0, 'EN': 0, 'EA': 0, 'ER': 0, 'EH': 0, 'EV': 0, 'EP': 0, 'EQ': 0, 'EM': 0, 'SG': 0, 'ST': 0, 'SI': 0, 'SF': 0, 'SD': 0, 'SC': 0, 'SE': 0, 'SS': 0, 'SL': 0, 'SY': 0, 'SK': 0, 'SW': 0, 'SN': 0, 'SA': 0, 'SR': 0, 'SH': 0, 'SV': 0, 'SP': 0, 'SQ': 0, 'SM': 0, 'LG': 0, 'LT': 0, 'LI': 0, 'LF': 0, 'LD': 0, 'LC': 0, 'LE': 0, 'LS': 0, 'LL': 0, 'LY': 0, 'LK': 0, 'LW': 0, 'LN': 0, 'LA': 0, 'LR': 0, 'LH': 0, 'LV': 0, 'LP': 0, 'LQ': 0, 'LM': 0, 'YG': 0, 'YT': 0, 'YI': 0, 'YF': 0, 'YD': 0, 'YC': 0, 'YE': 0, 'YS': 0, 'YL': 0, 'YY': 0, 'YK': 0, 'YW': 0, 'YN': 0, 'YA': 0, 'YR': 0, 'YH': 0, 'YV': 0, 'YP': 0, 'YQ': 0, 'YM': 0, 'KG': 0, 'KT': 0, 'KI': 0, 'KF': 0, 'KD': 0, 'KC': 0, 'KE': 0, 'KS': 0, 'KL': 0, 'KY': 0, 'KK': 0, 'KW': 0, 'KN': 0, 'KA': 0, 'KR': 0, 'KH': 0, 'KV': 0, 'KP': 0, 'KQ': 0, 'KM': 0, 'WG': 0, 'WT': 0, 'WI': 0, 'WF': 0, 'WD': 0, 'WC': 0, 'WE': 0, 'WS': 0, 'WL': 0, 'WY': 0, 'WK': 0, 'WW': 0, 'WN': 0, 'WA': 0, 'WR': 0, 'WH': 0, 'WV': 0, 'WP': 0, 'WQ': 0, 'WM': 0, 'NG': 0, 'NT': 0, 'NI': 0, 'NF': 0, 'ND': 0, 'NC': 0, 'NE': 0, 'NS': 0, 'NL': 0, 'NY': 0, 'NK': 0, 'NW': 0, 'NN': 0, 'NA': 0, 'NR': 0, 'NH': 0, 'NV': 0, 'NP': 0, 'NQ': 0, 'NM': 0, 'AG': 0, 'AT': 0, 'AI': 0, 'AF': 0, 'AD': 0, 'AC': 0, 'AE': 0, 'AS': 0, 'AL': 0, 'AY': 0, 'AK': 0, 'AW': 0, 'AN': 0, 'AA': 0, 'AR': 0, 'AH': 0, 'AV': 0, 'AP': 0, 'AQ': 0, 'AM': 0, 'RG': 0, 'RT': 0, 'RI': 0, 'RF': 0, 'RD': 0, 'RC': 0, 'RE': 0, 'RS': 0, 'RL': 0, 'RY': 0, 'RK': 0, 'RW': 0, 'RN': 0, 'RA': 0, 'RR': 0, 'RH': 0, 'RV': 0, 'RP': 0, 'RQ': 0, 'RM': 0, 'HG': 0, 'HT': 0, 'HI': 0, 'HF': 0, 'HD': 0, 'HC': 0, 'HE': 0, 'HS': 0, 'HL': 0, 'HY': 0, 'HK': 0, 'HW': 0, 'HN': 0, 'HA': 0, 'HR': 0, 'HH': 0, 'HV': 0, 'HP': 0, 'HQ': 0, 'HM': 0, 'VG': 0, 'VT': 0, 'VI': 0, 'VF': 0, 'VD': 0, 'VC': 0, 'VE': 0, 'VS': 0, 'VL': 0, 'VY': 0, 'VK': 0, 'VW': 0, 'VN': 0, 'VA': 0, 'VR': 0, 'VH': 0, 'VV': 0, 'VP': 0, 'VQ': 0, 'VM': 0, 'PG': 0, 'PT': 0, 'PI': 0, 'PF': 0, 'PD': 0, 'PC': 0, 'PE': 0, 'PS': 0, 'PL': 0, 'PY': 0, 'PK': 0, 'PW': 0, 'PN': 0, 'PA': 0, 'PR': 0, 'PH': 0, 'PV': 0, 'PP': 0, 'PQ': 0, 'PM': 0, 'QG': 0, 'QT': 0, 'QI': 0, 'QF': 0, 'QD': 0, 'QC': 0, 'QE': 0, 'QS': 0, 'QL': 0, 'QY': 0, 'QK': 0, 'QW': 0, 'QN': 0, 'QA': 0, 'QR': 0, 'QH': 0, 'QV': 0, 'QP': 0, 'QQ': 0, 'QM': 0, 'MG': 0, 'MT': 0, 'MI': 0, 'MF': 0, 'MD': 0, 'MC': 0, 'ME': 0, 'MS': 0, 'ML': 0, 'MY': 0, 'MK': 0, 'MW': 0, 'MN': 0, 'MA': 0, 'MR': 0, 'MH': 0, 'MV': 0, 'MP': 0, 'MQ': 0, 'MM': 0}
	return dic

def get_training_data():
	with open('train.csv','r') as pool:
		csv_pool = csv.reader(pool)
		for row in csv_pool:
			shortlisted.append(row)
	shortlisted.remove(shortlisted[0])

probabilities=[] #contains the array of the probabilities of the 20 ammino acids present in the string 
def calculate_probability_amino_acids_train():
	for i in shortlisted:
		templist=[]
		# dic={'G': 0, 'T': 0, 'I': 0, 'F': 0, 'D': 0, 'C': 0, 'E': 0, 'S': 0, 'L': 0, 'Y': 0, 'K': 0, 'W': 0, 'N': 0, 'A': 0, 'R': 0, 'H': 0, 'V': 0, 'P': 0, 'Q': 0, 'M': 0}
		dic=makedic()
		for j in i[2]:		
			dic[j]+=1
		for j in range(len(i[2])-1):
			aa=i[2][j]+i[2][j+1]
			dic[aa]+=1
		for j in range(len(i[2])-2):
			aa=i[2][j]+i[2][j+1]+i[2][j+2]
			dic[aa]+=1

		for j in dic:
			templist.append(dic[j]/len(i[2]))
		probabilities.append(templist)

X = [] #this is also basically same as the probabilities list, but made to make the code clean
y = [] #this contains the respective +1 and -1 from the shortlisted array
sv = svm.SVC(gamma=15, kernel='rbf')
def train_the_data():
	for i in range(len(shortlisted)):
		shortlisted[i]+=probabilities[i]
		X.append(probabilities[i])
		if shortlisted[i][1] != '-1' and shortlisted[i][1] != '1':
			shortlisted[i][1] = '-1'
			print("Invalid label at " + str(i))
		y.append(int(shortlisted[i][1]))
	sv.fit(X,y)

test_data = [] #contains the test raw data from the test.csv
sample_data = [] #contains the raw test data in from sapmle.csv
def get_test_and_sample_data():
	with open('test.csv','r') as pool:
		csv_pool = csv.reader(pool)
		for row in csv_pool:
			test_data.append(row)
	test_data.remove(test_data[0])
	with open('sample.csv','r') as pool:
		csv_pool = csv.reader(pool)
		for row in csv_pool:
			sample_data.append(row)
	sample_data.remove(sample_data[0])

probabilities_test=[]  # contains the probabilty of the 20 ammino acids of the test data
def calculate_probability_amino_acids_test():
	for i in test_data:
		templist=[]
		# dic={'G': 0, 'T': 0, 'I': 0, 'F': 0, 'D': 0, 'C': 0, 'E': 0, 'S': 0, 'L': 0, 'Y': 0, 'K': 0, 'W': 0, 'N': 0, 'A': 0, 'R': 0, 'H': 0, 'V': 0, 'P': 0, 'Q': 0, 'M': 0}
		dic=makedic()
		for j in i[1]:		
			dic[j]+=1
		for j in range(len(i[1])-1):
			aa=i[1][j]+i[1][j+1]
			dic[aa]+=1
		for j in range(len(i[1])-2):
			aa=i[1][j]+i[1][j+1]+i[1][j+2]
			dic[aa]+=1
		
		for j in dic:
			templist.append(dic[j]/len(i[1]))
		probabilities_test.append(templist)

x_test = [] #basically probability_test only
final_sv_predicted = [] #contains the predicted +1 and -1 useing SVM

final_sv_predictedXX=[]

def predict_outputs():
	for i in range(len(test_data)):
		test_data[i]+=probabilities_test[i]
		x_test.append(probabilities_test[i])
		
	for i in range(len(test_data)):
		sv_predicted = sv.predict([x_test[i]])[0]
		final_sv_predicted.append(sv_predicted)

	for i in range(len(shortlisted)):
		sv_predicted = sv.predict([X[i]])[0]
		final_sv_predictedXX.append(sv_predicted)
def accuracy():
	svcount=0
	for i in range(len(shortlisted)):
		if(y[i]==final_sv_predictedXX[i]):
			svcount+=1
	print(svcount/len(shortlisted))
# used to create a file named SVM_output.csv and make write the final output in it
# def calcuate accuracy():

# def accuracy():

	
def write_to_csv():
	with open('SVM_output.csv', mode='w') as f:
		w = csv.writer(f, delimiter=',', quotechar='"', quoting=csv.QUOTE_MINIMAL)
		w.writerow(['ID', 'Label'])
		for i in range(len(test_data)):
			w.writerow([test_data[i][0], final_sv_predicted[i]])
	print("output saved in SVM_output.csv")


if __name__ == '__main__':
	get_training_data()
	calculate_probability_amino_acids_train()
	train_the_data()
	get_test_and_sample_data()
	calculate_probability_amino_acids_test()
	predict_outputs()
	# accuracy()
	write_to_csv()