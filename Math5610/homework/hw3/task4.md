# Task 4:
Task: Implement a method that returns the 1-matrix norm of a given square matrix. Add an entry to your software manual that documents the method
# Proof

**Routine Name:**          oneNormMatrix

**Author:** Jer Moore

**Language:** C++, can be compiled with the g++ compiler **cmake** and the **make** commands, The version here was g++ (GCC) 6.4.0.

For example, the following will compile the small demonstration function

    g++ -c oneNormMatrix.cpp
	ar rcv oneNormMatrix.a oneNormMatrix.o
	mkdir build
	cd build
	cmake ..
	make

  To make Code reuse easier later there's a ../lib/ folder with the source code for every routine that can be compiled with the following.

      cd ../lib
      g++ -c *.cpp
      ar rcv Math5610.a *.o

**Description/Purpose:** Computes the 1 matrix norm of a square matrix.

**Input:** A square matrix

**Output:** The induced 1 matrix norm of the provided matrix


**Usage/Example:**

		jer@thismachinelaughsatfascists:~/Workspace/math5610/hw3/task4/build$ ./Task4 3
		0.59665 0.552355 0.670348
		0.552355 0.783461 0.611445
		0.670348 0.611445 0.737946
		2.01974
		jer@thismachinelaughsatfascists:~/Workspace/math5610/hw3/task4/build$ ./Task4 6
		0.515308 0.0897876 0.701273 0.965755 0.62485 0.841722
		0.0897876 0.349391 0.433161 0.223794 0.751352 0.892116
		0.701273 0.433161 0.849671 0.112589 0.535542 0.0709199
		0.965755 0.223794 0.112589 0.633704 0.108959 0.959715
		0.62485 0.751352 0.535542 0.108959 0.00401003 0.0339138
		0.841722 0.892116 0.0709199 0.959715 0.0339138 0.00194412
		3.7387


**Implementation/Code:** The following is the code for .h

		#ifndef _ONENORMATRIX_H_
		#define _ONENORMATRIX_H_
		#include <vector>

		double oneNormMatrix(std::vector<std::vector<double>>);
		#endif

The following is the code for .cpp


		#include <cstdlib>

		#include "oneNormMatrix.h"
		double oneNormMatrix(std::vector<std::vector<double>> x) {
			double maxCol;
			for( int i = 0; i < x.size(); i++) {
				double sum =0;
				for( int j = 0; j < x.size(); j++) {
					sum += x[i][j];
				}
				if(sum > maxCol) {
					maxCol = sum;
				}
			}
			return maxCol;
		}


The following is the code for main.cpp

		#include <iostream>
		#include <chrono>
		#include <random>

		std::vector<std::vector<double>> generateSymetricNbyNMatrix(int);
		double oneNormMatrix(std::vector<std::vector<double>> x);

		int main(int argc, char *argv[]) {

			std::vector<std::vector<double>> Matrix = generateSymetricNbyNMatrix(std::stoi(argv[1]));
			for(int i =0; i < Matrix.size(); i++){
				for(int j =0; j < Matrix.size(); j++){
					std::cout << Matrix[i][j] << " ";
				}
				std::cout << std::endl;
			}

			std::cout << oneNormMatrix(Matrix) << std::endl;

			return 0;
		}



**Last Modified:** 04/10/2019
