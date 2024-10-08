#include <bits/stdc++.h>

using namespace std;

typedef vector<double> vi;
typedef vector<vi> vvi;

int main(int argc, char* argv[])
{
    timespec start, inter, end;

    int n = atoi(argv[1]);
    vvi a(n, vi(n, 99.99)), b(n, vi(n, 99.99)), c(n, vi(n, 0.0));

    clock_gettime(CLOCK_MONOTONIC, &start);
    for(int i=0; i<n; i++)
        for(int j=0; j<n; j++)
            for(int k=0; k<n; k++)
                c[i][j] += a[i][k]*a[k][j];

    clock_gettime(CLOCK_MONOTONIC, &end);

    double startTime = start.tv_sec + start.tv_nsec*1e-9;
    double endTime = end.tv_sec + end.tv_nsec*1e-9;

    printf("Meat: %.3f\n", endTime-startTime);
    // printf("%lld, %lld, %lld\n", start, inter, end);
    return 0;
}