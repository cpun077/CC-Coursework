#include <iostream>
#include <vector>
#include "shape.h"

using namespace std;

int main(void)
{
	const int size = 8;
	vector<Shape*> A(size); //A[] of Shape *
	//A = new Shape * [8];
	A[0] = new Square(5);
	// A[1] = new Triangle(4, 2);
	A[1] = new EquilateralTriangle(5);
	A[2] = new Square(10);
	// A[3] = new Triangle(8, 4);
	A[3] = new EquilateralTriangle(8);
	A[4] = nullptr;
	A[5] = new Circle(5);
	A[6] = new Rectangle(2, 4);
	A[7] = new Circle(3);

	for (int i = 0; i < size; i++)
	{
		cout << "i = " << i << ",  ";
		if (A[i] != nullptr)
		{
			//dynamic/late binding; runtime based on obj type
			A[i]->computeArea();
			A[i]->computePerimeter();
			cout << "A[" << i << "] = ";
			cout << A[i]->toString() << endl;
			//static/early binding; compile time based on pointer type
			A[i]->printArea();
			A[i]->printPerimeter();
		}
		else cout << "A[" << i << "] = null" << endl;
		cout << endl;
		// for (int i = 0; i < size; i++)
		// {
		// 	delete A[i];
		// 	A[i] = nullptr;
		// }
	}
	return 0;
}