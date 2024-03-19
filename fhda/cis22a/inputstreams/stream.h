#pragma once
#include <string>
#include <sstream>
#include <fstream>

class Stream {

    public:
        void setIStr(std::string s);
        void setOStr(std::string s);
        void setIFile(std::string s);
        void setOFile(std::string s);

    private:
        std::istringstream istr;
        std::ostringstream ostr;
        std::ifstream ifile;
        std::ofstream ofile;

};