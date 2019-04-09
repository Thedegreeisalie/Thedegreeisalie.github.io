# Task 6:
Task: Implement a method that will compute the 2-norm of an arbitrary vector will real number entries. Add an entry to your for the method you create
# Proof

**Routine Name:**          twoNormVector

**Author:** Jer Moore

**Language:** C++, can be compiled with the g++ compiler **cmake** and the **make** commands, The version here was g++ (GCC) 6.4.0.

For example, the following will compile the small demonstration function as well as the routine twoNormVector

    g++ -c twoNormVector.cpp
	ar rcv twoNormVector.a twoNormVector.o
	mkdir build
	cd build
	cmake ..
	make



**Description/Purpose:**  Computes the absolute error betwen two numbers x and y

**Input:** A vector with real values

**Output:**  The 2 norm of the vector in the form of a scalar

**Usage/Example:** With the driver function `main.cpp`

    jer@thismachinelaughsatfascists:~/Workspace/math5610/hw2/task6/build$ ./Task6 3
    sqrt(0.671077*0.671077+0.308964*0.308964+0.361109*0.361109+) = 0.822315
    jer@thismachinelaughsatfascists:~/Workspace/math5610/hw2/task6/build$ ./Task6 90
    sqrt(0.421763*0.421763+0.0358449*0.0358449+0.797981*0.797981+0.740642*0.740642+0.88*0.88+0.323443*0.323443+0.383566*0.383566+0.917537*0.917537+0.846122*0.846122+0.310242*0.310242+0.501903*0.501903+0.430487*0.430487+0.885223*0.885223+0.471497*0.471497+0.452384*0.452384+0.301733*0.301733+0.151083*0.151083+0.525393*0.525393+0.585515*0.585515+0.434865*0.434865+0.626525*0.626525+0.0812608*0.0812608+0.799072*0.799072+0.253808*0.253808+0.497771*0.497771+0.820969*0.820969+0.933394*0.933394+0.519668*0.519668+0.237479*0.237479+0.955291*0.955291+0.673102*0.673102+0.259376*0.259376+0.977187*0.977187+0.148171*0.148171+0.99752*0.99752+0.583794*0.583794+0.433143*0.433143+0.0194166*0.0194166+0.211077*0.211077+0.534275*0.534275+0.6467*0.6467+0.364511*0.364511+0.819247*0.819247+0.0632101*0.0632101+0.25487*0.25487+0.235757*0.235757+0.0851068*0.0851068+0.802918*0.802918+0.994579*0.994579+0.107003*0.107003+0.824815*0.824815+0.674164*0.674164+0.865825*0.865825+0.846712*0.846712+0.696061*0.696061+0.54541*0.54541+0.737071*0.737071+0.717958*0.717958+0.567307*0.567307+0.285118*0.285118+0.476779*0.476779+0.589204*0.589204+0.307015*0.307015+0.893289*0.893289+0.00571375*0.00571375+0.323875*0.323875+0.515536*0.515536+0.101809*0.101809+0.688083*0.688083+0.537432*0.537432+0.123706*0.123706+0.70998*0.70998+0.953943*0.953943+0.145603*0.145603+0.521103*0.521103+0.975839*0.975839+0.693651*0.693651+0.543*0.543+0.392349*0.392349+0.715547*0.715547+0.564897*0.564897+0.414246*0.414246+0.000519735*0.000519735+0.586793*0.586793+0.830756*0.830756+0.0224164*0.0224164+0.266379*0.266379+0.852653*0.852653+0.438927*0.438927+0.288276*0.288276+) = 5.59195



**Implementation/Code:** The following is the code for twoNormVector.h
	#ifndef _TWONORMVECTOR_H_
	#define _TWONORMVECTOR_H_

	#include <vector>
	#include <math.h>
	double twoNormVector(std::vector<double> v1);
	#endif

The following is the code for twoNormVector.cpp

	// Task: Implement a method that will compute the 2-norm of an arbitrary vector will real number entries. Add an entry to your for the method you create
	#include "twoNormVector.h"

	double twoNormVector(std::vector<double> v1) {
		double sum = 0.0;
		for( int i = 0; i < v1.size(); i++) {
			sum += v1[i]*v1[i];
		}
		return sqrt(sum);
	}
The following is the code for main.cpp

	#include <iostream>
	#include <chrono>
	#include <random>

	double twoNormVector(std::vector<double> v1);


	int main(int argc, char *argv[]) {

		typedef std::chrono::high_resolution_clock clock;
		clock::time_point begining = clock::now();

		std::vector<double> v1;
		double sum = 0.0;

		int n = std::stoi(argv[1]);
		for (int i = 0; i < n; i++) {
			std::uniform_real_distribution<double> unif(1, 0);
			clock::duration d = clock::now() - begining;
			std::default_random_engine re (d.count());
			v1.push_back(unif(re));
		}
		sum = twoNormVector(v1);

		std::cout << "sqrt(";
		for (int i =0; i < n; i++) {
			std::cout << v1[i] << "*" << v1[i] << "+";
		}
		std::cout << ") = " << sum << std::endl;
		return 0;
	}

**Last Modified:** 04/09/2019
