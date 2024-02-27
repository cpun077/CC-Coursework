#include <iostream>
#include <iomanip>
#include <cmath>
#include "mt.h"
using namespace std;

int sequence_odd_sum(int n1, int n2)
{
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
    int oddsum = 0;
    for (int i = temp1; i <= temp2; i++)
    {
        if (!(i % 2 == 0))
        {
            oddsum += i;
        }
    }
    return oddsum;
}

int sequence_even_sum(int n1, int n2)
{
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
    int evensum = 0;
    for (int i = temp1; i <= temp2; i++)
    {
        if (i % 2 == 0)
        {
            evensum += i;
        }
    }
    return evensum;
}

int main2()
{
    int n1 = -1, n2 = -1;
    bool repeat = true;
    while (repeat)
    {
        while (!(n1 > 0 && n1 < 500))
        {
            cout << "Enter a positive number < 500: ", cin >> n1;
        }
        while (!(n2 > 0 && n2 < 500))
        {
            cout << "Enter another positive number < 500: ", cin >> n2;
        }

        cout << "sum of odds between those numbers are " << sequence_odd_sum(n1, n2) << endl;
        cout << "sum of evens between those numbers are " << sequence_even_sum(n1, n2) << endl;

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