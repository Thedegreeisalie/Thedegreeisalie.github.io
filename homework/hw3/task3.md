# Task 3:
Task: Implement a method that returns the absolute error in the approximation of one vector by another when the ∞-norm is used. Add an entry to your software manual that documents the method.
# Proof

**Routine Name:**          absErrorInfNormVector

**Author:** Jer Moore

**Language:** C++, can be compiled with the g++ compiler **cmake** and the **make** commands, The version here was g++ (GCC) 6.4.0.

For example, the following will compile the small demonstration function as well as the routine absError

    g++ -c absErrorInfNormVector.cpp absError.cpp
	ar rcv absErrorInfNormVector.a absErrorInfNormVector.o
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

**Output:** The absolute error between them when the infinity norm is used


**Usage/Example:**

    jer@thismachinelaughsatfascists:~/Workspace/math5610/hw3/task3/build$ ./Task3 3
    0.678329 0.93728
    0.552938 0.470563
    0.474224 0.178833
    0.258951


**Implementation/Code:** The following is the code for .h

		#ifndef _ABSERRORINFNORMVECTOR_H_
		#define _ABSERRORINFNORMVECTOR_H_
		#include <vector>

		double absError(double, double);
		double absErrorInfNormVector(std::vector<double> x, std::vector<double> y);
		#endif

The following is the code for .cpp

		#include <cstdlib>

		#include "absErrorInfNormVector.h"

		double absErrorInfNormVector(std::vector<double> x, std::vector<double> y) {
			double sumx = x[0];
			double sumy = y[0];
			for( int i =0; i < x.size(); i++) {
				if (x[i] > sumx) {
					sumx = x[i];
				}
				if (y[i] > sumy) {
					sumy = y[i];
				}
			}
			return absError(sumx, sumy) ;
		}


The following is the code for main.cpp

		#include <iostream>
		#include <chrono>
		#include <random>


		double absErrorInfNormVector(std::vector<double> x, std::vector<double> y);

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

			for (int i = 0; i < n; i++) {
				std::cout << v1[i] <<  " " << v2[i] << std::endl;
			}
			std::cout << absErrorInfNormVector(v1, v2) << std::endl;

			return 0;
		}



**Last Modified:** 04/10/2019
