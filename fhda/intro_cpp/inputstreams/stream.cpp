using namespace std;
#include "stream.h"
#include "iostream"

void Stream::setIStr(string s) {
    istr.clear();
    istr.str(s);
    string input;
    istr >> input;
    cout << "First string is: " << input << endl;
}

void Stream::setOStr(string s) {
    ostr.clear();
    ostr << s;
    cout << "Output string stream: " << ostr.str() << endl;
}

void Stream::setIFile(string s) {
    string filestring;
    cout << "Opening file" << endl;
    ifile.open(s);

    if (!ifile.is_open()) {
        cout << "Could not open file" << endl;
        return;
    }

    while (!ifile.eof() && ifile.good()) {
        ifile >> filestring;

        if (!ifile.fail()) {
            cout << filestring << " ";
        }
    }
    cout << endl;

    if (!ifile.eof()) {
        cout << "Error reading file" << endl;
        return;
    }

    cout << "Closing File (" << s << ")" << endl;
    ifile.close();
}

void Stream::setOFile(string s) {
    ofile.open("streamoutput.txt");

    if (!ofile.is_open()) {
    cout << "Could not open file" << endl;
    return;
    }

    ofile << s << endl;

    cout << "Closing File (streamoutput.txt)" << endl;
    ofile.close();
}