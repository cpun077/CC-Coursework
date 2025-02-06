#include <iostream>
#include "crossover.h"

Crossover::Crossover()
{
	Vehicle();
	set("", "", 0, 0.0);
}

Crossover::Crossover(string color_i, string owner_i, int doors_i, double mpg_i)
{
	Vehicle(color_i, owner_i, doors_i);
	set(color_i, owner_i, doors_i, mpg_i);
}

Crossover::~Crossover() {
    
}

Crossover& Crossover::operator=(const Crossover& obj)
{
	if (this == &obj)
		return (*this);

	set(obj);
	return *this;
}

bool Crossover::operator==(const Crossover& obj) {
    return (obj.mpg == this->mpg && obj.getColor() == Vehicle::getColor() && obj.getOwner() == Vehicle::getOwner() && obj.getDoors() == Vehicle::getDoors());
}

void Crossover::setMPG(double mpg_i) {
    mpg = mpg_i;
}

double Crossover::getMPG() {
    return mpg;
}

ostream& operator<<(ostream& os, const Crossover& obj)
{
	os << Vehicle(obj) << ", mpg = " << obj.mpg;
	//os << endl;
	return os;
}

void Crossover::set(string color_i, string owner_i, int doors_i, double mpg_i) {
    Vehicle::set(color_i, owner_i, doors_i);
    mpg = mpg_i;
}

void Crossover::set(Crossover crossover_i) {
    Vehicle::set(crossover_i.getColor(), crossover_i.getOwner(), crossover_i.getDoors());
    this->mpg = mpg;
}
