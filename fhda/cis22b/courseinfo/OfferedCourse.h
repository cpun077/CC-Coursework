#ifndef OFFERED_COURSEH
#define OFFERED_COURSEH

#include "Course.h"

class OfferedCourse : public Course {
	// TODO: Declare private data members
	private:
	   string instructor, loc, time;


	// TODO: Declare mutator functions -
	//      SetInstructorName(), SetLocation(), SetClassTime()
	public:
	   void SetInstructorName(string i);
	   void SetLocation(string loc);
	   void SetClassTime(string t);
	   string GetInstructorName() const;
	   string GetLocation() const;
	   string GetClassTime() const;


	// TODO: Declare accessor functions -
	//      GetInstructorName(), GetLocation(), GetClassTime()


};

#endif