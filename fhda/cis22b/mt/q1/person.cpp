#include <iostream>
#include <limits>
#include "person.h"

using namespace std;

//initialize all static data here:
int Person::count = 0;

//implement all methods declared in person.h

//four basic methods
Person::Person()
	//default constructor
{
	count++;
	set("", 0);
}

Person::~Person()
	//destructor
{
	count--;
	//no pointers; no dynamic memory to delete
	//if the class has allocated memory, we must delete it here.
}

Person::Person(const Person& obj)
	//copy ocnstructor
{
	count++;
	set(obj);
}

Person& Person::operator=(const Person& obj)
	//assignment operator
{
	if (this == &obj)
		return (*this);

	set(obj);
	return *this;	//this: a pointer to the current object
					//*this: the current object
}

//other constructors
Person::Person(const string& name_i, int age_i)
{
	count++;
	set(name_i, age_i);
}

ostream& operator<<(ostream& os, const Person& obj)
{
	os << "name = " << obj.name << ", age = " << obj.age;
	//os << endl;
	return os;
}

istream& operator>>(istream& is, Person& obj)
{
	cout << "Enter name: ";
	//is would read one word only from name; use getline
	is.ignore(); //when using getline and is together
	getline(is, obj.name);
	cout << "Enter age: ";
	is >> obj.age;
	return is;
}

int Person::get_count()
{
	return count; 
}

void Person::set_count(int count_i)
{
	count = count_i;
}

int Person::get_age() const
{
	return age;
}

const string Person::get_name() const
{
	return name;
}

void Person::set_name(const string& name_i)
{
	name = name_i;
}

void Person::set_age(int age_i)
{
	age = age_i;
}

void Person::set(const string& name_i, int age_i)
{
	//name = name_i;
	//age = age_i;
	set_name(name_i);
	set_age(age_i);
}

void Person::set(const Person& obj)
{
	set(obj.name, obj.age);
}

void Person::print(ostream& os) const
{
	//*this is the current object; this is the pointer to it
	os << *this << endl;
}

void Person::read()
{
	cin >> *this;
}