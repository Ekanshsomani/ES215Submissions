#include <bits/stdc++.h>

using namespace std;

int subtract(int16_t a, int16_t b)
{
    int32_t p = a; // sign extension from
    int32_t q = b; // 16 to 32 bits

    q = ~q;
    q = q + 1;
    return p+q;
}

int average(int arr[])
{
    int ans = 0;
    int i = 0;
    while(i<15)
    {
        ans += arr[i];
        i++;
    }
    ans /= 15;
    return ans;
}

int gcd(int p, int q)
{
    int temp, a{p}, b{q};
    if(b > a)
    {
        temp = b;
        b = a;
        a = b;
    }

    temp = a % b;
    while(temp != 0)
    {
        a = b;
        b = temp;
        temp = a % b;
    }

    return p * (q / b);
}


int main()
{
    return 0;
}

