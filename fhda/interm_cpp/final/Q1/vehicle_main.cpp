#include <iostream>
#include "vehicle.h"
#include "suv.h"
#include "crossover.h"
#include <vector>

using namespace std;

int main(void) {
    vector<Vehicle> va(10);
    va[0] = Vehicle();
    va[3] = Vehicle();
    va[6] = Vehicle();
    va[9] = Vehicle();
    va[1] = SUV();
    va[4] = SUV();
    va[7] = SUV();
    va[2] = Crossover();
    va[5] = Crossover();
    va[8] = Crossover();

    for (int i = 0; i < va.size(); i++) {
        va[i].setColor("red");
        va[i].setOwner("bob");
        va[i].setDoors(6);
        cout << va[i] << endl;
    }
    cout << "Vehicle Count: " << Vehicle::getCount() << endl;
}