#ifndef COURSEH
#define COURSEH

#include <iostream>
#include <string>

using namespace std;

class Course {
	// TODO: Declare private data members
	private:
	   string number, title;
	
	public: 
	   void SetCourseNumber(string n);
	   void SetCourseTitle(string t);
	   string GetCourseNumber() const;
	   string GetCourseTitle() const;
	   void PrintInfo() const;


	// TODO: Declare mutator functions 
	//       SetCourseNumber(), SetCourseTitle()


	// TODO: Declare accessor functions - 
	//       GetCourseNumber(), GetCourseTitle()


	// TODO: Declare PrintInfo()

};

#endif
