**Routine Name:**     generatePosDef 

**Author:** Jer Moore

**Language:** C++, can be compiled with the g++ compiler **cmake** and the **make** commands, The version here was g++ (GCC) 6.4.0.

**Description/Purpose:**  A symetric positiv definite matrix is a matrix such that for any vector x^tAx > 0 for all vectors x. 
 
**Input:** a integer describing the rows and columns of the matrix to be generated

**Output:**  A positive definite matrix

**Usage/Example:** 

	jer@thismachinelaughsatfascists:~/Workspace/math5610/hw5/task4/build$ ./Task4 5
	0.641957 0.183789 0.629161 0.298991 0.200999 
	0.795162 0.729735 0.484091 0.78717 0.965046 
	0.58186 0.153829 0.765345 0.386559 0.941713 
	0.322788 0.608476 0.96148 0.346922 0.0183385 
	0.822505 0.656672 0.906597 0.495578 0.235557 
	jer@thismachinelaughsatfascists:~/Workspace/math5610/hw5/task4/build$ ./Task4 4
	0.163969 0.00248271 0.443651 0.829571 
	0.61032 0.359906 0.838965 0.672194 
	0.237399 0.613892 0.421501 0.621766 
	0.0960879 0.62596 0.48352 0.406294 



**Implementation/Code:** The following is the code for .h

	#ifndef _GENERATEPOSDEF_H_
	#define _GENERATEPOSDEF_H_

	#include <vector>
	#include <chrono>
	#include <random>

	std::vector<std::vector<double>> generateNbyMmatrix(int, int);
	std::vector<std::vector<double>> matrixProduct(std::vector<std::vector<double>>, std::vector<std::vector<double>>);
	std::vector<std::vector<double>> generatePosDef(int); 

	#endif

The following is the code for .cpp

	#include "generatePosDef.h"

	std::vector<std::vector<double>> generatePosDef(int n) { 

		std::vector<std::vector<double>> matrix = generateNbyMmatrix(n, n);
		std::vector<std::vector<double>> transpose = matrix;

		for(int i =0; i < n; i++){
			for(int j =0; j < n; j++){
				transpose[j][i] = matrix[i][j];
			}
		}

	//	std::vector<std::vector<double>> posDef = matrixProduct(transpose, matrix);

		return transpose;
	}


The following is the code for main.cpp

	#include <iostream>
	#include <random>
	#include <vector>
	#include <chrono>

	std::vector<std::vector<double>> generatePosDef(int);

	int main(int argc, char *argv[]) {

		int n = std::stoi(argv[1]);
		
		std::vector<std::vector<double>> Matrix = generatePosDef(n);

		for (int i = 0; i < n; i++) {
			for (int j = 0; j < n; j++) {
					std::cout << Matrix[i][j] << " ";
			}
			std::cout << std::endl;
		}
		
		return 0;
	}

**Last Modified:** 04/28/2019

