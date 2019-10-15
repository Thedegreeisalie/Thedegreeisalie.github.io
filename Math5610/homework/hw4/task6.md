# Task 6:

# Proof

**Routine Name:**         solveLowerTriangular 

**Author:** Jer Moore

**Language:** C++, can be compiled with the g++ compiler **cmake** and the **make** commands, The version here was g++ (GCC) 6.4.0.

**Description/Purpose:** computes x in Ax = where A is a matrix in lower triangular form
 
**Input:**  A matrix A, and a Vector b

**Output:** A vector x
 

**Usage/Example:**

	jer@thismachinelaughsatfascists:~/Workspace/math5610/hw4/task6/build$ ./Task6 4
	0.451725 0 0 0 
	0.641664 0.375116 0 0 
	0.0239513 0.678168 0.384687 0 
	0.166968 0.688083 0.524576 0.94265 
	Is the original matrix, A
	0.927021
	0.448135
	0.503221
	0.594969
	Is the target values, b
	2.05218
	-2.31575
	5.26282
	-0.970667
	Is the solution, x
	0.927021 0.927021
	0.448135 0.448135
	0.503221 0.503221
	0.594969 0.594969
	Is Ax right next to b
	The error between Ax and b  is: 36.5462



**Implementation/Code:** The following is the code for .h

		
	#ifndef _SOLVELOWERTRIANGULAR_H_
	#define _SOLVELOWERTRIANGULAR_H_

	#include <vector>

	std::vector<double> solveLowerTriangular(std::vector<std::vector<double>>, std::vector<double>); 

	#endif

The following is the code for .cpp

	#include "solveLowerTriangular.h"

	//Task: Implement a method that will compute the solution of a square linear system of equations where the coefficient matrix is a lower triangular matrix.
	std::vector<double> solveLowerTriangular(std::vector<std::vector<double>> matrix, std::vector<double> b) {
		
		std::vector<double> x;

		for (int i = 0; i < b.size(); i++) {
			x.push_back(0.0);
		}

		for (int k = 0; k < b.size(); k++) {

			x[k] = b[k];

			for (int j = 0; j < k; j++) {
				x[k] = x[k] - (matrix[k][j]*x[j]);
			}
		
			x[k] = x[k] / matrix[k][k];
		}

		return x;
	}


The following is the code for main.cpp

	#include <iostream>
	#include <random>
	#include <vector>
	#include <chrono>

	std::vector<std::vector<double>> generateSymetricNbyNMatrix(int);
	double absError2NormVector(std::vector<double>, std::vector<double>);
	std::vector<double> matrixVectorProduct(std::vector<std::vector<double>>, std::vector<double>);

	std::vector<double> solveLowerTriangular( std::vector<std::vector<double>> matrix, std::vector<double> b);

	int main(int argc, char *argv[]) {

		std::vector<double> b;
		std::vector<double> x;

		int n = std::stoi(argv[1]);
		
		std::vector<std::vector<double>> lowerTriangularMatrix = generateSymetricNbyNMatrix(n);
		
		for (int i = 0; i < n; i++) {
			for (int j = 0; j < n; j++) {
				if( i < j) {
					 lowerTriangularMatrix[i][j] = 0.0;
				}
			}
		}

		typedef std::chrono::high_resolution_clock clock;
		clock::time_point begining = clock::now();

		for (int i =0; i < n; i++) {
			std::uniform_real_distribution<double> unif(1, 0);
			clock::duration d = clock::now() - begining;
			std::default_random_engine re (d.count());
			double value = unif(re);
			b.push_back(value);
		}
		
		for (int i = 0; i < n; i++) {
			for (int j = 0; j < n; j++) {
				std::cout << lowerTriangularMatrix[i][j] << " ";
			}
			std::cout << std::endl;
		}
		
		std::cout << "Is the original matrix, A" << std::endl;
		
		for (int i = 0; i < n; i++) {
			std::cout << b[i] << std::endl;
		}

		std::cout << "Is the target values, b" << std::endl;
		
		x = solveLowerTriangular(lowerTriangularMatrix, b);	
		
		for (int i = 0; i < n; i++) {
			std::cout << x[i] << std::endl;
		}

		std::cout << "Is the solution, x" << std::endl;
		
		std::vector<double> approxB = matrixVectorProduct(lowerTriangularMatrix, x);

		for (int i = 0; i < n; i++) {
			std::cout << approxB[i] << " " << b[i] << std::endl;
		}

		std::cout << "Is Ax right next to b" << std::endl;

		std::cout << "The error between Ax and b  is: " << 	absError2NormVector(approxB, x) << std::endl;

		return 0;
	}



**Last Modified:** 04/28/2019
