#!/bin/bash

# Run ./run_reversal_pipeline.sh Number of reversals.

reversals=$1

for i in {1..1000}
do
	#echo $i
	./reversal_pipeline.sh $1 | tail -n1 > inversion_simulations/reversals_16blocks_7inversions.txt
	d=$(cat reversal.sh | cut -f8 -d " " | sed 's/|/ /g' | sed 's/#!\/bin\/bash//g' | sed 's/"//g')
	echo $d
done

#d=$(echo java -classpath baobab-luna.jar baobab.exec.permutation.performReversals -o 1,2,3,4,5,6,7,8,9,10,11,12 -r "8,9|7,12|5,6|9,11|5,8|5,13|1,7|6,7" | cut -f8 -d " ")

