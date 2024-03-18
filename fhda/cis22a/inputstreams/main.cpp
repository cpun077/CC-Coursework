#include "stream.h"
using namespace std;
#include "iostream"

int main()
{
    Stream s;
    string inputStr;

    cout << "Set input string stream here: ";
    getline(cin, inputStr);
    s.setIStr(inputStr);
    cout << "Set output string stream here: ";
    getline(cin, inputStr);
    s.setOStr(inputStr);
    cout << "Set input file stream here: ";
    getline(cin, inputStr);
    s.setIFile(inputStr);
    cout << "Set ouput file stream here: ";
    getline(cin, inputStr);
    s.setOFile(inputStr);

    return 0;
}