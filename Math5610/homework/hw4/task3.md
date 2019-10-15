# Task 3:

# Proof

**Routine Name:**         outerVector 

**Author:** Jer Moore

**Language:** C++, can be compiled with the g++ compiler **cmake** and the **make** commands, The version here was g++ (GCC) 6.4.0.

**Description/Purpose:**
 
**Input:**  Two vectors

**Output:** A matrix
 

**Usage/Example:** 

	jer@thismachinelaughsatfascists:~/Workspace/math5610/hw4/task3/build$ ./Task3 4
	0.189266 * 0.1781150.28823 * 0.4623990.989959 * 0.6094190.461478 * 0.582142

	0.0337112 0.0875166 0.115343 0.11018
	0.0513381 0.133277 0.175653 0.167791
	0.176327 0.457756 0.6033 0.576297


**Implementation/Code:** The following is the code for .h

	#ifndef _OUTERVECTOR_H_
	#define _OUTERVECTOR_H_

	#include <vector>
	std::vector<std::vector<double>> outerVector(std::vector<double> v1, std::vector<double> v2);
	#endif


The following is the code for .cpp

	#include "outerVector.h"

	std::vector<std::vector<double>> outerVector(std::vector<double> v1, std::vector<double> v2){

		std::vector<std::vector<double>> sum;
		
		for( int i =0; i < v1.size(); i++) {
			std::vector<double> Row;
			for (int j =0; j < v2.size(); j++) {
				Row.push_back(0.0);
			}
			sum.push_back(Row);
		}

		for( int i =0; i < v1.size(); i++) {
			for (int j =0; j < v2.size(); j++) {
				sum[i][j] = v1[i] * v2[j];
			}
		}

		
		return sum;
	}


The following is the code for main.cpp

	#include <iostream>
	#include <chrono>
	#include <random>

	std::vector<std::vector<double>> outerVector(std::vector<double> v1, std::vector<double> v2);

	int main(int argc, char *argv[]) {
		
		typedef std::chrono::high_resolution_clock clock;
		clock::time_point begining = clock::now();

		std::vector<double> v1, v2;


		int n = std::stoi(argv[1]);

		for (int i = 0; i < n; i++) {
			std::uniform_real_distribution<double> unif(1, 0);
			clock::duration d = clock::now() - begining;
			std::default_random_engine re (d.count());
			v2.push_back(unif(re));
			v1.push_back(unif(re));
		}


		for (int i = 0; i < n; i++) {
			std::cout << v1[i] << " * " << v2[i];
		}
		std::cout << std::endl;
		std::cout << std::endl;
		
		std::vector<std::vector<double>> sum = outerVector(v1, v2);

		std::vector<double> first = sum.front();
		
		for (int i =0; i < sum.size(); i++) {
			for (int j =0; j < first.size(); j++) {
				std::cout << sum[i][j] << " ";
			}
			std::cout << std::endl;
		}

		return 0;
	}



**Last Modified:** 04/27/2019
