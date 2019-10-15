# Task 4:

# Proof

**Routine Name:**        solveDiagonal  

**Author:** Jer Moore

**Language:** C++, can be compiled with the g++ compiler **cmake** and the **make** commands, The version here was g++ (GCC) 6.4.0.

**Description/Purpose:**
 
**Input:**  a diagonal matrix A, and a vector b

**Output:** the vector x such that Ax = b
 

**Usage/Example:**

	jer@thismachinelaughsatfascists:~/Workspace/math5610/hw4/task4/build$ ./Task4 5
	0.963338  0  0  0  0 
	 0 0.406093  0  0  0 
	 0  0 0.990645  0  0 
	 0  0  0 0.278745  0 
	 0  0  0  0 0.445037 
	 is the origininal matrix
	0.596907
	0.931053
	0.797607
	0.787879
	0.822632
	 is the target values
	0.619623
	2.29271
	0.805139
	2.82652
	1.84846
	 is the solution 
	jer@thismachinelaughsatfascists:~/Workspace/math5610/hw4/task4/build$ ./Task4 10
	0.963338  0  0  0  0  0  0  0  0  0 
	 0 0.60279  0  0  0  0  0  0  0  0 
	 0  0 0.951199  0  0  0  0  0  0  0 
	 0  0  0 0.263105  0  0  0  0  0  0 
	 0  0  0  0 0.481698  0  0  0  0  0 
	 0  0  0  0  0 0.706548  0  0  0  0 
	 0  0  0  0  0  0 0.372057  0  0  0 
	 0  0  0  0  0  0  0 0.563718  0  0 
	 0  0  0  0  0  0  0  0 0.097689  0 
	 0  0  0  0  0  0  0  0  0 0.322539 
	 is the origininal matrix
	0.436528
	0.249215
	0.247307
	0.96981
	0.45148
	0.700134
	0.497181
	0.688842
	0.669729
	0.552985
	 is the target values
	0.453141
	0.413436
	0.259995
	3.68602
	0.937266
	0.990922
	1.3363
	1.22196
	6.85572
	1.71448
	 is the solution 


**Implementation/Code:** The following is the code for .h


	#ifndef _SOLVEDIAGONAL_H_
	#define _SOLVEDIAGONAL_H_

	#include <vector>

	std::vector<double> solveDiagonal(std::vector<double>, std::vector<double>); 

	#endif

The following is the code for .cpp
	
	#include "solveDiagonal.h"

	//Task: Implement a method that will compute the solution of a square linear system of equations where the coefficient matrix is a diagonal matrix.
	std::vector<double> solveDiagonal(std::vector<double> matrix, std::vector<double> b) {
		
		std::vector<double> x;

		for (int i = 0; i < matrix.size(); i++) {
			x.push_back(b[i]/matrix[i]);
		}

		return x;
	}



The following is the code for main.cpp


	#include <iostream>
	#include <random>
	#include <vector>
	#include <chrono>

	std::vector<double> solveDiagonal(std::vector<double> matrix, std::vector<double> b);

	int main(int argc, char *argv[]) {


		std::vector<double> diagonalMatrix;

		std::vector<double> b;
		std::vector<double> x;

		int n = std::stoi(argv[1]);

		typedef std::chrono::high_resolution_clock clock;
		clock::time_point begining = clock::now();

		std::vector<std::vector<double>> matrix;

		for (int i =0; i < n; i++) {
			std::uniform_real_distribution<double> unif(1, 0);
			clock::duration d = clock::now() - begining;
			std::default_random_engine re (d.count());
			double value = unif(re);
			diagonalMatrix.push_back(value);
		}

		for (int i =0; i < n; i++) {
			std::uniform_real_distribution<double> unif(1, 0);
			clock::duration d = clock::now() - begining;
			std::default_random_engine re (d.count());
			double value = unif(re);
			b.push_back(value);
		}
		
		for (int i = 0; i < n; i++) {
			for (int j = 0; j < n; j++) {
				if( i == j) {
					std::cout << diagonalMatrix[i] << " ";
				}
				else {
					std::cout << " 0 ";
				}
			}
			std::cout << std::endl;
		}
		
		std::cout << " is the origininal matrix" << std::endl;
		
		for (int i = 0; i < n; i++) {
			std::cout << b[i] << std::endl;
		}

		std::cout << " is the target values" << std::endl;
		
		x = solveDiagonal(diagonalMatrix, b);	
		
		for (int i = 0; i < n; i++) {
			std::cout << x[i] << std::endl;
		}

		std::cout << " is the solution " << std::endl;


		return 0;
	}


**Last Modified:** 04/27/2019
