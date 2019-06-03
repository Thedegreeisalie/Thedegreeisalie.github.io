# Task 2:

# Proof

**Routine Name:**       matrixAdd  

**Author:** Jer Moore

**Language:** C++, can be compiled with the g++ compiler **cmake** and the **make** commands, The version here was g++ (GCC) 6.4.0.

**Description/Purpose:**	We often want to find out what happens if we add two matrices with eachther this method does that.
 
**Input:**  Two matrices

**Output:** One matrix
 

**Usage/Example:**

	jer@thismachinelaughsatfascists:~/Workspace/math5610/hw4/task2/build$ ./Task2 3 5
	The first matrix is 5 columns by 3
	0.385253 0.919411 0.311619 0.257484 0.0293105 
	0.0721949 0.935355 0.326241 0.118154 0.105372 
	0.96652 0.586551 0.520785 0.934862 0.479275 
	The second matrix is 5 columns by 3
	0.302183 0.958118 0.134907 0.342514 0.185848 
	0.929902 0.554265 0.199558 0.884714 0.121882 
	0.977541 0.64981 0.579715 0.839393 0.066143 
	The product matrix should be 5 by 3
	0.687436 1.87753 0.446526 0.599998 0.215158 
	1.0021 1.48962 0.525798 1.00287 0.227254 
	1.94406 1.23636 1.1005 1.77425 0.545418 



**Implementation/Code:** The following is the code for .h
	
	#ifndef _MATRIXADD_H_
	#define _MATRIXADD_H_

	#include <vector>
	#include <iostream>

	std::vector<std::vector<double>> matrixAdd(std::vector<std::vector<double>> m1, std::vector<std::vector<double>> m2);

	#endif
		

The following is the code for .cpp

	#include "matrixAdd.h"

	std::vector<std::vector<double>> matrixAdd(std::vector<std::vector<double>> m1, std::vector<std::vector<double>> m2) {

		std::vector<std::vector<double>> product;

		std::vector<double> first = m1.front();

		int cols = first.size();
		int rows = m1.size();
		for(int i = 0; i < rows; i++) {	
			std::vector<double> Row;
			for(int j = 0; j < cols; j++){
				Row.push_back(0.0);
			}
			product.push_back(Row);
		}

		for(int i = 0; i < rows; i++) {	
			for(int j = 0; j < cols; j++){
				product[i][j] = m1[i][j] + m2[i][j] ; 
			}
		}

		return product;
	}



The following is the code for main.cpp

	#include <vector>
	#include <iostream>

	std::vector<std::vector<double>> genererateNbyMmatrix(int n, int m);
	std::vector<std::vector<double>> matrixAdd(std::vector<std::vector<double>>, std::vector<std::vector<double>>);

	int main(int argc, char *argv[]) {	

		std::vector<std::vector<double>> nByMMatrix1;
		std::vector<std::vector<double>> nByMMatrix2;
		std::vector<std::vector<double>> product;
		
		int m = std::stoi(argv[1]);
		int n = std::stoi(argv[2]);

		nByMMatrix1	= genererateNbyMmatrix(m, n);

		nByMMatrix2	= genererateNbyMmatrix(m, n);
		
		std::cout << "The first matrix is " << n << " columns by " << m << std::endl;

		for (int i = 0; i < m; i++) {
			for (int j = 0; j < n; j++) {
					std::cout << nByMMatrix1[i][j] << " ";
			}
			std::cout << std::endl;
		}
		
		std::cout << "The second matrix is " << n << " columns by " << m << std::endl;
		
		for (int i = 0; i < m; i++) {
			for (int j = 0; j < n; j++) {
					std::cout << nByMMatrix2[i][j] << " ";
			}
			std::cout << std::endl;
		}
		
		product = matrixAdd(nByMMatrix1, nByMMatrix2);

		std::cout << "The product matrix should be " << n << " by " << m << std::endl;

		for (int i = 0; i < m; i++) {
			for (int j = 0; j < n; j++) {
					std::cout << product[i][j] << " ";
			}
			std::cout << std::endl;
		}

		return 0;

	}


**Last Modified:** 04/27/2019



