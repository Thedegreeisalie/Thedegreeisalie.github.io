# Task 9:

# Proof

**Routine Name:**       generateDiagDom

**Author:** Jer Moore

**Language:** C++, can be compiled with the g++ compiler **cmake** and the **make** commands, The version here was g++ (GCC) 6.4.0.

**Description/Purpose:** generates a matrix such that the element on the diagonal is the largest of the column
 
**Input:**  an integer n

**Output:** a matrix with real values such that the largest value is on the diagonal
 

**Usage/Example:**

	jer@thismachinelaughsatfascists:~/Workspace/math5610/hw3/task9/build$ ./Task9 4
	0.972437 0.492332 0.772956 0.189466
	0.698068 0.954543 0.263665 0.652022
	0.474094 0.651678 0.908497 0.0857369
	0.296166 0.25672 0.605288 0.776615



**Implementation/Code:** The following is the code for .h

		

	#ifndef _GENERATEDIAGDOM_H_
	#define _GENERATEDIAGDOM_H_

	#include <vector>
	#include <chrono>
	#include <random>
	std::vector<std::vector<double>> generateDiagDom(int n); 
	#endif

The following is the code for .cpp

	#include "generateDiagDom.h"

	std::vector<std::vector<double>> generateDiagDom(int n){ 
		typedef std::chrono::high_resolution_clock clock;
		clock::time_point begining = clock::now();

		std::vector<std::vector<double> > matrix;
		for (int i = 0; i < n; i++) {
			std::vector<double> Row;
			// allocate space
			for (int j = 0; j < n; ++j) {
				Row.push_back(0.0);
			}
			matrix.push_back(Row);
		}

		for (int i =0; i < n; i++) {
			for(int j =0; j < n; j++) {
				std::uniform_real_distribution<double> unif(1, 0);
				clock::duration d = clock::now() - begining;
				std::default_random_engine re (d.count());
				double value = unif(re);
				matrix[i][j] = value;
			}
		}

		for(int i = 0; i < n; i++) {
			double max = 0.0;
			int tmpIndex = 0;
			for(int j = 0; j < n; j++) {
				if(std::abs(max) < std::abs(matrix[i][j])) {
					max = matrix[i][j];
					tmpIndex = j;
				}	
			}
			if(max > matrix[i][i]) {
				double tmpDouble = matrix[i][i];
				matrix[i][i] = max;
				matrix[i][tmpIndex] = tmpDouble;
			}
		}

		return matrix;
	}


The following is the code for main.cpp



	#include <iostream>
	#include <vector>

	std::vector<std::vector<double>> generateDiagDom(int n);

	int main(int argc, char *argv[]) {
		

		std::vector<std::vector<double>> nByMMatrix;
		int n = std::stoi(argv[1]);
		nByMMatrix = generateDiagDom(n);
		for (int i = 0; i < n; i++) {
			for (int j = 0; j < n; j++) {
					std::cout << nByMMatrix[i][j] << " ";
			}
			std::cout << std::endl;
		}
		return 0;
	}


**Last Modified:** 04/28/2019


