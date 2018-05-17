#!/usr/bin/sh

# This the processing script for the program baobabluna to analyze
# the traces of sorting a permutation.

#lizard
# 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18
#chicken
# 1 -2 -3 4 5 6 12 13 14 -17 -11 -10 -9 18 -8 -7 -15 -16)
#flycatcher
# 1 -2 -3 4 5 6 12 13 14 -17 -10 -9 -18 16 15 -11 8 -7
#greattit
# 1 -2 -3 4 5 6 12 13 14 -17 -10 -9 -18 16 15 8 11 -7
#quail
# 1 -5 -4 -2 -3 6 12 13 14 -17 -11 -10 -9 18 -8 -7 -15 -16
#turkey
# 1 -2 -3 4 5 6 12 13 14 -17 -11 -10 -9 18 -8 -7 -15 -16
#zebrafinch
# -1 18 9 8 11 -15 -16 -2 -3 4 10 5 17 -14 -13 -12 -6 -7
#ostrich
# 1 -2 -3 4 5 6 7 8 9 10 11 17 -14 15 -18 12 16 -13
#Passeriformes_ancestor
# 1 -2 -3 4 5 6 12 13 14 -17 -10 -9 -18 16 15 -11 -8 -7
# Galloanserae_Neoaves_ancestor
# 1 -2 -3 4 5 6 12 13 14 -17 -11 -10 -9 -18 7 8 -15 -16
# Galliformes_ancestor
# 1 -2 -3 4 5 6 12 13 14 -17 -11 -10 -9 18 -8 -7 -15 -16
# Palaeognathae_Neognathae_ancestor
# 1 -2 -3 4 5 6 7 8 9 10 11 17 -14 -13 -12 18 -15 -16


# Lizard to Palaeognathae-Neognathae ancestor
./convert_permutation.py 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 , 1 -2 -3 4 5 6 7 8 9 10 11 17 -14 -13 -12 18 -15 -16

# Palaeognathae-Neognathae ancestor to Galloanserae_Neoaves ancestor
./convert_permutation.py 1 -2 -3 4 5 6 7 8 9 10 11 17 -14 -13 -12 18 -15 -16 , 1 -2 -3 4 5 6 12 13 14 -17 -11 -10 -9 -18 7 8 -15 -16 > Outfile

# Galloanserae_Neoaves ancestor to Galliformes ancestor
./convert_permutation.py 1 -2 -3 4 5 6 12 13 14 -17 -11 -10 -9 -18 7 8 -15 -16 , 1 -2 -3 4 5 6 12 13 14 -17 -11 -10 -9 18 -8 -7 -15 -16 >> Outfile

# Galloanserae_Neoaves ancestor to Passeriformes_ancestor
./convert_permutation.py 1 -2 -3 4 5 6 12 13 14 -17 -11 -10 -9 -18 7 8 -15 -16 , 1 -2 -3 4 5 6 12 13 14 -17 -10 -9 -18 16 15 -11 -8 -7 >> Outfile

# Palaeognathae_Neognathae ancestor to Ostrich
./convert_permutation.py 1 -2 -3 4 5 6 7 8 9 10 11 17 -14 -13 -12 18 -15 -16 , 1 -2 -3 4 5 6 7 8 9 10 11 17 -14 15 -18 12 16 -13 >> Outfile

# Galliformes_ancestor to quail
./convert_permutation.py 1 -2 -3 4 5 6 12 13 14 -17 -11 -10 -9 18 -8 -7 -15 -16 , 1 -5 -4 -2 -3 6 12 13 14 -17 -11 -10 -9 18 -8 -7 -15 -16 >> Outfile

# Passeriformes_ancestor to flycatcher
./convert_permutation.py 1 -2 -3 4 5 6 12 13 14 -17 -10 -9 -18 16 15 -11 -8 -7 , 1 -2 -3 4 5 6 12 13 14 -17 -10 -9 -18 16 15 -11 8 -7 >> Outfile

# Passeriformes_ancestor to Great tit
./convert_permutation.py 1 -2 -3 4 5 6 12 13 14 -17 -10 -9 -18 16 15 -11 -8 -7 , 1 -2 -3 4 5 6 12 13 14 -17 -10 -9 -18 16 15 8 11 -7 >> Outfile

# Passeriformes_ancestor to Zerbra finch
./convert_permutation.py 1 -2 -3 4 5 6 12 13 14 -17 -10 -9 -18 16 15 -11 -8 -7 , -1 18 9 8 11 -15 -16 -2 -3 4 10 5 17 -14 -13 -12 -6 -7 >> Outfile

# Use Baobabluna to get the number of traces for every pair of MGR-inferred ancestral state and descendent lineage
while read permutation
do
java -classpath baobab-luna.jar baobab.exec.trace.analyzeTraces -o $permutation
done < Outfile

# Use Baobabluna to get the number of traces for every Lizard-descendent lineage pair. Here, we are not concerned
# with the inferred ancestral states of MGR and we just get the whole number of inversions from lizard (the ancestral
# sequence) to any given studied lineage. 
while read permutation
do
java -classpath baobab-luna.jar baobab.exec.trace.analyzeTraces -o $permutation
done < lineages_order.txt 



