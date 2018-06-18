#!/usr/bin/sh

# This the processing script for the program baobabluna to analyze
# the traces of sorting a permutation.

# Below are the order and orientation of synteny blocks.
# Each species and ancestral lineage is ordered and oriented 
# compared with lizard. 

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

# Lizard->Palaeognathae-Neognathae ancestor
echo ">Lizard->Palaeognathae-Neognathae ancestor" > lineages_order.txt
echo 1,-2,-3,4,5,6,7,8,9,10,11,17,-14,-13,-12,18,-15,-16 >> lineages_order.txt

# Palaeognathae-Neognathae ancestor to Galloanserae_Neoaves ancestor
echo ">Palaeognathae-Neognathae ancestor->Galloanserae-Neoaves ancestor" >> lineages_order.txt
./convert_permutation.py 1 -2 -3 4 5 6 12 13 14 -17 -11 -10 -9 -18 7 8 -15 -16 , 1 -2 -3 4 5 6 7 8 9 10 11 17 -14 -13 -12 18 -15 -16 >> lineages_order.txt

# Galloanserae_Neoaves ancestor to Galliformes ancestor
echo ">Galloanserae-Neoaves ancestor->Galliformes ancestor" >> lineages_order.txt
./convert_permutation.py 1 -2 -3 4 5 6 12 13 14 -17 -11 -10 -9 18 -8 -7 -15 -16 , 1 -2 -3 4 5 6 12 13 14 -17 -11 -10 -9 -18 7 8 -15 -16 >> lineages_order.txt

# Galloanserae_Neoaves ancestor to Passeriformes_ancestor
echo ">Galloanserae-Neoaves ancestor->Passeriformes ancestor" >> lineages_order.txt
./convert_permutation.py 1 -2 -3 4 5 6 12 13 14 -17 -10 -9 -18 16 15 -11 -8 -7 , 1 -2 -3 4 5 6 12 13 14 -17 -11 -10 -9 -18 7 8 -15 -16 >> lineages_order.txt

# Palaeognathae_Neognathae ancestor to Ostrich
echo ">Palaeognathae-Neognathae ancestor->Ostrich" >> lineages_order.txt
./convert_permutation.py 1 -2 -3 4 5 6 7 8 9 10 11 17 -14 15 -18 12 16 -13 , 1 -2 -3 4 5 6 7 8 9 10 11 17 -14 -13 -12 18 -15 -16 >> lineages_order.txt

# Galliformes_ancestor to quail
echo ">Galliformes-ancestor->quail" >> lineages_order.txt
./convert_permutation.py 1 -5 -4 -2 -3 6 12 13 14 -17 -11 -10 -9 18 -8 -7 -15 -16 , 1 -2 -3 4 5 6 12 13 14 -17 -11 -10 -9 18 -8 -7 -15 -16 >> lineages_order.txt

# Passeriformes_ancestor to flycatcher
echo ">Passeriformes-ancestor->flycatcher" >> lineages_order.txt
./convert_permutation.py 1 -2 -3 4 5 6 12 13 14 -17 -10 -9 -18 16 15 -11 8 -7 , 1 -2 -3 4 5 6 12 13 14 -17 -10 -9 -18 16 15 -11 -8 -7 >> lineages_order.txt

# Passeriformes_ancestor to Great tit
echo ">Passeriformes-ancestor->Great tit" >> lineages_order.txt
./convert_permutation.py 1 -2 -3 4 5 6 12 13 14 -17 -10 -9 -18 16 15 8 11 -7 , 1 -2 -3 4 5 6 12 13 14 -17 -10 -9 -18 16 15 -11 -8 -7 >> lineages_order.txt

# Passeriformes_ancestor to Zerbra finch
echo ">Passeriformes-ancestor->Zerbra finch" >> lineages_order.txt
./convert_permutation.py -1 18 9 8 11 -15 -16 -2 -3 4 10 5 17 -14 -13 -12 -6 -7 , 1 -2 -3 4 5 6 12 13 14 -17 -10 -9 -18 16 15 -11 -8 -7 >> lineages_order.txt

# Use Baobabluna to get the number of traces for every pair of MGR-inferred ancestral state and descendent lineage
#>Lizard->Palaeognathae-Neognathae ancestor
#1,-2,-3,4,5,6,7,8,9,10,11,17,-14,-13,-12,18,-15,-16
java -classpath baobab-luna.jar baobab.exec.trace.analyzeTraces -o 1,-2,-3,4,5,6,7,8,9,10,11,17,-14,-13,-12,18,-15,-16
#>Palaeognathae-Neognathae ancestor->Galloanserae-Neoaves ancestor
#1,2,3,4,5,6,-15,-14,-13,-12,-11,-10,-9,-16,7,8,17,18
java -classpath baobab-luna.jar baobab.exec.trace.analyzeTraces -o 1,2,3,4,5,6,-15,-14,-13,-12,-11,-10,-9,-16,7,8,17,18
#>Galloanserae-Neoaves ancestor->Galliformes ancestor
#1,2,3,4,5,6,7,8,9,10,11,12,13,-14,-16,-15,17,18
java -classpath baobab-luna.jar baobab.exec.trace.analyzeTraces -o 1,2,3,4,5,6,7,8,9,10,11,12,13,-14,-16,-15,17,18
#>Galloanserae-Neoaves ancestor->Passeriformes ancestor
#1,2,3,4,5,6,7,8,9,10,12,13,14,-18,-17,11,-16,-15
java -classpath baobab-luna.jar baobab.exec.trace.analyzeTraces -o 1,2,3,4,5,6,7,8,9,10,12,13,14,-18,-17,11,-16,-15
#>Palaeognathae-Neognathae ancestor->Ostrich
#1,2,3,4,5,6,7,8,9,10,11,12,13,-17,-16,-15,-18,14
java -classpath baobab-luna.jar baobab.exec.trace.analyzeTraces -o 1,2,3,4,5,6,7,8,9,10,11,12,13,-17,-16,-15,-18,14
#>Galliformes-ancestor->quail
#1,-5,-4,2,3,6,7,8,9,10,11,12,13,14,15,16,17,18
java -classpath baobab-luna.jar baobab.exec.trace.analyzeTraces -o 1,-5,-4,2,3,6,7,8,9,10,11,12,13,14,15,16,17,18
#>Passeriformes-ancestor->flycatcher
#1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,-17,18
java -classpath baobab-luna.jar baobab.exec.trace.analyzeTraces -o 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,-17,18
#>Passeriformes-ancestor->Great tit
#1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,-17,-16,18
java -classpath baobab-luna.jar baobab.exec.trace.analyzeTraces -o 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,-17,-16,18
#>Passeriformes-ancestor->Zerbra finch
#-1,-13,-12,-17,-16,-15,-14,2,3,4,-11,5,-10,-9,-8,-7,-6,18
java -classpath baobab-luna.jar baobab.exec.trace.analyzeTraces -o -1,-13,-12,-17,-16,-15,-14,2,3,4,-11,5,-10,-9,-8,-7,-6,18




