#include <bits/stdc++.h>

using namespace std;

typedef vector<double> vi;
typedef vector<vi> vvi;

int main()
{
    int n;
    cin >> n;

    vvi a(n, vi(n, 99.99)), b(n, vi(n, 99.99)), c(n, vi(n, 0.0));

    for(int i=0; i<n; i++)
        for(int j=0; j<n; j++)
            for(int k=0; k<n; k++)
                c[i][j] += a[i][k]*a[k][j];

    return 0;
}