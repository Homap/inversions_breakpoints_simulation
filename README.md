# inversions_breakpoints_simulation
Contains the scripts for simulating breakpoints and permutations

# Produces random breakpoints along the sequence. Used 
breakpoint_generator.py

# Produces random breakpoints in the strata boundaries
strata_constraint_breakpoint_generator.py

# Breaks a sequence at random breakpoints generated by breakpoint_generator.py.
# It generates a permutation which can then be sorted by Baobabluna to count the 
# number of classes and traces.
reversal_pipeline.sh

# Breaks a sequence at the strata constrained breakpoints generated by
# strata_constraint_breakpoint_generator.py. It generates a permutation with 
# breakpoints constrained to the strata boundaries. This can then be sorted by 
# Baobabluna to count the number of classes and traces.
strata_constraint_reversal_pipeline.sh

# It takes the output of reversal_pipeline.sh and strata_constraint_reversal_pipeline.sh
# and run baobabluna analyzeTraces to get the count of classes and traces. The script
# further parses the output for baobabluna analyzeTraces. 
processing_simulations.sh
