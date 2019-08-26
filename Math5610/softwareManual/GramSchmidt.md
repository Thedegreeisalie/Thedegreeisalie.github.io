**Routine Name:**    GramSchmidt 

**Author:** Jer Moore

**Language:** C++, can be compiled with the g++ compiler **cmake** and the **make** commands, The version here was g++ (GCC) 6.4.0.

**Description/Purpose:**  forms a orthonormal basis for a matrix then gives you that matrix
 
**Input:** A matrix with linearly independant columns

**Output:** A triangular matrix Q such that  Q^TQ = I where I is the identity matrix

**Usage/Example:**  

	jer@thismachinelaughsatfascists:~/Workspace/math5610/hw5/GramSchmidt/build$ ./GramSchmidt 3
	0.124866 0.0486737 0.370567
	0.778964 0.724059 0.561791
	0.750411 0.994046 0.790452
	 Is the Matrix
	0.316873 0.12352 0.940391
	0.603953 0.738212 -0.300471
	-0.731322 0.663163 0.159319
	 Is the Q
	1 2.77556e-16 2.22045e-16
	2.77556e-16 1 -2.63678e-16
	2.22045e-16 -2.63678e-16 1
	 Is the Q^tQ
	jer@thismachinelaughsatfascists:~/Workspace/math5610/hw5/GramSchmidt/build$ ./GramSchmidt 2
	0.229263 0.996569 
	0.415695 0.39981 
	 Is the Matrix 
	0.224196 0.974544 
	0.974544 -0.224196 
	 Is the Q
	1 -3.33067e-16 
	-3.33067e-16 1 
	 Is the Q^tQ
	jer@thismachinelaughsatfascists:~/Workspace/math5610/hw5/GramSchmidt/build$ ./GramSchmidt 2
	0.635456 0.190259 
	0.393781 0.49231 
	 Is the Matrix 
	0.957983 0.286825 
	-0.286825 0.957983 
	 Is the Q
	1 5.55112e-17 
	5.55112e-17 1 
	 Is the Q^tQ


**Implementation/Code:** The following is the code for .h
	
	#ifndef _GRAMSCHMIDT_H_
	#define _GRAMSCHMIDT_H_

	#include <vector>

	std::vector<std::vector<double>> GramSchmidt(std::vector<std::vector<double>>);
	double dotVector(std::vector<double>, std::vector<double>);
	double twoNormVector(std::vector<double>);

	#endif


The following is the code for .cpp

	#include "GramSchmidt.h"

	std::vector<std::vector<double>> GramSchmidt(std::vector<std::vector<double>> matrix) {
		
		int n = matrix.front().size();

		std::vector<std::vector<double>> q;
		std::vector<std::vector<double>> r;

		for(int j =0; j < n; j++) {
			std::vector<double> row;
			for(int j =0; j < n; j++) {
				row.push_back(0.0);
			}
			q.push_back(row);
			r.push_back(row);
		}
		
		for(int j =0; j < n; j++) {
			q[j] = matrix[j];
			for(int i = 0; i < j; i++) {
				r[i][j] = dotVector(q[j], q[i]);
				for (int k =0; k < n; k++) {
					q[j][k] = q[j][k] - r[i][j]*q[i][k];
				}	
			}
			r[j][j] = twoNormVector(q[j]);
			for (int k = 0; k < n; k++) {
				q[j][k] = q[j][k] / r[j][j];
			}	
		}

		return q;
	}

The following is the code for main.cpp

	#include <iostream>
	#include <vector>

	std::vector<std::vector<double>> generateNbyMmatrix(int,int);
	std::vector<std::vector<double>> GramSchmidt(std::vector<std::vector<double>>);
	std::vector<std::vector<double>> matrixProduct(std::vector<std::vector<double>>, std::vector<std::vector<double>>);
	std::vector<std::vector<double>> transpose(std::vector<std::vector<double>>);


	int main(int argc, char *argv[]) {

		int n = std::stoi(argv[1]);
		
		std::vector<std::vector<double>> Matrix = generateNbyMmatrix(n,n);
		std::vector<std::vector<double>> Q = GramSchmidt(Matrix);
		
		for(int i = 0; i < n; i++) {
			for(int j = 0; j < n; j++) {
				std::cout << Matrix[i][j] << " ";
			}
			std::cout << std::endl;
		}
		std::cout << " Is the Matrix " << std::endl;
		for(int i = 0; i < n; i++) {
			for(int j = 0; j < n; j++) {
				std::cout << Q[i][j] << " ";
			}
			std::cout << std::endl;
		}
		std::cout << " Is the Q" << std::endl;
		
		std::vector<std::vector<double>> QTQ = matrixProduct(transpose(Q), Q);
		
		for(int i = 0; i < n; i++) {
			for(int j = 0; j < n; j++) {
				std::cout << QTQ[i][j] << " ";
			}
			std::cout << std::endl;
		}
		std::cout << " Is the Q^tQ" << std::endl;
		return 0;
	}

**Last Modified:** 06/06/2019

