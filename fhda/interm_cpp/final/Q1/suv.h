#pragma once

#include <iostream>
#include <string>
#include "vehicle.h"
using namespace std;

class SUV: public Vehicle {
    public:
        SUV();
        SUV(string color_i, string owner_i, int doors_i, double mpg_i);
        ~SUV();
        SUV& operator=(const SUV& obj);
        bool operator==(const SUV& obj);
        friend ostream& operator<<(ostream& os, const SUV& obj);
        void set(string color_i, string owner_i, int doors_i, double mpg_i);
        void set(SUV suv_i);
        void setMPG(double mpg_i);
        double getMPG();
    private:
        double mpg;
};