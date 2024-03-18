using namespace std;
#include "stream.h"
#include "iostream"

void Stream::setIStr(string s) {
    istr.clear();
    istr.str(s);
    string input;
    istr >> input;
    cout << "First word is: " << input << endl;
}

void Stream::setOStr(string s) {

}

void Stream::setIFile(string s) {

}

void Stream::setOFile(string s) {
    
}