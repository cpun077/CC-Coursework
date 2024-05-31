#pragma once

#include <iostream>
#include <string>
using namespace std;

class Person
{
public:
	//Four basic methods a class must have.
	Person();	//default constructor
	virtual ~Person();	//destructor
	Person(const Person& obj);	//copy constructor
	Person& operator=(const Person& obj); //assignment operator

	//other constructors
	Person(const string& name_i, int age_i);

	friend ostream& operator<<(ostream& os, const Person& obj);
	friend istream& operator>>(istream& os, Person& obj);

	//static functions can access only static members
	//static in .h only; no "this" in static
	static int get_count();
	static void set_count(int count_i);

	//get methods; getters; selectors; read only
	int get_age() const; //object *this is const
	const string get_name() const; //object *this is const

	//set methods; setters; modifiers; read/write
	void set_age(int age_i);
	void set_name(const string& name_i);

	//two versions of set() is function overloading
	//two functions; same name; same work; different signatures
	virtual void set(const string& name_i, int age_i);
	virtual void set(const Person& obj);

	//other methods
	//we do not need print(); overloading << is enough
	//we do not need read(); overloading >> is enough
	//print is only for demonstration
	virtual void print(ostream& os) const; //print to os; like cout
	virtual void read(); //read/write

private:
	static int count; //static or class data not object
	//the static keyword appears in the class declaration only; .h
	string name;
	int age;

//protected:
};
