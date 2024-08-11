#include <bits/stdc++.h>

using namespace std;

typedef vector<int> vi;
typedef vector<vi> vvi;

int main(int argc, char* argv[])
{
    timespec start, end;

    int n = atoi(argv[1]);

    clock_gettime(CLOCK_MONOTONIC, &start);
    vvi a(n, vi(n, 99)), b(n, vi(n, 99)), c(n, vi(n, 0));
    for(int i=0; i<n; i++)
        for(int j=0; j<n; j++)
            for(int k=0; k<n; k++)
                c[i][j] += a[i][k]*a[k][j];

    clock_gettime(CLOCK_MONOTONIC, &end);

    cout << end.tv_sec - start.tv_sec << endl;

    return 0;
}