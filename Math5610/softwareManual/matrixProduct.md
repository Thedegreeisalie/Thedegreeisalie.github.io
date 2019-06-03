**Routine Name:**     matrixProduct 

**Author:** Jer Moore

**Language:** C++, can be compiled with the g++ compiler **cmake** and the **make** commands, The version here was g++ (GCC) 6.4.0.

**Description/Purpose:**  While it should be avoided, matrix on matrix multiplication is required for some algorithms
 
**Input:**  2 matrices

**Output:** Their product

**Usage/Example:** 

	jer@thismachinelaughsatfascists:~/Workspace/math5610/hw3/task8/build$ ./Task8 5 3 3 4
	The first matrix is 3 columns by 5
	0.0264199 0.809975 0.345376
	0.250923 0.123147 0.800471
	0.185508 0.936865 0.471621
	0.618228 0.278562 0.958004
	0.100072 0.916947 0.610775
	The second matrix is 4 columns by 3
	0.00490651 0.815453 0.855283 0.601769
	0.593691 0.696419 0.484514 0.560833
	0.620842 0.284458 0.315054 0.301023
	The product matrix should be 3 by 3
	0.695428 0.683871 0.523853
	0.571309 0.518078 0.526468
	0.849921 0.93788 0.761172
	jer@thismachinelaughsatfascists:~/Workspace/math5610/hw3/task8/build$ ./Task8 5 4 4 4
	The first matrix is 4 columns by 5
	0.846451 0.77535 0.570607 0.600688
	0.20712 0.791341 0.391388 0.76839
	0.0923815 0.974326 0.141105 0.0505688
	0.139237 0.273409 0.885657 0.0602324
	0.845354 0.321026 0.465636 0.573246
	The second matrix is 4 columns by 4
	0.134599 0.605552 0.813697 0.229465
	0.784229 0.0106929 0.866062 0.396962
	0.20972 0.615441 0.490161 0.544509
	0.424523 0.452639 0.695977 0.215258
	The product matrix should be 4 by 4
	1.09666 1.14393 2.05801 0.942019
	1.05675 0.722563 1.58051 0.740175
	0.827589 0.176092 1.02336 0.495687
	0.444466 0.659572 0.82612 0.635696




**Implementation/Code:** The following is the code for .h

	#ifndef _MATRIXPRODUCT_H_
	#define _MATRIXPRODUCT_H_

	#include <vector>
	#include <iostream>

	double dotVector(std::vector<double>, std::vector<double>);
	std::vector<std::vector<double>> matrixProduct(std::vector<std::vector<double>> v1, std::vector<std::vector<double>> v2);

	#endif

The following is the code for .cpp


	#include "matrixProduct.h"

	std::vector<std::vector<double>> matrixProduct(std::vector<std::vector<double>> v1, std::vector<std::vector<double>> v2) {

		std::vector<std::vector<double>> product;

		int cols1 = v1.front().size();
		int cols2 = v2.front().size();
		int rows1 = v1.size();
		int rows2 = v2.size();
		
		for (int i = 0; i < cols1; i++) {
			std::vector<double> row;
			for (int j = 0; j < rows2; j++){
				row.push_back(0.0);
			}
			product.push_back(row);
		}

		int prodSize = cols1;
		for(int i = 0; i < cols1; i++) {	
			for(int j = 0; j < rows2; j++){
				std::vector<double> col;
				for (int k = 0; k < rows2; k++){
					col.push_back(v2[k][j]);
				}
				product[i][j] = dotVector(v1[i], col) ; 
			}
		}

		return product;
	}

The following is the code for main.cpp

	#include <vector>
	#include <iostream>

	std::vector<std::vector<double>> genererateNbyMmatrix(int n, int m);
	std::vector<std::vector<double>> matrixProduct(std::vector<std::vector<double>>, std::vector<std::vector<double>>);

	int main(int argc, char *argv[]) {	

		std::vector<std::vector<double>> nByMMatrix1;
		std::vector<std::vector<double>> nByMMatrix2;
		std::vector<std::vector<double>> product;
		
		int m = std::stoi(argv[1]);
		int n = std::stoi(argv[2]);
		int o = std::stoi(argv[3]);
		int p = std::stoi(argv[4]);

		nByMMatrix1	= genererateNbyMmatrix(m, n);

		nByMMatrix2	= genererateNbyMmatrix(o, p);
		
		std::cout << "The first matrix is " << n << " columns by " << m << std::endl;

		for (int i = 0; i < m; i++) {
			for (int j = 0; j < n; j++) {
					std::cout << nByMMatrix1[i][j] << " ";
			}
			std::cout << std::endl;
		}
		
		std::cout << "The second matrix is " << p << " columns by " << o << std::endl;
		
		for (int i = 0; i < o; i++) {
			for (int j = 0; j < p; j++) {
					std::cout << nByMMatrix2[i][j] << " ";
			}
			std::cout << std::endl;
		}
		
		product = matrixProduct(nByMMatrix1, nByMMatrix2);

		std::cout << "The product matrix should be " << n << " by " << o << std::endl;

		for (int i = 0; i < o; i++) {
			for (int j = 0; j < n; j++) {
					std::cout << product[i][j] << " ";
			}
			std::cout << std::endl;
		}

		return 0;
	}

**Last Modified:** 04/28/2019


