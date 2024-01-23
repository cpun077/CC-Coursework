#include <iostream>
#include <iomanip>
#include <cmath>
using namespace std;

// to run, cd C:\users\ then cd the username then the folder's dir
int main () {
    cout << "Hello World!" << endl;
    cout << "My name is Caden"
        << " and I like learning new things."
        << endl;
    double num = 1.21234;
    // include iomanip, round num to x digits
    cout << "Rounded to 3 decimals: " << fixed << setprecision(3) << num << endl;

    const int root = 4.0;
    cout << sqrt(root) << endl;
    cout << fabs(-1) << endl;
    cout << pow(2, 3) << endl;
    cout << static_cast<int>(root) << endl;

    return 0;
}