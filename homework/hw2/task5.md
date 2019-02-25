# Task 2: 
Task: Implement a method that will return a scalar multiple of a given vector. The method should require a vector and number for the operation. Add an entry to your software manual for this method. 
# Proof

**Routine Name:**          scaleVector 

**Author:** Jer Moore

**Language:** C++, can be compiled with the g++ compiler **cmake** and the **make** commands, The version here was g++ (GCC) 6.4.0.

For example, the following will compile the small demonstration function as well as the routine absError

    g++ -c scaleVector.cpp
	ar rcv scaleVector.a scaleVector.o
	mkdir build
	cd build
	cmake ..
	make



**Description/Purpose:**  Computes the absolute error betwen two numbers x and y

**Input:**  a number **scale** and a vetor **v1** 

**Output:**  a vector that is the original scaled by **scale**

**Usage/Example:**

Output from the lines above:

The first value (24) is the number of binary digits that define the machine epsilon and the second is related to the
decimal version of the same value. The number of decimal digits that can be represented is roughly eight (E-08 on the
end of the second value).

**Implementation/Code:** The following is the code for scaleVector.h

	#ifndef _SCALEVECTOR_H_
	#define _SCALEVECTOR_H_

	#include <vector>
	std::vector <double> scaleVector(double s1, std::vector<double> v1);
	#endif

The following is the code for scaleVector.cpp
	//task: Implement a method that will return a scalar multiple of a given vector. The method should require a vector and number for the operation. Add an entry to your software manual for this method. 

	#include "scaleVector.h"

	std::vector<double> scaleVector(double s1, std::vector<double> v1) {
		std::vector<double> sum;
		for( int i =0; i < v1.size(); i++) {
			sum.push_back(s1 * v1[i]);
		}
		return sum;
	}

The following is the code for main.cpp
	#include <iostream>
	#include <chrono>
	#include <random>

	std::vector<double> scaleVector(double scale, std::vector<double> v2);

	int main(int argc, char *argv[]) {
		
		typedef std::chrono::high_resolution_clock clock;
		clock::time_point begining = clock::now();

		std::vector<double> v1, sum;

		int n = std::stoi(argv[1]);
		for (int i = 0; i < n; i++) {
			std::uniform_real_distribution<double> unif(1, 0);
			clock::duration d = clock::now() - begining;
			std::default_random_engine re (d.count());
			v1.push_back(unif(re));
		}
		std::uniform_real_distribution<double> unif(1, 0);
		clock::duration d = clock::now() - begining;
		std::default_random_engine re (d.count());
		
		double scale = unif(re);

		sum = scaleVector(scale, v1);

		for (int i =0; i < n; i++) {
			std::cout << v1[i] << " * " << scale << " = "<<  sum[i] << std::endl;
		}
		return 0;
	}

**Last Modified:** 1/11/2019
