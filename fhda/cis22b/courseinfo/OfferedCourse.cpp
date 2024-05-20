#include "OfferedCourse.h"
using namespace std;

// TODO: Define mutator functions -
//      SetInstructorName(), SetLocation(), SetClassTime()
   void OfferedCourse::SetInstructorName(string i) {
      instructor = i;
   }
   void OfferedCourse::SetLocation(string l) {
      loc = l;
   }
   void OfferedCourse::SetClassTime(string t) {
      time = t;
   }


// TODO: Define accessor functions -
//      GetInstructorName(), GetLocation(), GetClassTime()
   string OfferedCourse::GetInstructorName() const {
      return instructor;
   }
   string OfferedCourse::GetLocation() const {
      return loc;
   }
   string OfferedCourse::GetClassTime() const {
      return time;
   }