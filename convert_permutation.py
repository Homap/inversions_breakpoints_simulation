#!/usr/bin/python
import sys

# Written by Homa Papoli - 16 May 2018

# Simulation codes: /proj/sllstore2017033/private/b2016026/private/Ostrich_Z_data_analysis/inversion_simulations_codes/inversion_simulation
# java -classpath baobab-luna.jar baobab.exec.trace.analyzeTraces -o -3,2,1,-4

# The goal of this script is to write one permutation according to the other. 
# This is necessary to use Baobabluna to get all the traces of a permutaion. 

permutation1 = []
sign1 = []
for element in sys.argv[1:19]:
	if int(element) < 0:
		sign1.append(int("-1"))
	else:
		sign1.append(1)
	permutation1.append(int(abs(int(element))))

permutation2 = []
sign2 = []
for element in sys.argv[20:39]:
	if int(element) < 0:
		sign2.append(int("-1"))
	else:
		sign2.append(1)
	permutation2.append(int(abs(int(element))))

l = []
for element in permutation1:
	index1 = permutation1.index(element)
	index2 = permutation2.index(element)
	if sign1[index1] == sign2[index2]:
		#print index1+1, index2+1
		l.append([index1+1, index2+1])
	else:
		#print index1+1, "-"+str(index2+1)
		l.append([index1+1, "-"+str(index2+1)])

seq1 = []
seq2 = []
for index in range(0,len(l)):
	seq1.append(l[index][0])
	seq2.append(l[index][1])

#print ",".join(str(i) for i in seq1)
print ",".join(str(i) for i in seq2)
