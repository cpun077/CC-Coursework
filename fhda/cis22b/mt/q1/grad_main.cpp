#include <iostream>
#include <vector>
#include <iterator>
#include "person.h"
#include "student.h"
#include "grad.h"

using namespace std;

int main(void)
{
	cout << "Welcome to main()!" << endl;
	int num = 0;
	while (true)
	{

		cout << "Enter num of grad students ( <= 0 to quit): ";
		cin >> num;
		if (num <= 0)
			break; // exit the while loop

		vector<Grad> pa(num); // no objects yet
		Grad obj;
		for (size_t i = 0; i < num; i++)
		{
			cout << "Reading a new Grad " << endl;
			// p.read();
			cin >> obj;
			// vector is created already with num amount of elements so no need for push back
			pa[i] = obj;
		}

		cout << "contents of pa: " << endl;
		size_t size = pa.size();
		for (size_t i = 0; i < size; i++)
		{
			cout << "pa[" << i << "]: " << pa[i] << endl;
		}
		cout << endl;

		for (size_t i = 0; i < pa.size(); i++)
		{
			// pa[i].print(cout);
			cout << pa[i] << endl;
		}
		cout << endl;

		// different way to print containers like vector
		for (Grad obj : pa)
		{
			cout << obj << endl;
		}
		cout << endl;
	}
	return 0;
}