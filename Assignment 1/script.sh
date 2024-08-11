#! /bin/bash

# output=$(time (g++ -o a "$multC" && ./a "$n"))

pyFiles=("matrixMult.py" "matrixMultNum.py")
cFiles=("matrixMultInt.cpp" "matrixMultDouble.cpp")
inputs=("64" "128" "256" "512" "1024")
elValues=("99" "99.99")

for n in "${inputs[@]}"; do
    for file in "${pyFiles[@]}"; do
        for el in "{elValues[@]}"; do
            loc="Assignment 1/$file"
            realTime=0; userTime=0; sysTime=0; chunkTime=0;

            for i in {0..9}; do
                output=$( { time python "$loc" "$n" "$el"; } 2>&1 )
                real=$(echo "$output" | grep "real" | awk '{print $2}')
                user=$(echo "$output" | grep "user" | awk '{print $2}')
                sys=$(echo "$output" | grep "sys" | awk '{print $2}')
                chunk=$(echo "$output" | grep -v "real\|user\|sys")

                realTime=$(echo "$realTime + $real" | bc)
                userTime=$(echo "$userTime + $user" | bc)
                sysTime=$(echo "$sysTime + $sys" | bc)
                chunkTime=$(echo "$chunkTime + $chunk" | bc)
            done
            realTime=$(echo "scale=2; $realTime / 10" | bc)
            userTime=$(echo "scale=2; $userTime / 10" | bc)
            sysTime=$(echo "scale=2; $sysTime / 10" | bc)
            chunkTime=$(echo "scale=2; $chunkTime / 10" | bc)

            echo "$file, $n, $el"
            echo "Real time: $realTime, User time: $userTime, Sys time: $sysTime, Chunk time: $chunkTime"
        done
    done

    for file in "${cFiles[@]}"; do
        loc="Assignment 1/$file"
        realTime=0; userTime=0; sysTime=0; chunkTime=0;

        for i in {0..9}; do
            output=$( { time (g++ -o a "$loc" && ./a "$n"); } 2>&1 )
            
            real=$(echo "$output" | grep "real" | awk '{print $2}')
            user=$(echo "$output" | grep "user" | awk '{print $2}')
            sys=$(echo "$output" | grep "sys" | awk '{print $2}')
            chunk=$(echo "$output" | grep -v "real\|user\|sys")

            realTime=$(echo "$realTime + $real" | bc)
            userTime=$(echo "$userTime + $user" | bc)
            sysTime=$(echo "$sysTime + $sys" | bc)
            chunkTime=$(echo "$chunkTime + $chunk" | bc)
        done
        realTime=$(echo "scale=2; $realTime / 10" | bc)
        userTime=$(echo "scale=2; $userTime / 10" | bc)
        sysTime=$(echo "scale=2; $sysTime / 10" | bc)
        chunkTime=$(echo "scale=2; $chunkTime / 10" | bc)

        echo "$file, $n"
        echo "Real time: $realTime, User time: $userTime, Sys time: $sysTime, Chunk time: $chunkTime"
    done
done

# multpy="Assignment 1/matrixMult.py"
# output=$( { time python "$multpy" "$n"; } 2>&1 )

# echo "Full Output:"
# echo "$output"