# Task 4: 
Task: Implement a method that will add two vectors of the same length. Also create an entry for the method in your software manual.
# Proof

**Routine Name:**          addVector 

**Author:** Jer Moore

**Language:** C++, can be compiled with the g++ compiler **cmake** and the **make** commands, The version here was g++ (GCC) 6.4.0.

For example, the following will compile the small demonstration function as well as the routine addVector

    g++ -c addVector.cpp
	ar rcv addVector.a addVector.o
	mkdir build
	cd build
	cmake ..
	make



**Description/Purpose:** do vector additon of two vectors 

**Input:**  two vectors v1 and v2 

**Output:** one vector 

**Usage/Example:**

Output from the lines above:

**Implementation/Code:** The following is the code for addVector.h
	#ifndef _ADDVECTOR_H_
	#define _ADDVECTOR_H_

	#include <vector>
	std::vector <double> addVector(std::vector<double> v1, std::vector<double> v2);
	#endif
The following is the code for addVector.cpp
	//  Task: Implement a method that will add two vectors of the same length. Also create an entry for the method in your software manual.
	//  suppose that each vector is a std::vector

	#include "addVector.h"

	std::vector<double> addVector(std::vector<double> v1, std::vector<double> v2) {
		std::vector<double> sum;
		for( int i =0; i < v1.size(); i++) {
			sum.push_back(v1[i] + v2[i]);
		}
		return sum;
	}
The following is the code for main.cpp
	#include <iostream>
	#include <chrono>
	#include <random>

	#include "libMath5610.h"

	std::vector<double> addVector(std::vector<double> v1, std::vector<double> v2);

	int main(int argc, char *argv[]) {
		
		typedef std::chrono::high_resolution_clock clock;
		clock::time_point begining = clock::now();

		std::vector<double> v1, v2, sum;

		int n = std::stoi(argv[1]);
		for (int i = 0; i < n; i++) {
			std::uniform_real_distribution<double> unif(1, 0);
			clock::duration d = clock::now() - begining;
			std::default_random_engine re (d.count());
			v2.push_back(unif(re));
			v1.push_back(unif(re));
		}

		sum = addVector(v1, v2);

		for (int i =0; i < n; i++) {
			std::cout << v1[i] << " + " << v2[i] << " = "<<  sum[i] << std::endl;
		}
		return 0;
	}

**Last Modified:** 1/11/2019

