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

**Output:**  The 2 norm of the vector

**Usage/Example:**

Output from the lines above:



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

**Last Modified:** 1/11/2019

