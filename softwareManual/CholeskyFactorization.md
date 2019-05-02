**Routine Name:**     CholeskyFactorization 

**Author:** Jer Moore

**Language:** C++, can be compiled with the g++ compiler **cmake** and the **make** commands, The version here was g++ (GCC) 6.4.0.

**Description/Purpose:** 
 
**Input:** A postive definite matrix A

**Output:**  A lower triangular matrix such that  L^TL = A

**Usage/Example:**  

	jer@thismachinelaughsatfascists:~/Workspace/math5610/hw5/task5/build$ ./Task5 4
	0.9045 0.0555467 0.145648 0.434886 
	0.0409331 0.0418243 0.454702 0.982227 
	0.0176813 0.374409 0.124862 0.721733 
	0.187834 0.391908 0.457642 0.981064 
	Is the original matrix, A
	0.951052 0.0555467 0.145648 0.434886 
	0.0430399 0.19993 0.454702 0.982227 
	0.0185913 1.8687 1.83508 0.721733 
	0.197501 1.91771 -1.70546 -5.64414 
	Is the reduced matrix L



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
			matrix[k][k] = sqrt(abs(matrix[k][k]));
			for (int i = k+1; i < n; i++) {
				matrix[i][k] = matrix[i][k]/matrix[k][k];
			}
			for (int j = k+1; j < n; j++) {
				for (int i = j; i < n; i++) {
					matrix[i][j] = matrix[i][j] - matrix[i][k]*matrix[j][k];
				}
			}
		}

		//matrix[n][n] = sqrt(matrix[n][n]);
		return matrix;
	}

The following is the code for main.cpp

	#include <iostream>
	#include <random>
	#include <vector>
	#include <chrono>

	std::vector<std::vector<double>> generatePosDef(int);
	std::vector<std::vector<double>> CholeskyFactorization(std::vector<std::vector<double>> matrix);

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
				std::cout << lu[i][j] << " ";
			}
			std::cout << std::endl;
		}
		
		std::cout << "Is the reduced matrix L" << std::endl;
		
		return 0;
	}

**Last Modified:** 05/01/2019

