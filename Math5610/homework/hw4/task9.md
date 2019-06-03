# Task 9:

# Proof

**Routine Name:**         generateSymDiagDom 

**Author:** Jer Moore

**Language:** C++, can be compiled with the g++ compiler **cmake** and the **make** commands, The version here was g++ (GCC) 6.4.0.

**Description/Purpose:** Diagonally dominant matrices are matrices such that for every row the element on the diagonal is the element with the most magnitude. This Routine generates them.
 
**Input:**  An integer n

**Output:** A symetric diagonally dominant Matrix that is n by n 
 

**Usage/Example:**

	jer@thismachinelaughsatfascists:~/Workspace/math5610/hw4/task9/build$ ./Task9 6
	0.83043 0.0718944 0.263397 0.629356 0.80991 0.120351
	0.0718944 0.646875 0.258361 0.282008 0.0410161 0.0377305
	0.263397 0.258361 0.850418 0.0661985 0.272122 0.779475
	0.629356 0.282008 0.0661985 0.845382 0.108615 0.113464
	0.80991 0.0410161 0.272122 0.108615 0.97204 0.366496
	0.120351 0.0377305 0.779475 0.113464 0.366496 0.992215



**Implementation/Code:** The following is the code for .h

		
	#ifndef _GENERATESYMDIAGDOM_H_
	#define _GENERATESYMDIAGDOM_H_

	#include <vector>
	#include <chrono>
	#include <random>
	std::vector<std::vector<double>> generateSymetricNbyNMatrix(int);
	std::vector<std::vector<double>> generateSymDiagDom(int n); 
	#endif

The following is the code for .cpp


	#include "generateSymDiagDom.h"

	std::vector<std::vector<double>> generateSymDiagDom(int n){ 

		std::vector<std::vector<double>> matrix = generateSymetricNbyNMatrix(n);

		for(int i = 0; i < n; i++) {
			double max = 0.0;
			int tmpIndex = 0;
			for(int j = 0; j < n; j++) {
				if(std::abs(max) < std::abs(matrix[j][i])) {
					max = matrix[j][i];
					tmpIndex = j;
				}	
			}
			if(max > matrix[i][i]) {
				double tmpDouble = matrix[i][i];
				matrix[i][i] = max;
				matrix[tmpIndex][i] = tmpDouble;
				matrix[i][tmpIndex] = tmpDouble;
			}
		}

		return matrix;
	}

The following is the code for main.cpp



	#include <iostream>
	#include <vector>

	std::vector<std::vector<double>> generateSymDiagDom(int n);

	std::vector<std::vector<double>> generateSymetricNbyNMatrix(int ,int);

	int main(int argc, char *argv[]) {
		

		std::vector<std::vector<double>> nByMMatrix;
		int n = std::stoi(argv[1]);
		nByMMatrix = generateSymDiagDom(n);
		for (int i = 0; i < n; i++) {
			for (int j = 0; j < n; j++) {
					std::cout << nByMMatrix[i][j] << " ";
			}
			std::cout << std::endl;
		}
		return 0;
	}



**Last Modified:** 04/27/2019

