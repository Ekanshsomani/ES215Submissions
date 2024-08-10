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