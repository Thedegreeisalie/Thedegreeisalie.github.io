# Task 2:
 Task: Implement a method that returns the absolute error in the approximation of one vector by another when the 1-norm is used. Add an entry to your software manual that documents the method.
# Proof

**Routine Name:**          absError1NormVector

**Author:** Jer Moore

**Language:** C++, can be compiled with the g++ compiler **cmake** and the **make** commands, The version here was g++ (GCC) 6.4.0.

For example, the following will compile the small demonstration function as well as the routine absError

    g++ -c absError1NormVector.cpp absError.cpp
	ar rcv absError1NormVector.a absError1NormVector.o
	mkdir build
	cd build
	cmake ..
	make

  To make Code reuse easier later there's a ../lib/ folder with the source code for every routine that can be compiled with the following.

      cd ../lib
      g++ -c *.cpp
      ar rcv Math5610.a *.o

**Description/Purpose:**  Computes the absolute error between two numbers x and y using the 2 norm

**Input:**  Two vectors x and y

**Output:** The absolute error between them

**Usage/Example:**

		jer@thismachinelaughsatfascists:~/Workspace/math5610/hw3/task2/build$ ./Task2 3
		0.982456 0.213557
		0.0704211 0.634759
		0.652715 0.499405
		0.35787


**Implementation/Code:** The following is the code for abserror.h

		#ifndef _ABSERROR1NORMVECTOR_H_
		#define _ABSERROR1NORMVECTOR_H_
		#include <vector>

		double absError(double, double);
		double absError1NormVector(std::vector<double> x, std::vector<double> y);
		#endif

The following is the code for abserror.cpp

		#include <cstdlib>

		#include "absError1NormVector.h"

		double absError1NormVector(std::vector<double> x, std::vector<double> y) {
			double sumx;
			double sumy;
			for( int i =0; i < x.size(); i++) {
				sumx += x[i];
				sumy += y[i];
			}
			return absError(sumx, sumy) ;
		}

The following is the code for main.cpp

		#include <iostream>
		#include <chrono>
		#include <random>


		double absError1NormVector(std::vector<double> x, std::vector<double> y);

		int main(int argc, char *argv[]) {

			typedef std::chrono::high_resolution_clock clock;
			clock::time_point begining = clock::now();

			std::vector<double> v1, v2, sum;

			int n = std::stoi(argv[1]);
			for (int i = 0; i < n; i++) {
				std::uniform_real_distribution<double> unif(1, 0);
				clock::duration d = clock::now() - begining;
				std::default_random_engine re (d.count());
				v2.push_back(unif(re));
				v1.push_back(unif(re));
			}

			std::cout << absError1NormVector(v1, v2) << std::endl;

			return 0;
		}


**Last Modified:** 04/10/2019
