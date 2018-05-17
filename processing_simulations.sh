while read p
do 
java -classpath baobab-luna.jar baobab.exec.trace.analyzeTraces -o $p
done <inversion_simulations/reversals_16blocks_6inversions.txt

while read p
do 
java -classpath baobab-luna.jar baobab.exec.trace.analyzeTraces -o $p
done <inversion_simulations/strata_constraint_reversals_6inversions.txt

for i in traces_2017.06.11-20*
do
cd $i
grep 'Total number of 6-traces' summary | cut -f5 -d " " >> /Users/homa/free_traces_6
grep 'Total number of 6-traces' summary.1 | cut -f5 -d " " >> /Users/homa/free_traces_6
grep 'Total number of solutions' summary | cut -f5 -d " " >> /Users/homa/free_solutions
grep 'Total number of solutions' summary.1 | cut -f5 -d " " >> /Users/homa/free_solutions
cd ..
done

for i in strata_traces_2017.06.11-20*
do
cd $i
grep 'Total number of 6-traces' summary | cut -f5 -d " " >> /Users/homa/strata_traces_6
grep 'Total number of 6-traces' summary.1 | cut -f5 -d " " >> /Users/homa/strata_traces_6
grep 'Total number of solutions' summary | cut -f5 -d " " >> /Users/homa/strata_solutions
grep 'Total number of solutions' summary.1 | cut -f5 -d " " >> /Users/homa/strata_solutions
cd ..
done

while read p
do 
java -classpath baobab-luna.jar baobab.exec.trace.analyzeTraces -s 10,13,17 -o $p
done <inversion_simulations/reversals_16blocks_6inversions.txt


for i in strata_traces_2017.06.11*
do
cd $i
grep 'subtraces:' summary | cut -f5 -d " " >> /Users/homa/free_strata_traces_6
grep 'subtraces:' summary.1 | cut -f5 -d " " >> /Users/homa/free_strata_traces_6
grep 'subtraces:' summary.2 | cut -f5 -d " " >> /Users/homa/free_strata_traces_6
grep 'subtraces:' summary.3 | cut -f5 -d " " >> /Users/homa/free_strata_traces_6
grep 'Total number of solutions:' summary | cut -f5 -d " " >> /Users/homa/free_strata_solutions
grep 'Total number of solutions:' summary.1 | cut -f5 -d " " >> /Users/homa/free_strata_solutions
grep 'Total number of solutions:' summary.2 | cut -f5 -d " " >> /Users/homa/free_strata_solutions
grep 'Total number of solutions:' summary.3 | cut -f5 -d " " >> /Users/homa/free_strata_solutions
cd ..
done

while read p
do 
java -classpath baobab-luna.jar baobab.exec.trace.analyzeTraces -s 13,17 -o $p
done <inversion_simulations/strata_constraint_reversals_6inversions.txt

while read p
do 
java -classpath baobab-luna.jar baobab.exec.trace.analyzeTraces -s 14,17 -o $p
done <inversion_simulations/strata_constraint_reversals_6inversions.txt

while read p
do 
java -classpath baobab-luna.jar baobab.exec.trace.analyzeTraces -s 15,17 -o $p
done <inversion_simulations/strata_constraint_reversals_6inversions.txt

while read p
do 
java -classpath baobab-luna.jar baobab.exec.trace.analyzeTraces -s 10,13,17 -o $p
done <inversion_simulations/strata_constraint_reversals_6inversions.txt

for i in strata_traces_2017.06.11*
do
cd $i
grep 'subtraces:' summary | cut -f5 -d " " >> /Users/homa/strata_strata_traces_6
grep 'subtraces:' summary.1 | cut -f5 -d " " >> /Users/homa/strata_strata_traces_6
grep 'subtraces:' summary.2 | cut -f5 -d " " >> /Users/homa/strata_strata_traces_6
grep 'subtraces:' summary.3 | cut -f5 -d " " >> /Users/homa/strata_strata_traces_6
grep 'Total number of solutions:' summary | cut -f5 -d " " >> /Users/homa/strata_strata_solutions
grep 'Total number of solutions:' summary.1 | cut -f5 -d " " >> /Users/homa/strata_strata_solutions
grep 'Total number of solutions:' summary.2 | cut -f5 -d " " >> /Users/homa/strata_strata_solutions
grep 'Total number of solutions:' summary.3 | cut -f5 -d " " >> /Users/homa/strata_strata_solutions
cd ..
done

# set -2 and -3 to 2 and 3
java -classpath baobab-luna.jar baobab.exec.trace.analyzeTraces -o 1,2,3,4,5,6,7,8,9,15,-12,13,-16,10,14,-11
/tmp/traces_2017.06.11-16.44.16
Total number of 6-traces: 11
Total number of solutions: 346
{10.11.14.16}{11.14}{12}{15} < {10.-.15}{12.-.14} : h=2 [150] -> This is the GRIMM solution
{10.12.-.14.16}{12}{15} < {10.14.15} < {11.-.16}{14.-.16} : h=3 [60]
{11.14}{12}{12.13.16} < {10.11}{10.-.13.15.16} < {14.-.16} : h=3 [66]
{10.11.14.16} < {10.-.15}{11.-.13.15}{11.13} < {11.12.14.15} < {13.-.15} : h=4 [10]
{10.11.14.16}{11.14} < {10.11}{10.11.13.14} < {10.-.12.15} < {13.-.15} : h=4 [12]
{11.14} < {10.-.13.15.16}{10.11.13.16} < {10.-.12.14.-.16} < {10.-.15}{13.-.15} : h=4 [4]
{12}{12.13.16} < {10.12.13} < {10.15.16}{12.-.14} < {11.-.16} : h=4 [18]
{12.13.16} < {10.12.14}{13.15.16} < {10.13.-.16}{14.-.16} < {11.-.16} : h=4 [9]
{10.11.14.16}{12} < {11.-.13.15} < {10.14.15} < {10.12.13} < {10.11} : h=5 [6]
{11.14}{12.13.16} < {13.15.16} < {10.-.12.14.-.16} < {10.11.13.14} < {12.-.14} : h=5 [5]
{11.14}{15} < {10.11.13.16} < {10.-.12.15} < {13.15.16} < {14.-.16} : h=5 [6]



java -classpath baobab-luna.jar baobab.exec.trace.analyzeTraces -s 10,13,17 -o 1,2,3,4,5,6,7,8,9,15,-12,13,-16,10,14,-11
/tmp/strata_traces_2017.06.11-17.41.12

java -classpath baobab-luna.jar baobab.exec.trace.analyzeTraces -o 1,2,3,4,5,10,11,12,-15,-9,-8,16,-7,-6,-13,-14
/tmp/traces_2017.06.11-17.57.39
Total number of 7-traces: 61
Total number of solutions: 3355
{6.-.12.15.16}{10.-.12.15}{15} < {8.-.15}{8.-.16}{13.15} < {14.15} : h=3 [224] -> This is GRIMM solution

java -classpath baobab-luna.jar baobab.exec.trace.analyzeTraces -s 10,13,17 -o 1,2,3,4,5,10,11,12,-15,-9,-8,16,-7,-6,-13,-14
