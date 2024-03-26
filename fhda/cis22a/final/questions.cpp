using namespace std;
#include <iostream>
#include <string>
#include <algorithm>
#include <fstream>
#include <map>
#include "final.h"

void rotate_string(string& st, size_t k, bool right) {
    if (st.empty() || k == 0) return;

    int count = k % st.length();

    if (right) {
        rotate(st.rbegin(), st.rbegin()+count, st.rend());
    } else {
        rotate(st.begin(), st.begin()+count, st.end());
    }
}

int mainq() {
    // Q1

    string name;
    string id;
    string phone;
    string name_id;
    cout << "Welcome to string rotation!" << endl;

    cout << "Enter first name: ", cin >> name;
    cout << "Enter student id: ", cin >> id;
    cout << "Enter phone number: ", cin >> phone;
    name_id = name + id;
    cout << "name_id before rotation: " << name_id << endl;

    cout << "Rotate right for even digit and left for odd digit: " << endl;
    for (char c : phone) {
        if (isdigit(c)) {
            int digit = c - '0';
            bool right;
            right = (digit % 2 == 0);
            rotate_string(name_id, digit, right);
            cout << "digit = " << digit << ", name_id = " << name_id << endl;
        }
    }
    cout << "Rotated name_id: " << name_id << endl;

    cout << "Rotate left for even digit and right for odd digit: " << endl;
    for (char c : phone) {
        if (isdigit(c)) {
            int digit = c - '0';
            bool right;
            right = !(digit % 2 == 0);
            rotate_string(name_id, digit, right);
            cout << "digit = " << digit << ", name_id = " << name_id << endl;
        }
    }
    cout << "Rotated name_id: " << name_id << endl;

    // Q2

    string input;
    string output;
    ifstream ifile;
    ofstream ofile;
    map<char, int> letterMap;
    map<char, int> digitMap;
    int lines = 0;
    int letters = 0;

    cout << "Give a directory to an input file to read: ", cin >> input;
    cout << "Give a directory to an output file to write: ", cin >> output;

    string filestring;
    cout << "Opening files" << endl;
    ifile.open(input);
    ofile.open(output);

    if (!ifile.is_open()) {
        cout << "Could not open input file" << endl;
        return -1;
    }
    if (!ofile.is_open()) {
        cout << "Could not open output file" << endl;
        return -1;
    }

    while (!ifile.eof() && ifile.good()) {
        ifile >> filestring;

        if (!ifile.fail()) {
            cout << filestring << " ";
        }
    }
    cout << endl;

    if (!ifile.eof()) {
        cout << "Error reading input file" << endl;
        return -1;
    }

    ifile.clear();
    ifile.seekg(0);

    for (char c : name) {
        if (isalpha(c)) {
            c = tolower(c);
            if (letterMap.find(c) == letterMap.end()) {
                letterMap[c] = 0;
            }
        }
    }
    for (char c : phone) {
        if (isdigit(c)) {
            if (digitMap.find(c) == digitMap.end()) {
                digitMap[c] = 0;
            }
        }
    }

    char c;
    while(ifile.get(c)) {
        if (isalpha(c)) {
            letters++;
            c = tolower(c);
            if (letterMap.find(c) != letterMap.end()) {
                letterMap[c]++;
            }
        } else if (isdigit(c)) {
            if (digitMap.find(c) != digitMap.end()) {
                digitMap[c]++;
            }
        }
    }

    ifile.clear();
    ifile.seekg(0);

    string line;
    while(getline(ifile, line)) {
        lines++;
    }

    for (auto& pair : letterMap) {
        cout << "Letter: " << pair.first << ", Count: " << pair.second << endl;
        ofile << "Letter: " << pair.first << ", Count: " << pair.second << endl;
    }
    for (auto& pair : digitMap) {
        cout << "Digit: " << pair.first << ", Count: " << pair.second << endl;
        ofile << "Digit: " << pair.first << ", Count: " << pair.second << endl;
    }
    cout << "Lines: " << lines << endl;
    ofile << "Lines: " << lines << endl;
    cout << "Letters: " << letters << endl;
    ofile << "Letters: " << letters << endl;

    cout << "Closing input file (" << input << ")" << endl;
    ifile.close();
    cout << "Closing output file (" << output << ")" << endl;
    ofile.close();

	return 0;
}