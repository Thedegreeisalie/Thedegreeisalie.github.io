# Task 2: 
 Task: Implement a method/routine that computes and returns the absolute error in the approximation of a number x by another number y. Also create an entry for the method in your software manual. 
# Proof

**Routine Name:**          generateSymetricNbyNMatrix 

**Author:** Jer Moore

**Language:** C++, can be compiled with the g++ compiler **cmake** and the **make** commands, The version here was g++ (GCC) 6.4.0.

For example, the following will compile the small demonstration function as well as the routine generateSymetricNbyNMatrix

    g++ -c generateSymetricNbyNMatrix.cpp
	ar rcv generateSymetricNbyNMatrix.a generateSymetricNbyNMatrix.o
	mkdir build
	cd build
	cmake ..
	make



**Description/Purpose:**  Computes the absolute error betwen two numbers x and y

**Input:**  two numbers x and y

**Output:** the absolute error between them 

**Usage/Example:**

Output from the lines above:

**Implementation/Code:** The following is the code for generateSymetricNbyNMatrix.h
	#ifndef _GENERATESYMETRICNBYNMATRIX_H_
	#define _GENERATESYMETRICNBYNMATRIX_H_

	#include <vector>
	#include <chrono>
	#include <random>
	std::vector<std::vector<double>> generateSymetricNbyNMatrix(int n); 
	#endif

The following is the code for generateSymetricNbyNMatrix.cpp

	// Task:Implement a method that will compute the ∞-norm of an arbitrary vector will real number entries. Add an entry to your for the method you create 
	#include "generateSymetricNbyNMatrix.h"

	std::vector<std::vector<double>> generateSymetricNbyNMatrix(int n){ 
		typedef std::chrono::high_resolution_clock clock;
		clock::time_point begining = clock::now();

		std::vector<std::vector<double> > matrix;
		for (int i = 0; i < n; i++) {
			std::vector<double> Row;
			// allocate space
			for (int j = 0; j < n; ++j) {
				Row.push_back(0.0);
			}
			matrix.push_back(Row);
		}
		for (int i =0; i < n; i++) {
			for(int j =0; j < n; j++) {
				std::uniform_real_distribution<double> unif(1, 0);
				clock::duration d = clock::now() - begining;
				std::default_random_engine re (d.count());
				double value = unif(re);
				matrix[i][j] = value;
				matrix[j][i] = value;
			}
		}
		return matrix;
	}

The following is the code for main.cpp

	#include <iostream>
	#include <vector>

	std::vector<std::vector<double>> generateSymetricNbyNMatrix(int n);

	int main(int argc, char *argv[]) {
		

		std::vector<std::vector<double>> nByMMatrix;
		int n = std::stoi(argv[1]);
		nByMMatrix = generateSymetricNbyNMatrix(n);
		for (int i = 0; i < n; i++) {
			for (int j = 0; j < n; j++) {
					std::cout << nByMMatrix[i][j] << " ";
			}
			std::cout << std::endl;
		}
		return 0;
	}

**Last Modified:** 1/11/2019

