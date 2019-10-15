# Task 5:
Task: Implement a method that returns the ∞-norm of a given square matrix. Add an entry to your software manual that documents the method.
# Proof

**Routine Name:**          infNormMatrix

**Author:** Jer Moore

**Language:** C++, can be compiled with the g++ compiler **cmake** and the **make** commands, The version here was g++ (GCC) 6.4.0.

For example, the following will compile the small demonstration function

    g++ -c infNormMatrix.cpp
	ar rcv infNormMatrix.a infNormMatrix.o
	mkdir build
	cd build
	cmake ..
	make

  To make Code reuse easier later there's a ../lib/ folder with the source code for every routine that can be compiled with the following.

      cd ../lib
      g++ -c *.cpp
      ar rcv Math5610.a *.o

**Description/Purpose:** Computes the ∞ matrix norm of a square matrix.

**Input:** A square matrix

**Output:** The induced ∞ matrix norm of the provided matrix


**Usage/Example:**

		jer@thismachinelaughsatfascists:~/Workspace/math5610/hw3/task5/build$ ./Task5 4
		0.440333 0.500298 0.624202 0.115787 
		0.500298 0.28918 0.703094 0.822306 
		0.624202 0.703094 0.278075 0.238816 
		0.115787 0.822306 0.238816 0.75993 
		2.31488

**Implementation/Code:** The following is the code for .h
		
		#ifndef _INFNORMATRIX_H_
		#define _INFNORMATRIX_H_
		#include <vector>

		double infNormMatrix(std::vector<std::vector<double>>);
		#endif


The following is the code for .cpp

		#include <cstdlib>

		#include "infNormMatrix.h" 
		double infNormMatrix(std::vector<std::vector<double>> x) {
			double maxRow;
			for( int i = 0; i < x.size(); i++) {
				double sum =0;
				for( int j = 0; j < x.size(); j++) {
					sum += x[j][i];
				}
				if(sum > maxRow) {
					maxRow= sum;
				}
			}
			return maxRow;
		}



The following is the code for main.cpp

		#include <iostream>
		#include <chrono>
		#include <random>

		std::vector<std::vector<double>> generateSymetricNbyNMatrix(int);
		double infNormMatrix(std::vector<std::vector<double>> x);

		int main(int argc, char *argv[]) {

			std::vector<std::vector<double>> Matrix = generateSymetricNbyNMatrix(std::stoi(argv[1]));
			for(int i =0; i < Matrix.size(); i++){
				for(int j =0; j < Matrix.size(); j++){
					std::cout << Matrix[i][j] << " ";
				}
				std::cout << std::endl;
			}
				
			std::cout << infNormMatrix(Matrix) << std::endl;
			
			return 0;
		}



**Last Modified:** 04/10/2019


