# Task 6:
Task: Implement a method that returns the dot produce of two vectors of the same length. Add an entry to your software manual that documents the method
# Proof

**Routine Name:**          dotVector

**Author:** Jer Moore

**Language:** C++, can be compiled with the g++ compiler **cmake** and the **make** commands, The version here was g++ (GCC) 6.4.0.

For example, the following will compile the small demonstration function

    g++ -c dotVector.cpp
	ar rcv dotVector.a dotVector.o
	mkdir build
	cd build
	cmake ..
	make

  To make Code reuse easier later there's a ../lib/ folder with the source code for every routine that can be compiled with the following.

      cd ../lib
      g++ -c *.cpp
      ar rcv Math5610.a *.o

**Description/Purpose:** Computes the dot product of two vectors

**Input:** Two vectors x and y

**Output:** A double that is the dot product of the two;


**Usage/Example:**

		jer@thismachinelaughsatfascists:~/Workspace/math5610/hw3/task6/build$ ./Task6 4
		0.518629 * 0.331538 + 0.811535 * 0.739195 + 0.752357 * 0.456505 + 0.0508729 * 0.798471 +  = 1.1559

**Implementation/Code:** The following is the code for .h

		#ifndef _DOTVECTOR_H_
		#define _DOTVECTOR_H_

		#include <vector>
		double dotVector(std::vector<double> v1, std::vector<double> v2);
		#endif


The following is the code for .cpp


		#include "dotVector.h"

		double dotVector(std::vector<double> v1, std::vector<double> v2) {
			double sum;
			for( int i =0; i < v1.size(); i++) {
				sum += v1[i] * v2[i];
			}
			return sum;
		}


The following is the code for main.cpp

		#include <iostream>
		#include <chrono>
		#include <random>

		double dotVector(std::vector<double> v1, std::vector<double> v2);

		int main(int argc, char *argv[]) {

			typedef std::chrono::high_resolution_clock clock;
			clock::time_point begining = clock::now();

			std::vector<double> v1, v2;
			double sum;

			int n = std::stoi(argv[1]);
			for (int i = 0; i < n; i++) {
				std::uniform_real_distribution<double> unif(1, 0);
				clock::duration d = clock::now() - begining;
				std::default_random_engine re (d.count());
				v2.push_back(unif(re));
				v1.push_back(unif(re));
			}

			sum = dotVector(v1, v2);

			for (int i =0; i < n; i++) {
				std::cout << v1[i] << " * " << v2[i] << " + ";
			}
			std::cout<< " = " <<  sum << std::endl;
			return 0;
		}


**Last Modified:** 04/10/2019
