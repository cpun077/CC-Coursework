#include <iostream>
#include <iomanip>
#include <cmath>
#include "methods.h"
using namespace std;

int main()
{
    cout << "Caden's Hello World for CPP (this language sucks)" << endl;

    // numeric operations
    const int root = 4.0;
    cout << sqrt(root) << endl;
    cout << fabs(-1) << endl;
    cout << pow(2, 3) << endl;
    cout << static_cast<int>(root) << endl;

    printRounded(1.234552);
    stringStuff();

    // continue keyword; idk when to use just something i didnt know
    // arrays passed into function params are actually pointers unless "const" is used

    return 0;
}