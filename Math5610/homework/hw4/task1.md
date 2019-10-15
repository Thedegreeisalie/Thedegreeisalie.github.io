# Task 1:

# Proof

**Routine Name:**       scaleMatrix   

**Author:** Jer Moore

**Language:** C++, can be compiled with the g++ compiler **cmake** and the **make** commands, The version here was g++ (GCC) 6.4.0.

**Description/Purpose:**	scaling a matrix is a routine operation done sometimes to make certain properties more visible.
 
**Input:**	A matrix and a scalar 

**Output:** A matrix
 

**Usage/Example:** 

	jer@thismachinelaughsatfascists:~/Workspace/math5610/hw4/task1/build$ ./Task1 3 4 5
	0.797679 0.733681 0.305833 0.7668
	0.469531 0.821371 0.0757201 0.551858
	0.85607 0.726322 0.615416 0.772277
	 is the origininal matrix
	3.9884 3.66841 1.52916 3.834
	2.34765 4.10686 0.378601 2.75929
	4.28035 3.63161 3.07708 3.86139
	 is the scaled matrix



**Implementation/Code:** The following is the code for .h

	#ifndef _SCALEMATRIX_H_
	#define _SCALEMATRIX_H_

	#include <vector>
	#include <chrono>
	#include <random>

	std::vector<std::vector<double>> scaleMatrix(std::vector<std::vector<double>>, int); 

	#endif
		

The following is the code for .cpp

	#include "scaleMatrix.h"

	//Task: Write a routine that will generate a random matrix of a given size. That is, input the number of rows and columns and output the matrix created by setting each entry in the matrix to a random value between zero and one. 

	std::vector<std::vector<double>> scaleMatrix(std::vector<std::vector<double>> matrix, int scale) {
		//Have to do some seeding for this to generate some numbers	
		//allocate the space
		std::vector<double> first = matrix.front();
		std::vector<std::vector<double>> product;
		for (int i = 0; i < matrix.size(); i++) {
			std::vector<double> Row;
			for (int j = 0; j < first.size(); j++) {
				Row.push_back(0.0);
			}
			product.push_back(Row);
		}
		//inialize each value
		for (int i = 0; i < matrix.size(); i++) {
			for (int j = 0; j < first.size(); j++) {
				// the number needs to be betwen 0 and 1 do some seeding of the random generator as well
				product[i][j] = matrix[i][j]*scale;
			}
		}
		//return a pointer to the array
		return product;
	}


The following is the code for main.cpp


	#include <iostream>
	#include <random>
	#include <vector>
	#include <chrono>

	std::vector<std::vector<double>> genererateNbyMmatrix(int rows, int cols);
	std::vector<std::vector<double>> scaleMatrix(std::vector<std::vector<double>> matrix, int m );

	int main(int argc, char *argv[]) {


		std::vector<std::vector<double>> nBymMatrix;
		std::vector<std::vector<double>> product;

		int rows = std::stoi(argv[1]);
		int cols = std::stoi(argv[2]);
		int scale = std::stoi(argv[3]);

		nBymMatrix = genererateNbyMmatrix(rows,cols);

		for (int i = 0; i < rows; i++) {
			for (int j = 0; j < cols; j++) {
					std::cout << nBymMatrix[i][j] << " ";
			}
			std::cout << std::endl;
		}
		std::cout << " is the origininal matrix" << std::endl;
		product = scaleMatrix(nBymMatrix, scale);	
		
		for (int i = 0; i < rows; i++) {
			for (int j = 0; j < cols; j++) {
					std::cout << product[i][j] << " ";
			}
			std::cout << std::endl;
		}
		std::cout << " is the scaled matrix" << std::endl;


		return 0;
	}


**Last Modified:** 04/27/2019

