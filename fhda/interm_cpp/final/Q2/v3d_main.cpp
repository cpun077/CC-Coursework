#include <iostream>
#include "v3d.h"

using namespace std;

int main()
{
    cout << "Welcome to V3d!" << endl;

    const V3d<double> v(2.0, 3.0, 4.0);
    cout << v << endl;

    V3d<double> v1, v2(3.0, -3.0, 3.0), v3(4.0), v4(0.0, 4.0, 0.0);
    V3d<double> v5, v6, v7, v8;
    const V3d<double> v9(v2), v10(v4);
    V3d<double> Result;

    cout << "Arithmetic on v1 and v2:" << endl;
    cout << "========================" << endl;
    cout << endl;

    cout.width(15);
    cout << "v1 = ";
    cout << v1 << endl;

    cout.width(15);
    cout << "v2 = ";
    cout << v2 << endl;

    cout.width(15);
    Result = v1 + v2;
    cout << "(v1 + v2) = ";
    cout << Result << endl;

    cout.width(15);
    Result = v1 - v2;
    cout << "(v1 - v2) = ";
    cout << Result << endl;

    cout.width(15);
    Result = v1;
    Result += v2;
    cout << "(v1 += v2) = ";
    cout << Result << endl;

    cout.width(15);
    Result = v1;
    Result -= v2;
    cout << "(v1 -= v2) = ";
    cout << Result << endl;

    cout << endl;
    cout.width(15);
    Result = v1 + v2 - v3 + v4;
    cout << "(v1+v2-v3+v4) = " << Result << endl;

    cout << "v1 = " << v1 << endl << "v2 = " << v2 << endl;
    cout << "v3 = " << v3 << endl << "v4 = " << v4 << endl;
    cout << endl;
    Result = v1++;
    cout << "v1++ = " << Result << endl;
    Result = ++v2;
    cout << "++v2 = " << Result << endl;
    Result = v3--;
    cout << "v3-- = " << Result << endl;
    Result = --v4;
    cout << "--v4 = " << Result << endl;

    v5 = v1;
    v6 = v2;
    v7 = v3;
    v8 = v4;

    v5 = -v5;
    v6 = -v6;

    cout << "v1 = ";
    cout << v1 << endl;
    cout << "v2 = ";
    cout << v2 << endl;
    cout << "v3 = ";
    cout << v3 << endl;
    cout << "v4 = ";
    cout << v4 << endl;
    cout << "v5 = ";
    cout << v5 << endl;
    cout << "v6 = ";
    cout << v6 << endl;
    cout << "v7 = ";
    cout << v7 << endl;
    cout << "v8 = ";
    cout << v8 << endl;
    cout << endl;

    v1 = V3d<double>(0.0, -4.0, 3.0);
    v2 = V3d<double>(4.0);
    v3 = V3d<double>(-3.0, 3.0, -3.0);
    v4 = V3d<double>();
    v5 = V3d<double>(5.0);
    v6 = V3d<double>(6.0);
    v7 = V3d<double>(7.0);
    v8 = V3d<double>(8.0);

    cout << endl;

    cout << "v = V3d(.) calls" << endl;
    cout << "v1 = ";
    cout << v1 << endl;
    cout << "v2 = ";
    cout << v2 << endl;
    cout << "v3 = ";
    cout << v3 << endl;
    cout << "v4 = ";
    cout << v4 << endl;
    cout << "v5 = ";
    cout << v5 << endl;
    cout << "v6 = ";
    cout << v6 << endl;
    cout << "v7 = ";
    cout << v7 << endl;
    cout << "v8= ";
    cout << v8 << endl;
    cout << endl;

    v3 -= V3d<double>(3.0);
    v5 = v + V3d<double>(3.0);

    cout << "v1 = ";
    cout << v1 << endl;
    cout << "v2 = ";
    cout << v2 << endl;
    cout << "v3 = ";
    cout << v3 << endl;
    cout << "v4 = ";
    cout << v4 << endl;
    cout << "v5 = ";
    cout << v5 << endl;
    cout << "v6 = ";
    cout << v6 << endl;
    cout << endl;

    return 0;
}
