# Task 7: 
Task: Implement a method that will compute the 1-norm of an arbitrary vector will real number entries. Add an entry to your for the method you create
# Proof

**Routine Name:**          oneNormVector 

**Author:** Jer Moore

**Language:** C++, can be compiled with the g++ compiler **cmake** and the **make** commands, The version here was g++ (GCC) 6.4.0.

For example, the following will compile the small demonstration function as well as the routine oneNormVector

    g++ -c oneNormVector.cpp
	ar rcv oneNormVector.a oneNormVector.o
	mkdir build
	cd build
	cmake ..
	make



**Description/Purpose:** computes the one norm vector for a arbitrary vector

**Input:** a vector of real values 

**Output:** a double representing the one norm of the input vector

**Usage/Example:**

Output from the lines above:

**Implementation/Code:** The following is the code for oneNormVector.h
	#ifndef _ONENORMVECTOR_H_
	#define _ONENORMVECTOR_H_

	#include <vector>
	#include <math.h>
	double oneNormVector(std::vector<double> v1);
	#endif

The following is the code for oneNormVector.cpp
	// Task: Implement a method that will compute the 1-norm of an arbitrary vector will real number entries. Add an entry to your for the method you create
	#include "oneNormVector.h"

	double oneNormVector(std::vector<double> v1) {
		double sum = 0.0;
		for( int i = 0; i < v1.size(); i++) {
			sum += abs(v1[i]);
		}
		return sum;
	}

The following is the code for main.cpp
	#include <iostream>
	#include <chrono>
	#include <random>

	double oneNormVector(std::vector<double> v1);


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
		sum = oneNormVector(v1);
		
		for (int i =0; i < n; i++) {
			std::cout << "abs(" << v1[i] << ") +";
		}
		std::cout << "0 = " << sum << std::endl;
		return 0;
	}

**Last Modified:** 1/11/2019


