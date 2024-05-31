#pragma once

#include <iostream>
#include <string>
#include "Student.h"
using namespace std;

class Grad: public Student
{
public:
	//Four basic methods a class must have.
	Grad();	//default constructor
	virtual ~Grad();	//destructor
	Grad(const Grad& s);	//copy constructor
	Grad& operator=(const Grad& s); //assignment operator

	//other constructors
	Grad(const string& name_i, int age_i, 
		const string& major_i, int year_i, string& thesis);

	friend ostream& operator<<(ostream& os, const Grad& s);
	friend istream& operator>>(istream& os, Grad& s);

	//get methods; getters; selectors; read only
	const string get_thesis() const;

	//set methods; setters; modifiers; read/write
	void set_thesis(const string& thesis_i);

	virtual void set(const string& thesis_i);
	virtual void set(const string& major_i, int year_i, const string& thesis_i);
	virtual void set(const string& name_i, int age_i,
		const string& major_i, int year_i, const string& thesis_i);
	virtual void set(const Grad& g);

	//other methods
	//we do not need print(); overloading << is enough
	//we do not need read(); overloading >> is enough
	//print is only for demonstration
	virtual void print(ostream& os) const;
	virtual void read();

private:
	string major;
	int year;
	string thesis;

	//protected:
};
