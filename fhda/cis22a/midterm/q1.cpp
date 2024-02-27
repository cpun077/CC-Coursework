#include <iostream>
#include <iomanip>
#include <cmath>
#include "mt.h"
using namespace std;

bool is_prime(int n)
{
    if (n <= 1 || n % 2 == 0 || n % 3 == 0)
    {
        return false;
    }
    else if (n <= 3)
    {
        return true;
    }
    for (int i = 5; i * i <= n; i += 6)
    {
        if (n % i == 0 || n % (i + 2) == 0)
            return false;
    }
    return true;
}

int main1()
{
    int n1 = 0, n2 = 0;
    bool repeat = true;
    while (repeat)
    {
        while (!(n1 <= 300 && n1 >= 100))
        {
            cout << "Enter a number between 100 and 300: ", cin >> n1;
        }
        while (!(n2 <= 300 && n2 >= 100))
        {
            cout << "Enter another number between 100 and 300: ", cin >> n2;
        }

        int temp1, temp2;
        if (n1 > n2)
        {
            temp1 = n2;
            temp2 = n1;
        }
        else
        {
            temp1 = n1;
            temp2 = n2;
        }
        cout << "Prime numbers between " << temp1 << " and " << temp2 << " are";
        for (int i = temp1; i < temp2; i++)
        {
            if (is_prime(i))
            {
                cout << " " << i;
            }
        }
        cout << endl;

        string s;
        while (s != "n")
        {
            cout << "Type y to exit, n to repeat: ", cin >> s;
            if (s == "y")
            {
                repeat = false;
                break;
            }
        }
        n1 = -1, n2 = -1;
    }

    return 0;
}