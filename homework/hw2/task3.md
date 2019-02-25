# Task 2: 
 Task: Implement a method/routine that computes and returns the absolute error in the approximation of a number x by another number y. Also create an entry for the method in your software manual. 
# Proof

**Routine Name:**          relError 

**Author:** Jer Moore

**Language:** C++, can be compiled with the g++ compiler **cmake** and the **make** commands, The version here was g++ (GCC) 6.4.0.

For example, the following will compile the small demonstration function as well as the routine relError

    g++ -c relError.cpp
	ar rcv relError.a relError.o
	mkdir build
	cd build
	cmake ..
	make



**Description/Purpose:**  Computes the relative error betwen two numbers x and y

**Input:**  two numbers x and y

**Output:** the relative error between them 

**Usage/Example:**

Output from the lines above:

	absolute error: 1 , 2 ---1
	absolute error: 1 , 1 ---1
	absolute error: 1 , 1.00001 ---1
	absolute error: 1 , 1 ---1
	absolute error: 1 , 1 ---1
	absolute error: 2 , 1 ---1.00136e-05
	absolute error: 2 , 1 ---1.00136e-05
	absolute error: 2 , 1.00001 ---1.00136e-05
	absolute error: 2 , 1 ---1.00136e-05
	absolute error: 2 , 1 ---1.00136e-05
	absolute error: 1 , 1 ---8e-08
	absolute error: 1 , 2 ---8e-08
	absolute error: 1 , 2 ---8e-08
	absolute error: 1 , 1.00001 ---1.00136e-05
	absolute error: 1 , 1 ---8e-08
	absolute error: 1 , 1.00001 ---1.00136e-05
	absolute error: 1 , 1 ---8e-08


The first value (24) is the number of binary digits that define the machine epsilon and the second is related to the
decimal version of the same value. The number of decimal digits that can be represented is roughly eight (E-08 on the
end of the second value).

**Implementation/Code:** The following is the code for relError.h
	#ifndef _RELERROR_H_ 
	#define _RELERROR_H_
	double relError(double x, double y);
	float relError(float x, float y);
	int relError(int x, int y);
	#endif



The following is the code for relError.cpp
	#include <cstdlib>
	#include "relError.h" 
	// Task: Implement a method/routine that computes and returns the relative error in the approximation of a number x another number y. Also create an entrx for the method in xour software manual.
	// relError(applroximation, value)
	// This is done hideously by enumerating all the cases. This could be done better
	double relError(double y, double x) {
		return std::abs(x - y) / std::abs(x) ;
	}

	float relError(float y, float x) {
		return std::abs(x - y) / std::abs(x);
	}

	int relError(int y, int x) {
		return std::abs(x - y) / std::abs(x) ;
	}

	double relError(int y, double x) {
		return std::abs(x - static_cast<double>(y))/ std::abs(x);
	}

	float relError(int y, float x) {
		return std::abs(x - static_cast<float>(y)) / std::abs(x);
	}

	float relError(float y, int x) {
		x = static_cast<float>(x);
		return std::abs(x - y) / std::abs(x);
	}

	double relError(double y, int x) {
		x = static_cast<double>(x);
		return std::abs(x - y) / std::abs(x);
	}

	double relError(double y, float x) {
		x = static_cast<double>(x);
		return std::abs(x - y) / std::abs(x) ;
	}

	double relError(float y, double x) {
		return std::abs(x - static_cast<double>(y)) / std::abs(x) ;
	}

The following is the code for main.cpp
	#include <iostream>

	double relError(double x, double y);
	float relError(float x, float y);
	int relError(int x, int y);

	int main() {
		int a = 1;
		int b = 2;
		float c = 1.0;
		float d = 1.00001;
		double e = 1.00000002;
		double f = 1.0000001;
		

		std::cout <<"absolute error: " << a << " , " << b << " ---" << relError(a,b) << std::endl;
		std::cout <<"absolute error: " << a << " , " << c << " ---" << relError(a,b) << std::endl;
		std::cout <<"absolute error: " << a << " , " << d << " ---" << relError(a,b) << std::endl;
		std::cout <<"absolute error: " << a << " , " << e << " ---" << relError(a,b) << std::endl;
		std::cout <<"absolute error: " << a << " , " << f << " ---" << relError(a,b) << std::endl;
		std::cout <<"absolute error: " << b << " , " << a << " ---" << relError(c,d) << std::endl;
		std::cout <<"absolute error: " << b << " , " << c << " ---" << relError(c,d) << std::endl;
		std::cout <<"absolute error: " << b << " , " << d << " ---" << relError(c,d) << std::endl;
		std::cout <<"absolute error: " << b << " , " << e << " ---" << relError(c,d) << std::endl;
		std::cout <<"absolute error: " << b << " , " << f << " ---" << relError(c,d) << std::endl;
		std::cout <<"absolute error: " << c << " , " << a << " ---" << relError(e,f) << std::endl;
		std::cout <<"absolute error: " << c << " , " << b << " ---" << relError(e,f) << std::endl;
		std::cout <<"absolute error: " << c << " , " << b << " ---" << relError(e,f) << std::endl;
		std::cout <<"absolute error: " << c << " , " << d << " ---" << relError(c,d) << std::endl;
		std::cout <<"absolute error: " << e << " , " << f << " ---" << relError(e,f) << std::endl;
		std::cout <<"absolute error: " << c << " , " << d << " ---" << relError(c,d) << std::endl;
		std::cout <<"absolute error: " << e << " , " << f << " ---" << relError(e,f) << std::endl;
		return 0;
	}

**Last Modified:** 1/11/2019
