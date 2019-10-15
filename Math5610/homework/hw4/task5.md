# Task 5:

# Proof

**Routine Name:**         solveUpperTriangular 

**Author:** Jer Moore

**Language:** C++, can be compiled with the g++ compiler **cmake** and the **make** commands, The version here was g++ (GCC) 6.4.0.

**Description/Purpose:** finds x in Ax = b where a is a upper trangular matrix
 
**Input:** A matrix A and a solution vector b

**Output:** a vector x
 

**Usage/Example:**

	jer@thismachinelaughsatfascists:~/Workspace/math5610/hw4/task5/build$ ./Task5 4
	0.343934 0.409624 0.611888 0.655682 
	0 0.157496 0.0697521 0.113546 
	0 0 0.212238 0.308334 
	0 0 0 0.739265 
	Is the original matrix, A
	0.87159
	0.14405
	0.128065
	0.186624
	Is the target values, b
	0.884154
	0.627816
	0.236658
	0.252445
	Is the solution, x
	0.87159
	0.14405
	0.128065
	0.186624
	Is Ax
	The error between Ax and b  is: 0.463967
	jer@thismachinelaughsatfascists:~/Workspace/math5610/hw4/task5/build$ ./Task5 3
	0.600094 0.0831692 0.0220137 
	0 0.868923 0.544692 
	0 0 0.409682 
	Is the original matrix, A
	0.874718
	0.265859
	0.108608
	Is the target values, b
	1.42854
	0.139782
	0.265103
	Is the solution, x
	0.874718
	0.265859
	0.108608
	Is Ax
	The error between Ax and b  is: 1.28293



**Implementation/Code:** The following is the code for .h

		
	#ifndef _SOLVEUPPERTRIANGULAR_H_
	#define _SOLVEUPPERTRIANGULAR_H_

	#include <vector>

	std::vector<double> solveUpperTriangular(std::vector<std::vector<double>>, std::vector<double>); 

	#endif

The following is the code for .cpp

	#include "solveUpperTriangular.h"

	//Task: Implement a method that will compute the solution of a square linear system of equations where the coefficient matrix is a upper triangular matrix.
	std::vector<double> solveUpperTriangular(std::vector<std::vector<double>> matrix, std::vector<double> b) {
		
		std::vector<double> x;

		for (int i = 0; i < b.size(); i++) {
			x.push_back(0.0);
		}

		for (int k = b.size()-1; k >= 0; k--) {

			x[k] = b[k];

			for ( int j = k+1; j < matrix.size(); j++) {
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

	std::vector<double> solveUpperTriangular(std::vector<std::vector<double>> matrix, std::vector<double> b);

	int main(int argc, char *argv[]) {

		std::vector<double> b;
		std::vector<double> x;

		int n = std::stoi(argv[1]);
		
		std::vector<std::vector<double>> upperTriangularMatrix = generateSymetricNbyNMatrix(n);
		
		for (int i = 0; i < n; i++) {
			for (int j = 0; j < n; j++) {
				if( i > j) {
					 upperTriangularMatrix[i][j] = 0.0;
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
				std::cout << upperTriangularMatrix[i][j] << " ";
			}
			std::cout << std::endl;
		}
		
		std::cout << "Is the original matrix, A" << std::endl;
		
		for (int i = 0; i < n; i++) {
			std::cout << b[i] << std::endl;
		}

		std::cout << "Is the target values, b" << std::endl;
		
		x = solveUpperTriangular(upperTriangularMatrix, b);	
		
		for (int i = 0; i < n; i++) {
			std::cout << x[i] << std::endl;
		}

		std::cout << "Is the solution, x" << std::endl;
		
		std::vector<double> approxB = matrixVectorProduct(upperTriangularMatrix, x);

		for (int i = 0; i < n; i++) {
			std::cout << approxB[i] << std::endl;
		}

		std::cout << "Is Ax" << std::endl;

		std::cout << "The error between Ax and b  is: " << 	absError2NormVector(approxB, x) << std::endl;

		return 0;
	}


**Last Modified:** 04/28/2019


