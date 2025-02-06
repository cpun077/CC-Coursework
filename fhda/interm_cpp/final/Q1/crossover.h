#pragma once

#include <iostream>
#include <string>
#include "vehicle.h"
using namespace std;

class Crossover: public Vehicle {
    public:
        Crossover();
        Crossover(string color_i, string owner_i, int doors_i, double mpg_i);
        ~Crossover();
        Crossover& operator=(const Crossover& obj);
        bool operator==(const Crossover& obj);
        friend ostream& operator<<(ostream& os, const Crossover& obj);
        void set(string color_i, string owner_i, int doors_i, double mpg_i);
        void set(Crossover crossover_i);
        void setMPG(double mpg_i);
        double getMPG();
    private:
        double mpg;
};