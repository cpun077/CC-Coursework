#include <iostream>
#include <iomanip>
#include <cmath>
#include "mt.h"
using namespace std;

void display_array_forloop(int a[], int size)
{
    cout << "{ ";
    for (int i = 0; i < size; i++)
    {
        if (i == size - 1)
        {
            cout << a[i] << "}" << endl;
        }
        else
        {
            cout << a[i] << ", ";
        }
    }
    cout << endl;
}
void display_array_forloop_reverse(int a[], int size)
{
    cout << "{ ";
    for (int i = size - 1; i >= 0; i--)
    {
        if (i == 0)
        {
            cout << a[i] << "}" << endl;
        }
        else
        {
            cout << a[i] << ", ";
        }
    }
    cout << endl;
}
void display_array_whileloop(int a[], int size)
{
    int i = 0;
    cout << "{ ";
    while (i < size)
    {
        if (i == size - 1)
        {
            cout << a[i] << "}" << endl;
        }
        else
        {
            cout << a[i] << ", ";
        }
        i++;
    }
}
void display_array_dowhileloop(int a[], int size)
{
    int i = 0;
    cout << "{ ";
    do
    {
        if (i == size - 1)
        {
            cout << a[i] << "}" << endl;
        }
        else
        {
            cout << a[i] << ", ";
        }
        i++;
    } while (i < size);
}
void array_reverse_in_place(int a[], int size)
{
    for (int i = 0; i < size / 2; i++)
    {
        int temp = a[i];
        a[i] = a[size - i - 1];
        a[size - i - 1] = temp;
    }
}
// Example: {10, 20, 30} becomes {30, 20, 10}

int main4()
{
    int a[] = {15, 25, 35, 45, 55, 65, 75, 85, 95, 105};
    // size = 10
    cout << "display_array_forloop: " << endl;
    display_array_forloop(a, 10);
    cout << "display_array_whileloop: " << endl;
    display_array_whileloop(a, 10);
    cout << "display_array_dowhileloop: " << endl;
    display_array_dowhileloop(a, 10);
    cout << "display_array_forloop_reverse: " << endl;
    display_array_forloop_reverse(a, 10);
    cout << "array_reverse_in_place: " << endl;
    array_reverse_in_place(a, 10);
    display_array_forloop(a, 10);
    return 0;
}