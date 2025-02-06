#pragma once

#include <iostream>
#include <string>
using namespace std;

class Vehicle {
    public:
        Vehicle();
        Vehicle(string color_i, string owner_i, int doors_i);
        virtual ~Vehicle();
        Vehicle& operator=(const Vehicle& obj);
        bool operator==(const Vehicle& obj);
        friend ostream& operator<<(ostream& os, const Vehicle& obj);
        virtual void set(string color_i, string owner_i, int doors_i);
        virtual void set(Vehicle vehicle_i);
        virtual void setColor(string color);
        virtual void setOwner(string owner);
        virtual void setDoors(int doors_i);
        virtual string getColor() const;
        virtual string getOwner() const;
        virtual int getDoors() const;
        static int getCount();
    private:
        string color, owner;
        int doors;
        static int count;
};