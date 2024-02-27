#include <iostream>
#include <iomanip>
#include <cmath>
#include "mt.h"
using namespace std;

bool is_triangle(int x, int y, int z)
{
    return (x + y > z && x + z > y && y + z > x);
}

bool is_right_angle_triangle(int x, int y, int z)
{
    int biggest = max(x, max(y, z));
    if (biggest == x)
        return (x * x == y * y + z * z);
    else if (biggest == y)
        return (y * y == x * x + z * z);
    else
        return (z * z == x * x + y * y);
}

int main3()
{
    int n1 = -1, n2 = -1, n3 = -1;
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
        while (!(n3 > 0 && n3 < 500))
        {
            cout << "Enter yet another positive number < 500: ", cin >> n3;
        }

        if (is_triangle(n1, n2, n3))
        {
            cout << "Those sides do make a triangle" << endl;
            if (is_right_angle_triangle(n1, n2, n3))
            {
                cout << "Those sides make a right triangle" << endl;
            }
            else
            {
                cout << "Those sides don't make a right triangle" << endl;
            }
        }
        else
        {
            cout << "Those sides don't make a triangle, and thus not a right triangle either" << endl;
        }

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
        n1 = -1, n2 = -1, n3 = -1;
    }

    return 0;
}
