# Task 7:

# Proof

**Routine Name:**         rowEchelon 

**Author:** Jer Moore

**Language:** C++, can be compiled with the g++ compiler **cmake** and the **make** commands, The version here was g++ (GCC) 6.4.0.

**Description/Purpose:** reduces a matrix to it's upper triangular form
 
**Input:**  a matrix A

**Output:** a matrix A but with zeros in the lower triangle of the matrix
 

**Usage/Example:**

	jer@thismachinelaughsatfascists:~/Workspace/math5610/hw4/task7/build$ ./Task7 4
	0.49298 0.25668 0.825936 0.0798137 
	0.25668 0.335571 0.903263 0.759399 
	0.825936 0.903263 0.425941 0.781296 
	0.0798137 0.759399 0.781296 0.197806 
	Is the original matrix, A
	0.49298 0.25668 0.825936 0.0798137 
	0 0.201925 0.473223 0.717843 
	0 0 -2.06685 -1.03473 
	0 0 0 -1.84902 
	Is the reduced matrix



**Implementation/Code:** The following is the code for .h

		
	#ifndef _ROWECHELON_H_
	#define _ROWECHELON_H_

	#include <vector>

	std::vector<std::vector<double>> rowEchelon(std::vector<std::vector<double>>); 

	#endif

The following is the code for .cpp



	#include "rowEchelon.h"

	// Task: Implement a method that will perform elementary row operations on a matrix to take the matrix to row echelon form. The resulting matrix should be upper triangular through the rows. If the matrix is not a square matrix, define an appropriate output for the method tha will return the row echelon form. Add an entry to your software manual documenting the method.
	std::vector<std::vector<double>> rowEchelon(std::vector<std::vector<double>> matrix) {
		
		int n = matrix.front().size();
		//start with the first row
	//	for( int i = 1; i < n; i++) {
	//		double factor = matrix[i][0] / matrix[0][0];
	//		for (int j = 0; j < n; j++) {
	//			matrix[i][j] = matrix[i][j] - (factor * matrix[0][j]);
	//		}
	//	}

		for (int k = 0; k < n-1; k++) {
			for (int i = k+1; i < n; i++) {
				double factor = matrix[i][k] / matrix[k][k];
				for (int j = k; j < n; j++) {
					matrix[i][j] =  matrix[i][j] - (factor * matrix[k][j]);
				}
			//	b[i] = b[i] - factor*b[i];
			}
		}

		return matrix;
	}


The following is the code for main.cpp


	#include <iostream>
	#include <random>
	#include <vector>
	#include <chrono>

	std::vector<std::vector<double>> generateSymetricNbyNMatrix(int);
	double absError2NormVector(std::vector<double>, std::vector<double>);
	std::vector<double> matrixVectorProduct(std::vector<std::vector<double>>, std::vector<double>);

	std::vector<std::vector<double>> rowEchelon(std::vector<std::vector<double>> matrix);

	int main(int argc, char *argv[]) {

		int n = std::stoi(argv[1]);
		
		std::vector<std::vector<double>> Matrix = generateSymetricNbyNMatrix(n);
		std::vector<std::vector<double>> reduced = rowEchelon(Matrix);
		
		for (int i = 0; i < n; i++) {
			for (int j = 0; j < n; j++) {
				std::cout << Matrix[i][j] << " ";
			}
			std::cout << std::endl;
		}
		
		std::cout << "Is the original matrix, A" << std::endl;


		for (int i = 0; i < n; i++) {
			for (int j = 0; j < n; j++) {
				std::cout << reduced[i][j] << " ";
			}
			std::cout << std::endl;
		}
		
		std::cout << "Is the reduced matrix" << std::endl;
		
		return 0;
	}


**Last Modified:** 04/27/2019

