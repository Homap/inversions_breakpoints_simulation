#!/usr/bin/python
import sys

import itertools
from random import *


""" breakpoint_generator.py generates breakpoints to create a reversal.
From Baobabluna manual: Each reversal is given by a pair of integers i,j where
i is the index of the point that corresponds to the first
extremity to the reversal and j is the index of the point 
that corresponds to the last extremity to the reversal (i<j). 
"""

breakpoint = sys.argv[1]

"""
Create combinations of a given list in pairs
This creates all the possible breakpoints. For example, 
for a given sequence as follows:

 a b c 
| | | |
1 2 3 4

Breakpoints are: (1,2), (1,3), (1,4), (2,3), (2,4), (3,4)

itertools.combinations(list, 2) creates all pairs of combinations
of a given list.
"""

pairs = list(itertools.combinations([1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17], 2))

# Choose randomly from the list
# random.choice(seq) returns a random element from the non-empty sequence seq.
random_pair = list(choice(pairs))

# Format the random pair in the input of baobabluna software: "1,2"
k = "\""+str(random_pair[0])+","+str(random_pair[1])+"\""

# For the first reversal, breakpoint_generator.py gets "" as an argument which is an empty string.
# For the next reversals, we add the previous breakpoints to each other with the pipe "|" separator and we run the program.
if breakpoint!="":
	print "#!/bin/bash"
	print "java -classpath baobab-luna.jar baobab.exec.permutation.performReversals -o 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16 -r"+" "+"\""+breakpoint+"|"+k.replace("\"","")+"\""
else:
	print "#!/bin/bash"
	print "java -classpath baobab-luna.jar baobab.exec.permutation.performReversals -o 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16 -r"+" "+k





