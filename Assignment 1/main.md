# Assignment 1

**Course:** ES 215: Computer Organization and Architecture <br>
**Name:** Ekansh Somani <br>
**Roll Number:** 20110065

## Q1

**Implement a program(s) to list the first 50 fibonacci numbers preferably in C++ using recursion, loop, recursion and memoization, and loop and memoization.**

My code for this question is given in Appendix A1.

Points to keep in mind:

- Fiftieth fibonnaci number is 12.5 billion (approx.). Integer type would thus not work, as unsigned int can go at max upto 4 billion (approx.). I would thus be working with unsigned long long.
- We should obtain multiple values of runtimes and then take mean. Errors might otherwise creep into the time taken because of the background processes running on the CPU.
- Since it takes about 3 minutes to determine run times for 50 fibonacci numbers, I have only tried to do it once. I calculated n=15, 30 and 40 fibonacci numbers for speed comparison otherwise.
- In recursion with Memoization, list could be created by simply calling the function once for the highest value, or it could be created incrementally. I have reported results for both the ways.

### Table 1: Time Taken (in seconds)
| Method | Recursion | Loops | Memoized Recursion (incr) | Memoized Recursion | Memoized Loops |
| --- | --- | --- | --- | --- | --- |
| n=50 | 160.151 | 3.6e-06 | 7e-07 | 5e-07 | 2e-07 |
| n=15 | 4.1e-06 | 3.2e-07 | 1.8e-07 | 1.4e-07 | 7e-08 |
| n=30 | 0.00717726 | 1.67e-06 | 5.4e-07 | 3.5e-07 | 2.1e-07 |
| n=40 | 0.711401 | 2.44e-06 | 6.7e-07 | 4.6e-07 | 1.9e-07 |

### Table 2: Speed Comparison (faster by factor)
| Method | Recursion | Loops | Memoized Recursion (incr) | Memoized Recursion | Memoized Loops |
| --- | --- | --- | --- | --- | --- |
| n=50 | 1 | 44.5 million | 228.8 million | 320.3 million | 800.8 million |
| n=15 | 1 | 12.8125 | 22.7778 | 29.2857 | 58.5714 |
| n=30 | 1 | 4297.76 | 13291.2 | 20506.5 | 34177.4 |
| n=40 | 1 | 291558 | 1.1 million | 1.55 million | 3.75 million |

**Notes:** 10 iterations were done for deriving the mean time taken for n=15, 30 and 40.

### Conclusion

Memoized loops are the fastest way to compute fibonacci numbers. Single Function call Memoized Recursion is faster than incremental memoized recursion. Loops is 44.5 miilion times faster than recursion for calculating 50 fibonacci number. Memoized recursion is 320 million time faster, whereas Memoized loops are 800 million times faster than recursion. Speed difference between the methods increases exponentially with n.

## Q2

**Write a simple Matrix Multiplication program for a given NxN matrix in C++ and Python, where N is iterated through the set of values 64, 128, 256, 512 and 1024. N can either be hardcoded or specified as input. Consider two cases (a) Elements of matrix are of data type Integer and (b) Double. In each case,**

1. **Report the output of the ‘time’ describing the system and CPU times**
2. **Using the ‘language hooks’ evaluate the execution time for the meat portions of the program and how much proportion is it w.r.t. total program execution time.**
3. **Plot the (a) and (b) execution times for each of the iterations. And compare the performance (System and Program execution times) of the program for given value of N for the languages.**
 
**Illustrate your observations.**

## Appendix

### A1: Q1 Code

``` C++

#include <bits/stdc++.h>

using namespace std;

typedef unsigned long long ull;
typedef vector<double> vd;

ull fibrec[51], fibloop[51], fibdp[51], fibopt[51];

inline ull rec(int i)
{
    if(i<=2) return 1ULL;
    return rec(i-1)+rec(i-2);
}

inline ull loop(int i)
{
    ull ans{1}, prev{1}, temp;
    for(int j=3; j<=i; j++)
    {
        temp = ans;
        ans += prev;
        prev = temp;
    }
    return ans;
}

inline ull dp(int i)
{
    if(fibdp[i]!=0ULL) return fibdp[i];

    return fibdp[i] = dp(i-1)+dp(i-2);
}

inline void optimal(int upto)
{
    fibopt[1] = 1;
    fibopt[2] = 1;
    for(int i=3; i<upto; i++) fibopt[i] = fibopt[i-1]+fibopt[i-2];
}

/*
// testing that functions are correct
int main()
{
    memo[1] = 1;
    memo[2] = 1;
    optimal();

    printf(
        "1st Fibonacci number: %llu %llu %llu %llu\n", 
        rec(1), loop(1), dp(1), fibs[1]
    );
    printf(
        "5th Fibonacci number: %llu %llu %llu %llu\n", 
        rec(5), loop(5), dp(5), fibs[5]
    );
    printf(
        "15th Fibonacci number: %llu %llu %llu %llu\n", 
        rec(15), loop(15), dp(15), fibs[15]
    );
    printf(
        "50th Fibonacci number: %llu %llu %llu %llu\n", 
        rec(50), loop(50), dp(50), fibs[50]
    );
    return 0;
}
*/

inline vd getTimes(int upto)
{
    memset(fibrec, 0ULL, sizeof fibrec);
    memset(fibloop, 0ULL, sizeof fibloop);
    memset(fibdp, 0ULL, sizeof fibdp);
    memset(fibopt, 0ULL, sizeof fibopt);

    double recTime, loopTime, dpTime, dpTime1, optTime;
    timespec start, end;


    clock_gettime(CLOCK_MONOTONIC, &start);
    for(int i=1; i<upto; i++) fibrec[i] = rec(i);
    clock_gettime(CLOCK_MONOTONIC, &end);

    recTime = (end.tv_sec - start.tv_sec) * 1e9;
    recTime = (recTime + (end.tv_nsec - start.tv_nsec)) * 1e-9;
 

    clock_gettime(CLOCK_MONOTONIC, &start);
    for(int i=1; i<upto; i++) fibloop[i] = loop(i);
    clock_gettime(CLOCK_MONOTONIC, &end);

    loopTime = (end.tv_sec - start.tv_sec) * 1e9;
    loopTime = (loopTime + (end.tv_nsec - start.tv_nsec)) * 1e-9;

    clock_gettime(CLOCK_MONOTONIC, &start);
    fibdp[1] = 1; fibdp[2] = 1;
    for(int i=1; i<upto; i++) dp(i);
    clock_gettime(CLOCK_MONOTONIC, &end);

    dpTime = (end.tv_sec - start.tv_sec) * 1e9;
    dpTime = (dpTime + (end.tv_nsec - start.tv_nsec)) * 1e-9;


    memset(fibdp, 0ULL, sizeof fibdp);
    clock_gettime(CLOCK_MONOTONIC, &start);
    fibdp[1] = 1; fibdp[2] = 1; dp(upto-1);
    clock_gettime(CLOCK_MONOTONIC, &end);

    dpTime1 = (end.tv_sec - start.tv_sec) * 1e9;
    dpTime1 = (dpTime1 + (end.tv_nsec - start.tv_nsec)) * 1e-9;

    clock_gettime(CLOCK_MONOTONIC, &start);
    optimal(upto);
    clock_gettime(CLOCK_MONOTONIC, &end);

    optTime = (end.tv_sec - start.tv_sec) * 1e9;
    optTime = (optTime + (end.tv_nsec - start.tv_nsec)) * 1e-9;

    vd vec = {recTime, loopTime, dpTime, dpTime1, optTime};
    return vec;
}

inline void speedComp(vd vec)
{
    cout << "Time: ";
    for(int i=0; i<5; i++) cout << vec[i] << " ";
    cout << "\n" << "Speed Comparison: ";
    for(int i=0; i<5; i++) cout << vec[0]/vec[i] << " ";
    cout << "\n";
}

int main()
{
    // vd vec = getTimes(51);
    // speedComp(vec);

    vd vec(5);
    vd vecs[10];
    for(int i=0; i<10; i++)
        vecs[i] = getTimes(45);

    for(int i=0; i<5; i++)
    {
        vec[i] = 0;
        for(int j=0; j<10; j++)
            vec[i] += vecs[j][i];
        vec[i] /= 10;
    }
    speedComp(vec);

    return 0;
}

```
