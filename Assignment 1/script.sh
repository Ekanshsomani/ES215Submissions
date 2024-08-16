#! /bin/bash

# My attempt to do calculations multiple times a calculate mean and standard deviation using a bash script.

# pyFiles=("matrixMult.py" "matrixMultNum.py")
# cFiles=("matrixMultInt.cpp" "matrixMultDouble.cpp")
# inputs=("64" "128" "256" "512" "1024")
# elValues=("99" "99.99")

# for n in "${inputs[@]}"; do
#     for file in "${pyFiles[@]}"; do
#         for el in "${elValues[@]}"; do
#             loc="Assignment 1/$file"
#             realTime=0; userTime=0; sysTime=0; chunkTime=0;

#             for i in {0..9}; do
#                 output=$( { time python "$loc" "$n" "$el"; } 2>&1 )
#                 real=$(echo "$output" | grep "real" | awk '{print $2}')
#                 user=$(echo "$output" | grep "user" | awk '{print $2}')
#                 sys=$(echo "$output" | grep "sys" | awk '{print $2}')
#                 chunk=$(echo "$output" | grep -v "real\|user\|sys")

#                 realTime=$(awk "BEGIN {print $realTime + $real}")
#                 userTime=$(awk "BEGIN {print $userTime + $user}")
#                 sysTime=$(awk "BEGIN {print $sysTime + $sys}")
#                 chunkTime=$(awk "BEGIN {print $chunkTime + $chunk}")

#                 # realTime=$(echo "$realTime + $real" | bc)
#                 # userTime=$(echo "$userTime + $user" | bc)
#                 # sysTime=$(echo "$sysTime + $sys" | bc)
#                 # chunkTime=$(echo "$chunkTime + $chunk" | bc)
#             done
#             # realTime=$(echo "scale=2; $realTime / 10" | bc)
#             # userTime=$(echo "scale=2; $userTime / 10" | bc)
#             # sysTime=$(echo "scale=2; $sysTime / 10" | bc)
#             # chunkTime=$(echo "scale=2; $chunkTime / 10" | bc)

#             realTime=$(awk "BEGIN {print $realTime / 10}")
#             userTime=$(awk "BEGIN {print $userTime / 10}")
#             sysTime=$(awk "BEGIN {print $sysTime / 10}")
#             chunkTime=$(awk "BEGIN {print $chunkTime / 10}")

#             echo "$file, $n, $el"
#             echo "Real time: $realTime, User time: $userTime, Sys time: $sysTime, Chunk time: $chunkTime"
#         done
#     done

#     for file in "${cFiles[@]}"; do
#         loc="Assignment 1/$file"
#         realTime=0; userTime=0; sysTime=0; chunkTime=0;

#         for i in {0..9}; do
#             g++ -o a "$loc"
#             if [ $? -ne 0 ]; then
#                 echo "Compilation failed for $loc"
#                 exit 1
#             fi

#             output=$( { time ./a "$n"; } 2>&1 )
            
#             real=$(echo "$output" | grep "real" | awk '{print $2}')
#             user=$(echo "$output" | grep "user" | awk '{print $2}')
#             sys=$(echo "$output" | grep "sys" | awk '{print $2}')
#             chunk=$(echo "$output" | grep -v "real\|user\|sys")

#             realTime=$(awk "BEGIN {print $realTime + $real}")
#             userTime=$(awk "BEGIN {print $userTime + $user}")
#             sysTime=$(awk "BEGIN {print $sysTime + $sys}")
#             chunkTime=$(awk "BEGIN {print $chunkTime + $chunk}")

#             # realTime=$(echo "$realTime + $real" | bc)
#             # userTime=$(echo "$userTime + $user" | bc)
#             # sysTime=$(echo "$sysTime + $sys" | bc)
#             # chunkTime=$(echo "$chunkTime + $chunk" | bc)
#         done
#         # realTime=$(echo "scale=2; $realTime / 10" | bc)
#         # userTime=$(echo "scale=2; $userTime / 10" | bc)
#         # sysTime=$(echo "scale=2; $sysTime / 10" | bc)
#         # chunkTime=$(echo "scale=2; $chunkTime / 10" | bc)

#         realTime=$(awk "BEGIN {print $realTime / 10}")
#         userTime=$(awk "BEGIN {print $userTime / 10}")
#         sysTime=$(awk "BEGIN {print $sysTime / 10}")
#         chunkTime=$(awk "BEGIN {print $chunkTime / 10}")

#         echo "$file, $n"
#         echo "Real time: $realTime, User time: $userTime, Sys time: $sysTime, Chunk time: $chunkTime"
#     done
# done

n="64"
# el="99.99"

# multpy="Assignment 1/mult.py"
multC="Assignment 1/multDouble.cpp"
# output=$( { time python "$multpy" "$n" "$el"; } 2>&1 )
g++ -o a "$multC" 
output=$(time ./a "$n")

# echo "Full Output:"
echo "$output"