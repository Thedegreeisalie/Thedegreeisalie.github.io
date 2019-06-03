**Routine Name:**    NaturalEquations 

**Author:** Jer Moore

**Language:** C++, can be compiled with the g++ compiler **cmake** and the **make** commands, The version here was g++ (GCC) 6.4.0.

**Description/Purpose:** 
 
**Input:** a matrix A and a vector b 

**Output:** A vector x such that Ax = b 

**Usage/Example:** 
 
	jer@thismachinelaughsatfascists:~/Workspace/math5610/hw5/task6/build$ ./Task6 4
	0.797047 0.797047
	0.888795 0.888795
	0.590622 0.590622
	0.733108 0.733108

**Implementation/Code:** The following is the code for .h

	#ifndef _NATURALEQUATIONS_H_
	#define _NATURALEQUATIONS_H_

	#include <vector>
	#include <math.h>

	std::vector<double> NaturalEquations(std::vector<std::vector<double>>, std::vector<double>); 
	std::vector<std::vector<double>> CholeskyFactorization(std::vector<std::vector<double>>); 
	std::vector<double> solveLowerTriangular(std::vector<std::vector<double>>, std::vector<double>);
	std::vector<double> solveUpperTriangular(std::vector<std::vector<double>>, std::vector<double>);
	std::vector<double> matrixVectorProduct(std::vector<std::vector<double>>, std::vector<double>);
	std::vector<std::vector<double>> transpose(std::vector<std::vector<double>>);
	std::vector<std::vector<double>> matrixProduct(std::vector<std::vector<double>>, std::vector<std::vector<double>>);

	#endif

The following is the code for .cpp


	#include "NaturalEquations.h"

	std::vector<double> NaturalEquations(std::vector<std::vector<double>> matrix, std::vector<double> b) {
		
		int n = matrix.front().size();

		std::vector<std::vector<double>> B = matrixProduct(transpose(matrix), matrix);

		std::vector<double> y = matrixVectorProduct(transpose(matrix), b);
		
		std::vector<std::vector<double>> L = CholeskyFactorization(B);	
			
		std::vector<double> z = solveLowerTriangular(L, y);
		
		std::vector<double> x = solveUpperTriangular(transpose(L), z);

		return x;
	}

The following is the code for main.cpp

	#include <iostream>
	#include <random>
	#include <vector>
	#include <chrono>

	std::vector<std::vector<double>> generatePosDef(int);
	std::vector<double> NaturalEquations(std::vector<std::vector<double>> matrix, std::vector<double> b);
	std::vector<double> matrixVectorProduct(std::vector<std::vector<double>>, std::vector<double>);

	int main(int argc, char *argv[]) {

		int n = std::stoi(argv[1]);
		
		std::vector<std::vector<double>> Matrix = generatePosDef(n);

		std::vector<double> b;
		std::vector<double> approxB;
		std::vector<double> x;

		typedef std::chrono::high_resolution_clock clock;
		clock::time_point begining = clock::now();

		for (int i =0; i < n; i++) {
			std::uniform_real_distribution<double> unif(1, 0);
			clock::duration d = clock::now() - begining;
			std::default_random_engine re (d.count());
			double value = unif(re);
			b.push_back(value);
		}

		x = NaturalEquations(Matrix, b);

		approxB = matrixVectorProduct(Matrix, x);

		for(int i =0; i < n; i++) {
			std::cout << b[i] << " " << approxB[i] << std::endl;
		}
		
		return 0;
	}

**Last Modified:** 05/07/2019

