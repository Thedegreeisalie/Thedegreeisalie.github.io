# Task 8:

# Proof

**Routine Name:**          rowEchelonSolution

**Author:** Jer Moore

**Language:** C++, can be compiled with the g++ compiler **cmake** and the **make** commands, The version here was g++ (GCC) 6.4.0.

**Description/Purpose:** Performs gaussian elimination and backsubstitution to find a solution to the system of linear equations
 
**Input:**  A matrix A, and a Vector b

**Output:** A vector x such that Ax=b
 

**Usage/Example:**

	jer@thismachinelaughsatfascists:~/Workspace/math5610/hw4/task8/build$ ./Task8 3
	0.0263615 0.758781 0.981378 
	0.758781 0.569904 0.500928 
	0.981378 0.500928 0.573563 
	Is the original matrix, A
	-0.982659
	-27.5522
	21.9346
	Is the output vector x


**Implementation/Code:** The following is the code for .h

		
	#ifndef _ROWECHELONSOLUTION_H_
	#define _ROWECHELONSOLUTION_H_

	#include <vector>


	std::vector<double> solveUpperTriangular(std::vector<std::vector<double>>, std::vector<double>); 

	std::vector<double> rowEchelonSolution(std::vector<std::vector<double>>, std::vector<double>); 

	#endif

The following is the code for .cpp

	#include "rowEchelonSolution.h"

	//Task: Using previous methods you have created, write a code that will solve a square linear system of equations using Gaussian elimination (elementary row operations) to reduce the augmented coefficient matrix to row echelon form and then apply backsubstitution to determine an approximate solution for the linear system
	std::vector<double> rowEchelonSolution(std::vector<std::vector<double>> matrix, std::vector<double> b) {
		
		int n = matrix.front().size();

		for (int k = 0; k < n-1; k++) {
			for (int i = k+1; i < n; i++) {
				double factor = matrix[i][k] / matrix[k][k];
				for (int j = k; j < n; j++) {
					matrix[i][j] =  matrix[i][j] - (factor * matrix[k][j]);
				}
				b[i] = b[i] - factor*b[i];
			}
		}
		
		std::vector<double> x;
		x = solveUpperTriangular(matrix, b);

		return x;
	}



The following is the code for main.cpp

	#include <iostream>
	#include <random>
	#include <vector>
	#include <chrono>

	std::vector<std::vector<double>> generateSymetricNbyNMatrix(int);

	std::vector<double> rowEchelonSolution(std::vector<std::vector<double>> matrix, std::vector<double> b);

	int main(int argc, char *argv[]) {

		int n = std::stoi(argv[1]);

		std::vector<double> b;
		std::vector<double> x;
		
		typedef std::chrono::high_resolution_clock clock;
		clock::time_point begining = clock::now();

		for (int i =0; i < n; i++) {
			std::uniform_real_distribution<double> unif(1, 0);
			clock::duration d = clock::now() - begining;
			std::default_random_engine re (d.count());
			double value = unif(re);
			b.push_back(value);
		}

		std::vector<std::vector<double>> Matrix = generateSymetricNbyNMatrix(n);

		for (int i = 0; i < n; i++) {
			for (int j = 0; j < n; j++) {
				std::cout << Matrix[i][j] << " ";
			}
			std::cout << std::endl;
		}
		
		std::cout << "Is the original matrix, A" << std::endl;
		
		x = rowEchelonSolution(Matrix, b);

		for (int i = 0; i < n; i++) {
			std::cout << x[i] << std::endl;
		}

		std::cout << "Is the output vector x"  << std::endl;
		
		return 0;
	}


**Last Modified:** 04/28/2019



