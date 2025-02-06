#include "Course.h"
#include "iostream"
using namespace std;

	// TODO: Define mutator functions - 
	//       SetCourseNumber(), SetCourseTitle()
	void Course::SetCourseNumber(string n) {
	   number = n;
	}
	void Course::SetCourseTitle(string t) {
	   title = t;
	}


	// TODO: Define accessor functions - 
	//       GetCourseNumber(), GetCourseTitle()
	string Course::GetCourseNumber() const {
	   return number;
	}
	string Course::GetCourseTitle() const {
	   return title;
	}


	// TODO: Define PrintInfo()
	void Course::PrintInfo() const {
	   cout << "Course Information:" << endl;
	   cout << "   Course Number: " << number << endl;
	   cout << "   Course Title: " << title << endl;
	}