#pragma once
#include <iostream>
#include <cmath>

using namespace std;

template <typename T>
class V3d
{
public:
    V3d(T x_i = 0, T y_i = 0, T z_i = 0) : x(x_i), y(y_i), z(z_i) {}

    V3d(const V3d& obj) : x(obj.x), y(obj.y), z(obj.z) {}

    virtual ~V3d() {}

    void set(T x_i = 0, T y_i = 0, T z_i = 0) {
        x = x_i;
        y = y_i;
        z = z_i;
    }

    void setx(T x_i = 0) {
        x = x_i;
    }

    void sety(T y_i = 0) {
        y = y_i;
    }

    void setz(T z_i = 0) {
        z = z_i;
    }

    T length() const {
        return sqrt(x * x + y * y + z * z);
    }

    V3d& operator = (const V3d& obj) {
        if (this == &obj)
            return *this;
        x = obj.x;
        y = obj.y;
        z = obj.z;
        return *this;
    }

    V3d operator - () const {
        return V3d(-x, -y, -z);
    }

    V3d operator + (const V3d& obj) const {
        return V3d(x + obj.x, y + obj.y, z + obj.z);
    }

    V3d operator - (const V3d& obj) const {
        return V3d(x - obj.x, y - obj.y, z - obj.z);
    }

    V3d& operator += (const V3d& obj) {
        x += obj.x;
        y += obj.y;
        z += obj.z;
        return *this;
    }

    V3d& operator -= (const V3d& obj) {
        x -= obj.x;
        y -= obj.y;
        z -= obj.z;
        return *this;
    }

    V3d& operator -- () {
        --x;
        --y;
        --z;
        return *this;
    }

    V3d operator -- (int) {
        V3d temp = *this;
        --(*this);
        return temp;
    }

    V3d& operator ++ () {
        ++x;
        ++y;
        ++z;
        return *this;
    }

    V3d operator ++ (int) {
        V3d temp = *this;
        ++(*this);
        return temp;
    }

    friend ostream& operator << (ostream& OS, const V3d& obj) {
        OS << '(' << obj.x << ", " << obj.y << ", " << obj.z << ')';
        return OS;
    }

private:
    T x;
    T y;
    T z;
};
