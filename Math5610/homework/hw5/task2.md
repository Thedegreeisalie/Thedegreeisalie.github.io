# Task 2:

# Proof

**Routine Name:**      LUFactorization 

**Author:** Jer Moore

**Language:** C++, can be compiled with the g++ compiler **cmake** and the **make** commands, The version here was g++ (GCC) 6.4.0.

**Description/Purpose:** LU Factorization a way to represent Gaussian elimination in the form of matrices.
 
**Input:** A matrix A

**Output:** A matrix L and U such that L.U = A

**Usage/Example:** 

	jer@thismachinelaughsatfascists:~/Workspace/math5610/hw5/task2/build$ ./Task2 3
	0.0464489 0.754719 0.054987
	0.754719 0.301202 0.89148
	0.054987 0.89148 0.200257
	Is the original matrix, A
	1 0 0
	16.2484 1 0
	1.18382 0.000164653 1
	Is the reduced matrix L




**Implementation/Code:** The following is the code for .h

	#ifndef _LUFACTORIZATION_H_
	#define _LUFACTORIZATION_H_

	#include <vector>

	std::vector<std::vector<double>> LUFactorization(std::vector<std::vector<double>>); 

	#endif

The following is the code for .cpp

	#include "LUFactorization.h"

	std::vector<std::vector<double>> LUFactorization(std::vector<std::vector<double>> matrix) {
		
		int n = matrix.front().size();
		
		std::vector<std::vector<double>> l;

		for (int k = 0; k < n; k++) {
			std::vector<double> row;
			for (int i = 0; i < n; i++) {
				if(i != k) {
					row.push_back(0.0);
				}
				else {
					row.push_back(1.0);
				}
			}
			l.push_back(row);
		}

		for (int k = 0; k < n-1; k++) {
			for (int i = k+1; i < n; i++) {
				l[i][k] = (matrix[i][k] / matrix[k][k]);
				for (int j = k; j < n; j++) {
					matrix[i][j] =  matrix[i][j] - (l[i][k] * matrix[k][j]);
				}
				matrix[i][k] = l[i][k];
			}
		}

		return l;
	}


The following is the code for main.cpp


	#include <iostream>
	#include <random>
	#include <vector>
	#include <chrono>

	std::vector<std::vector<double>> generateSymetricNbyNMatrix(int);
	std::vector<std::vector<double>> LUFactorization(std::vector<std::vector<double>> matrix);

	int main(int argc, char *argv[]) {

		int n = std::stoi(argv[1]);
		
		std::vector<std::vector<double>> Matrix = generateSymetricNbyNMatrix(n);
		std::vector<std::vector<double>> lu = LUFactorization(Matrix);
		
		for (int i = 0; i < n; i++) {
			for (int j = 0; j < n; j++) {
				std::cout << Matrix[i][j] << " ";
			}
			std::cout << std::endl;
		}
		
		std::cout << "Is the original matrix, A" << std::endl;


		for (int i = 0; i < n; i++) {
			for (int j = 0; j < n; j++) {
				std::cout << lu[i][j] << " ";
			}
			std::cout << std::endl;
		}
		
		std::cout << "Is the reduced matrix L" << std::endl;
		
		return 0;
	}

**Last Modified:** 04/28/2019

