# Task 8:
Task:Implement a method that will compute the ∞-norm of an arbitrary vector will real number entries. Add an entry to your for the method you create
# Proof

**Routine Name:**          infinityNormVector

**Author:** Jer Moore

**Language:** C++, can be compiled with the g++ compiler **cmake** and the **make** commands, The version here was g++ (GCC) 6.4.0.

For example, the following will compile the small demonstration function as well as the routine infinityNormVector

    g++ -c infinityNormVector.cpp
	ar rcv infinityNormVector.a infinityNormVector.o
	mkdir build
	cd build
	cmake ..
	make



**Description/Purpose:**  Computes the infinity norm of a given vector

**Input:**  A vector of real values

**Output:**  With the driver function `main.cpp`

    jer@thismachinelaughsatfascists:~/Workspace/math5610/hw2/task8/build$ ./Task8 9
    Max(0.233545 , 0.370651 , 0.0629356 , 0.294042 , 0.775711 , 0.739049 , 0.588398 , 0.043134 , 0.760946 , ) = 0.775711
    jer@thismachinelaughsatfascists:~/Workspace/math5610/hw2/task8/build$ ./Task8 6
    Max(0.0942166 , 0.811339 , 0.407184 , 0.349845 , 0.46227 , 0.764791 , ) = 0.811339

**Usage/Example:** The infinity norm is the maximum value of all of the members of the vector.

**Implementation/Code:** The following is the code for infinityNormVector.h

	#ifndef _INFINITYNORMVECTOR_H_
	#define _INFINITYNORMVECTOR_H_

	#include <vector>
	#include <math.h>
	double infinityNormVector(std::vector<double> v1);
	#endif

The following is the code for infinityNormVector.cpp

	// Task:Implement a method that will compute the ∞-norm of an arbitrary vector will real number entries. Add an entry to your for the method you create
	#include "infinityNormVector.h"

	double infinityNormVector(std::vector<double> v1) {
		double sum = 0.0;
		for( int i = 0; i < v1.size(); i++) {
			if (sum < abs(v1[i])) {
				sum = abs(v1[i]);
			}
		}
		return sum;
	}


The following is the code for main.cpp

	#include <iostream>
	#include <chrono>
	#include <random>

	double infinityNormVector(std::vector<double> v1);


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
		sum = infinityNormVector(v1);
		std::cout << "Max(";

		for (int i =0; i < n; i++) {
			std::cout << v1[i] << " , ";
		}
		std::cout << ") = " << sum << std::endl;
		return 0;
    }

**Last Modified:** 04/09/2019
