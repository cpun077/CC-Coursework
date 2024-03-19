#include "stream.h"
using namespace std;
#include "iostream"

int main()
{
    Stream s;
    string inputStr;

    cout << "Write some text to be set to an input string: ";
    getline(cin, inputStr);
    s.setIStr(inputStr);
    cout << "Write some text to be echoed by an output string: ";
    getline(cin, inputStr);
    s.setOStr(inputStr);
    cout << "Give a directory to an input file to read: ";
    getline(cin, inputStr);
    s.setIFile(inputStr);
    cout << "Write some text to set to an output file: ";
    getline(cin, inputStr);
    s.setOFile(inputStr);

    return 0;
}