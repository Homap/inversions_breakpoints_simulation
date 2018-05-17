#!/bin/bash

# Lemaitre et al 2009: The inversion was accepted only if going back from Yi (Y after i inversions) to Y0 
# (Y without inversion = X) implied i inversions (parsimony criterion). We stopped the
# process after d parsimonious inversions. 

# algorithm
# 1. set the number of inversions in the variable $distance
# 2. loop through the number of inversions
# 3. for the first inversion, run breakpoint_generator.py without any arugment.
# 4. extract the reversal ($reversal), the breakpoint ($d) and the reversal distance ($rev_distance).
# 5. for the next inversions, run breakpoint_generator.py with the breakpoint as the argument.
# 6. check if reversal distance is equal to the number of reversals used to produce the inverted sequence.
# if not, enter the while loop.
# in every round of the while loop, repeat the process until reversal distance becomes equal to the number of reversals.
# go to the next breakpoint, that is enumerate i.


# number of inversions
distance=$1

# loop through the number of reversals
for (( i=1; i<=$distance; i++ ))
do
	if [ "$i" -eq 1 ]
	then
		./breakpoint_generator.py "" > reversal.sh
		reversal=$(./reversal.sh | tail -n1 | awk -F '[+ ]*::[ +]*' '{gsub(/[+ ]+/, ",", $2); print $2}')
		echo $reversal
		d=$(cat reversal.sh | awk 'NR==2' | awk '{print $NF}' | sed 's/"//g')
		#echo $d
		rev_distance=$(java -classpath baobab-luna.jar baobab.exec.permutation.sort -o $reversal | grep 'Reversal distance' | cut -f2 -d ":" | sed 's/ //g')
		#echo $rev_distance
	else
		./breakpoint_generator.py $d > reversal.sh
		reversal=$(./reversal.sh | tail -n1 | awk -F '[+ ]*::[ +]*' '{gsub(/[+ ]+/, ",", $2); print $2}')
		echo $reversal
		d=$(cat reversal.sh | awk 'NR==2' | awk '{print $NF}' | sed 's/"//g')
		#echo $d
		rev_distance=$(java -classpath baobab-luna.jar baobab.exec.permutation.sort -o $reversal | grep 'Reversal distance' | cut -f2 -d ":" | sed 's/ //g')
		#echo $rev_distance
		while [ "$rev_distance" -ne "$i" ]
		do
			#echo "inversion is not parsimonious, try another breakpoint"
			d=$(echo "$d" | rev | cut -d "|" -f 2- | rev)
			#echo "d" $d $i
			./breakpoint_generator.py $d > reversal.sh
			reversal=$(./reversal.sh | tail -n1 | awk -F '[+ ]*::[ +]*' '{gsub(/[+ ]+/, ",", $2); print $2}')
			echo $reversal
			d=$(cat reversal.sh | awk 'NR==2' | awk '{print $NF}' | sed 's/"//g')
			rev_distance=$(java -classpath baobab-luna.jar baobab.exec.permutation.sort -o $reversal | grep 'Reversal distance' | cut -f2 -d ":" | sed 's/ //g')
			#echo $rev_distance
		done
	fi
done
