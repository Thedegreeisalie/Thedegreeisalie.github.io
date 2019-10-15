**Routine Name:**     CholeskyFactorization 

**Author:** Jer Moore

**Language:** C++, can be compiled with the g++ compiler **cmake** and the **make** commands, The version here was g++ (GCC) 6.4.0.

**Description/Purpose:** 
 
**Input:** A postive definite matrix A

**Output:**  A lower triangular matrix such that  L^TL = A

**Usage/Example:**  

	jer@thismachinelaughsatfascists:~/Workspace/math5610/hw5/task5/build$ ./Task5 3
	1.17789 0.591352 0.188125 
	0.591352 0.817957 0.338788 
	0.188125 0.338788 0.145332 
	Is the original matrix, A
	1.08531    0.0      0.0   
	0.54487 0.721854    0.0   
	0.173338 0.338491 0.0266393 
	Is the reduced matrix L
	1.17789 0.591352 0.188125 
	0.591352 0.817957 0.338788 
	0.188125 0.338788 0.145332 
	Is the product of LL^T


**Implementation/Code:** The following is the code for .h

	#ifndef _CHOLESKYFACTORIZATION_H_
	#define _CHOLESKYFACTORIZATION_H_

	#include <vector>
	#include <math.h>

	std::vector<std::vector<double>> CholeskyFactorization(std::vector<std::vector<double>>); 

	#endif

The following is the code for .cpp


	#include "CholeskyFactorization.h"

	std::vector<std::vector<double>> CholeskyFactorization(std::vector<std::vector<double>> matrix) {
		
		int n = matrix.front().size();

		for (int k = 0; k < n-1; k++) {
			matrix[k][k] = sqrt(matrix[k][k]);
			for (int i = k+1; i < n; i++) {
				matrix[i][k] = matrix[i][k]/matrix[k][k];
			}
			for (int j = k+1; j < n; j++) {
				for (int i = j; i < n; i++) {
					matrix[i][j] = matrix[i][j] - matrix[i][k]*matrix[j][k];
				}
			}
		}

		matrix[n-1][n-1] = sqrt(abs(matrix[n-1][n-1]));
		
		for (int i = 0; i < n; i++) {
			for (int j = 0; j < n; j++) {
				if(i < j) {
					matrix[i][j] = 0.0;
				}
			}
		}

		return matrix;
	}

The following is the code for main.cpp

	#include <iostream>
	#include <random>
	#include <vector>
	#include <chrono>

	std::vector<std::vector<double>> generatePosDef(int);
	std::vector<std::vector<double>> CholeskyFactorization(std::vector<std::vector<double>> matrix);
	std::vector<std::vector<double>> matrixProduct(std::vector<std::vector<double>>, std::vector<std::vector<double>>);
	std::vector<std::vector<double>> transpose(std::vector<std::vector<double>>);

	int main(int argc, char *argv[]) {

		int n = std::stoi(argv[1]);
		
		std::vector<std::vector<double>> Matrix = generatePosDef(n);
		std::vector<std::vector<double>> lu = CholeskyFactorization(Matrix);
		
		for (int i = 0; i < n; i++) {
			for (int j = 0; j < n; j++) {
				std::cout << Matrix[i][j] << " ";
			}
			std::cout << std::endl;
		}
		
		std::cout << "Is the original matrix, A" << std::endl;


		for (int i = 0; i < n; i++) {
			for (int j = 0; j < n; j++) {
				if(i >= j ) {
					std::cout << lu[i][j] << " ";
				}
				else {
					std::cout << "   0.0   ";
				}
			}
			std::cout << std::endl;
		}
		
		std::cout << "Is the reduced matrix L" << std::endl;

		std::vector<std::vector<double>> A = matrixProduct(lu, transpose(lu) );

		for (int i = 0; i < n; i++) {
			for (int j = 0; j < n; j++) {
				std::cout << A[i][j] << " ";
			}
			std::cout << std::endl;
		}
		std::cout << "Is the product of LL^T" << std::endl;
		
		return 0;
	}
**Last Modified:** 05/07/2019

