using namespace std;
#include <iostream>
#include <iomanip>
#include "methods.h"

void printRounded(double d)
{
    // include iomanip, round num to x digits
    cout << "Rounded to 3 decimals: " << fixed << setprecision(3) << d << endl;
}

void stringStuff()
{
    // string methods
    string str;
    cout << "Enter a string: ", cin >> str, cout << endl;
    cout << "First character is: " << str.at(0) << endl;
    str = "There are 9 Star Wars Episodes";
    cout << str, cout << " -> " << str.replace(str.find("9"), 1, "6") << endl;

    // find() returns string::npos if cannot find
    for (int i = 0; i < str.size(); i++)
    {
        if (!isalpha(str.at(i)) && !isspace(str.at(i)))
        {
            str.replace(i, 1, "IX");
        }
    }
    cout << str << endl;
}