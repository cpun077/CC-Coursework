#include <iostream>
#include <iomanip>
#include <cmath>
using namespace std;

// to run, cd C:\users\ then cd the username then the folder's dir
int main()
{
    cout << "Hello World!" << endl;
    cout << "My name is Caden"
         << " and I like learning new things." << endl;

    // numeric operations
    const int root = 4.0;
    cout << sqrt(root) << endl;
    cout << fabs(-1) << endl;
    cout << pow(2, 3) << endl;
    cout << static_cast<int>(root) << endl;
    // include iomanip, round num to x digits
    cout << "Rounded to 3 decimals: " << fixed << setprecision(3) << 1.21234 << endl;

    // string methods
    string str;
    cout << "Enter a string: ", cin >> str, cout << endl;
    cout << "First character is: " << str.at(0) << endl;
    str = "There are 9 Star Wars Episodes";
    cout << str, cout << " -> " << str.replace(str.find("9"), 1, "6") << endl;

    // find() returns string::npos if cannot find
    for (int i = 0; i < str.size(); i++) {
        if (!isalpha(str.at(i)) && !isspace(str.at(i))) {
            str.replace(i, 1, "IX");
        }
    }
    cout << str << endl;

    // continue keyword; idk when to use just something i didnt know
    // arrays passed into function params are actually pointers unless "const" is used

    return 0;
}