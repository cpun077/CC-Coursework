#include <iostream>
#include <limits>
#include "grad.h"

using namespace std;

//implement all methods declared in Student.h

//four basic methods
Grad::Grad()
//default constructor
{
	Student();
	set("");
}

Grad::~Grad()
//destructor
{
	//no pointers; no dynamic memory to delete
	//if the class has allocated memory, we must delete it here.
}

Grad::Grad(const Grad& obj)
//copy ocnstructor
{
	set(obj);
}

Grad& Grad::operator=(const Grad& obj)
//assignment operator
{
	if (this == &obj)
		return (*this);

	set(obj);
	return *this;	
}

//other constructors
Grad::Grad(const string& name_i, int age_i,
	const string& major_i, int year_i, string& thesis_i)
{
	set(name_i, age_i, major_i, year_i, thesis_i);
}

//in c++, we override << operator as a friend; not a member
//friend methods can assess private members
ostream& operator<<(ostream& os, const Grad& obj)
{
	os << Student(obj) <<
		", thesis = " << obj.thesis;
	//os << endl;
	return os;
}

istream& operator>>(istream& is, Grad& obj)
{
	Student s;
	is >> s;
	obj.set_name(s.get_name());
	obj.set_age(s.get_age());
	obj.set_major(s.get_major());
	obj.set_year(s.get_year());
	cout << "Enter thesis: ";
	//cin would read one word only from major; use getline
	is.ignore(); //when using getline and cin together
	getline(cin, obj.thesis);
	return is;
}

const string Grad::get_thesis() const
{
	return thesis;
}

void Grad::set_thesis(const string& thesis_i)
{
	thesis = thesis_i;
}

void Grad::set(const string& thesis_i) {
	set_thesis(thesis_i);
}

void Grad::set(const string& major_i, int year_i, const string& thesis_i)
{
	Student::set(major_i, year_i);
	set_thesis(thesis_i);
}

void Grad::set(const string& name_i, int age_i,
	const string& major_i, int year_i, const string& thesis_i)
{
	//set name and age?
	Student::set(name_i, age_i, major_i, year_i);
	set_thesis(thesis_i);
}

void Grad::set(const Grad& obj)
{
	//Person::set(obj);
	Student::set(obj.get_name(), obj.get_age(), obj.get_major(), obj.get_year());
	set(obj.thesis);
}

void Grad::print(ostream& os) const
{
	os << *this << endl;
}

void Grad::read()
{
	cin >> *this;
}