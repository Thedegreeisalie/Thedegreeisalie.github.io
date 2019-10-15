# Task 7:
Task: Implement a method that returns the cross-product of two vectors of length three. Add an entry to your software manual that documents the method. 
# Proof

**Routine Name:**          crossProduct3DVector

**Author:** Jer Moore

**Language:** C++, can be compiled with the g++ compiler **cmake** and the **make** commands, The version here was g++ (GCC) 6.4.0.

For example, the following will compile the small demonstration function

    g++ -c crossProduct3DVector.cpp
	ar rcv crossProduct3DVector.a crossProduct3DVector.o
	mkdir build
	cd build
	cmake ..
	make

  To make Code reuse easier later there's a ../lib/ folder with the source code for every routine that can be compiled with the following.

      cd ../lib
      g++ -c *.cpp
      ar rcv Math5610.a *.o

**Description/Purpose:** Computes the cross product of two 3D vectors

**Input:** Two 3D Vectors x and y

**Output:** A 3D Vector 


**Usage/Example:**

		jer@thismachinelaughsatfascists:~/Workspace/math5610/hw3/task7/build$ ./Task7 
		0.687937 * 0.367021 - 0.530528 * 0.847814 = -0.197302
		0.530528 * 0.742148 - 0.307213 * 0.367021 = 0.280977
		0.307213 * 0.847814 - 0.687937 * 0.742148 = -0.250091

**Implementation/Code:** The following is the code for .h

		#ifndef _CROSSPRODUCT3DVECTOR_H_
		#define _CROSSPRODUCT3DVECTOR_H_

		#include <vector>
		#include <math.h>
		std::vector<double> crossProduct3DVector(std::vector<double> v1,std::vector<double> v2 );
		#endif
	
		

The following is the code for .cpp


		// Task: Implement a method that returns the cross-product of two vectors of length three. Add an entry to your software manual that documents the method.
		#include "crossProduct3DVector.h"

		std::vector<double> crossProduct3DVector(std::vector<double> v1, std::vector<double> v2) {
			
			std::vector<double> crossProduct;
			
			double a_0 = v1[0];
			double a_1 = v1[1];
			double a_2 = v1[2];

			double b_0 = v2[0];
			double b_1 = v2[1];
			double b_2 = v2[2];

			crossProduct.push_back((a_1*b_2) - (a_2*b_1));
			crossProduct.push_back((a_2*b_0) - (a_0*b_2));
			crossProduct.push_back((a_0*b_1) - (a_1*b_0));

			return crossProduct;
		}


The following is the code for main.cpp

		#include <iostream>
		#include <chrono>
		#include <random>

		std::vector<double> crossProduct3DVector(std::vector<double> v1, std::vector<double> v2 );

		int main(int argc, char *argv[]) {
			
			typedef std::chrono::high_resolution_clock clock;
			clock::time_point begining = clock::now();

			std::vector<double> v1;
			std::vector<double> v2;

			int n = 3;	
			for (int i = 0; i < n; i++) {
				std::uniform_real_distribution<double> unif(1, 0);
				clock::duration d = clock::now() - begining;
				std::default_random_engine re (d.count());
				v1.push_back(unif(re));

				clock::duration d0 = clock::now() - begining;
				std::default_random_engine re0 (d0.count());
				v2.push_back(unif(re0));
			}
			std::vector<double> crossProduct = crossProduct3DVector(v1, v2);
			
			std::cout << v1[1] << " * " << v2[2] << " - " << v1[2] << " * " << v2[1] << " = " << crossProduct[0] << std::endl;
			std::cout << v1[2] << " * " << v2[0] << " - " << v1[0] << " * " << v2[2] << " = " << crossProduct[1] << std::endl;
			std::cout << v1[0] << " * " << v2[1] << " - " << v1[1] << " * " << v2[0] << " = " << crossProduct[2] << std::endl;
			//(v1[1]*v2[2]) - (v1[2]*v2[1])
			//(v1[2]*v2[0]) - (v1[0]*v2[2])
			//(v1[0]*v2[1]) - (v1[1]*v2[0])
			return 0;
		}



**Last Modified:** 04/10/2019



