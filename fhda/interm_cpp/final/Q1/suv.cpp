#include <iostream>
#include "suv.h"

SUV::SUV()
{
	Vehicle();
	set("", "", 0, 0.0);
}

SUV::SUV(string color_i, string owner_i, int doors_i, double mpg_i)
{
	Vehicle(color_i, owner_i, doors_i);
	set(color_i, owner_i, doors_i, mpg_i);
}

SUV::~SUV() {
    
}

SUV& SUV::operator=(const SUV& obj)
{
	if (this == &obj)
		return (*this);

	set(obj);
	return *this;
}

bool SUV::operator==(const SUV& obj) {
    return (obj.mpg == this->mpg && obj.getColor() == Vehicle::getColor() && obj.getOwner() == Vehicle::getOwner() && obj.getDoors() == Vehicle::getDoors());
}

void SUV::setMPG(double mpg_i) {
    mpg = mpg_i;
}

double SUV::getMPG() {
    return mpg;
}

ostream& operator<<(ostream& os, const SUV& obj)
{
	os << Vehicle(obj) << ", mpg = " << obj.mpg;
	//os << endl;
	return os;
}

void SUV::set(string color_i, string owner_i, int doors_i, double mpg_i) {
    Vehicle::set(color_i, owner_i, doors_i);
    mpg = mpg_i;
}

void SUV::set(SUV suv_i) {
    Vehicle::set(suv_i.getColor(), suv_i.getOwner(), suv_i.getDoors());
    this->mpg = mpg;
}
