#!/bin/bash

# Check the number of arguments
if [ $# -ne 1 ]; then
    echo "Usage: $0 <serverURL:port>"
    exit 1
fi

#dispatch basic experiments
./dispacher.py v4 $1 ../.. 0,1,2 0,1,2,3,4,5,6,7,8 --run-ideal
./dispacher.py v4 $1 ../.. 0,1,2 0,1,2,3,4,5,6,7,8 --run-noise 1000 1099

#dispatch noise mitigation experiments
./dispacher.py v4 $1 ../.. 0,1,2 0,1,2,3,4,5,6,7,8 --run-noise 1000 1099 --run-mitigation

#dispatch no contention experiments
./dispacher.py v4 $1 ../.. 0,1,2 0,1,2,3,4,5,6,7,8 --run-ideal --no-contention-in-speculative-executions
./dispacher.py v4 $1 ../.. 0,1,2 0,1,2,3,4,5,6,7,8 --run-noise 1000 1099 --no-contention-in-speculative-executions

#Dispatch no contention no Amdahl experiments
./dispacher.py v5 $1 ../.. 0,1,2 0,1,2,3,4,5,6,7,8 --run-ideal --no-amdahl-in-speculative-executions --no-contention-in-speculative-executions
./dispacher.py v5 $1 ../.. 0,1,2 0,1,2,3,4,5,6,7,8 --run-ideal --no-amdahl-in-speculative-executions 

#Dispatch no Amdahl experiments
./dispacher.py v5 $1 ../.. 0,1,2 0,1,2,3,4,5,6,7,8 --run-noise 1000 1099 --no-amdahl-in-speculative-executions --no-contention-in-speculative-executions
./dispacher.py v5 $1 ../.. 0,1,2 0,1,2,3,4,5,6,7,8 --run-noise 1000 1099 --no-amdahl-in-speculative-executions 