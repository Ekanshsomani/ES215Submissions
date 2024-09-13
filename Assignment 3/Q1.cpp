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

int multiply(uint32_t a, uint32_t b)
{ // negative integers get static casted.
    uint32_t ans = 0;
    int i = 0;
    while(i < 32)
    {
        if(b & 1) ans += a;
        a <<= 1;
        b >>= 1;
        i++;
    }
    return ans; //return performs static cast
}

int findNum(int arr[], int X)
{
    int i = 0;
}

int findChar(char arr[], char c, int arrLength)
{// function returns -1 if not found, otherwise 
// returns index of c in string

    int i = 0;
    while(i < arrLength)
    {
        if(arr[i] == c) return i;
        i++;
    }
    return -1;
}

int main()
{
    return 0;
}

