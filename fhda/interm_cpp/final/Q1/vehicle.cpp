#include <iostream>
#include "vehicle.h"
using namespace std;

int Vehicle::count = 0;

Vehicle::Vehicle()
{
	count++;
	set("", "", 0);
}

Vehicle::Vehicle(std::string color_i, std::string owner_i, int doors_i)
{
	count++;
	set(color_i, owner_i, doors_i);
}

Vehicle::~Vehicle() {
}

Vehicle& Vehicle::operator=(const Vehicle& obj)
{
	if (this == &obj)
		return (*this);

	set(obj);
	return *this;
}

bool Vehicle::operator==(const Vehicle& obj) {
    return(color == obj.color && owner == obj.owner && obj.doors == doors);
}

ostream& operator<<(ostream& os, const Vehicle& obj)
{
	os << "color = " << obj.color << ", owner = " << obj.owner << ", doors= " << obj.doors;
	//os << endl;
	return os;
}

void Vehicle::set(std::string color_i, std::string owner_i, int doors_i) {
    color = color_i;
    owner = owner_i;
    doors = doors_i;
}

void Vehicle::set(Vehicle vehicle_i) {
    color = vehicle_i.color;
    owner = vehicle_i.owner;
    doors = vehicle_i.doors;
}

void Vehicle::setColor(std::string color) {
    this->color = color;
}

void Vehicle::setOwner(std::string owner) {
    this->owner = owner;
}

void Vehicle::setDoors(int doors_i) {
    doors = doors_i;
};

std::string Vehicle::getColor() const{
    return color;
}

std::string Vehicle::getOwner() const{
    return owner;
}

int Vehicle::getDoors() const{
    return doors;
}

int Vehicle::getCount() {
    return count;
}