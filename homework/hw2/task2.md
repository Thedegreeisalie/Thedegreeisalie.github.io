# Task 2: 
 Task: Implement a method/routine that computes and returns the absolute error in the approximation of a number x by another number y. Also create an entry for the method in your software manual. 
# Proof

**Routine Name:**          absError 

**Author:** Jer Moore

**Language:** C++, can be compiled with the g++ compiler **cmake** and the **make** commands, The version here was g++ (GCC) 6.4.0.

For example, the following will compile the small demonstration function as well as the routine absError

    g++ -c absError.cpp
	ar rcv absError.a absError.o
	mkdir build
	cd build
	cmake ..
	make



**Description/Purpose:**  Computes the absolute error betwen two numbers x and y

**Input:**  two numbers x and y

**Output:** the absolute error between them 

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

**Implementation/Code:** The following is the code for abserror.h
	#ifndef _ABSERROR_H_
	#define _ABSERROR_H_
	double absError(double x, double y);
	float absError(float x, float y);
	int absError(int x, int y);
	#endif

The following is the code for abserror.cpp
	// Task: Implement a method/routine that computes and returns the absolute error in the approximation of a number x by another number y. Also create an entry for the method in your software manual
	// in a frost course to numerical methods absolute Error in v is the absolute value of the difference of u and v
	// |u-v| or abs(u-v)
	#include <cstdlib>

	#include "absError.h" 
	// This is done hideously by enumerating all the cases. This could be done better
	double absError(double x, double y) {
		return std::abs(y - x) ;
	}

	float absError(float x, float y) {
		return std::abs(y - x) ;
	}

	int absError(int x, int y) {
		return std::abs(y - x) ;
	}

	double absError(int x, double y) {
		return std::abs(y - static_cast<double>(x));
	}

	float absError(int x, float y) {
		return std::abs(y - static_cast<float>(x));
	}

	float absError(float x, int y) {
		return std::abs(static_cast<float>(y) - x);
	}

	double absError(double x, int y) {
		return std::abs(static_cast<double>(y) - x);
	}

	double absError(double x, float y) {
		return std::abs(static_cast<double>(y) - x) ;
	}

	double absError(float x, double y) {
		return std::abs(y - static_cast<double>(x)) ;
	}

The following is the code for main.cpp

	#include <iostream>

	double absError(double x, double y);
	float absError(float x, float y);
	int absError(int x, int y);

	int main() {
		int a = 1;
		int b = 2;
		float c = 1.0;
		float d = 1.00001;
		double e = 1.00000002;
		double f = 1.0000001;
		

		std::cout <<"absolute error: " << a << " , " << b << " ---" << absError(a,b) << std::endl;
		std::cout <<"absolute error: " << a << " , " << c << " ---" << absError(a,b) << std::endl;
		std::cout <<"absolute error: " << a << " , " << d << " ---" << absError(a,b) << std::endl;
		std::cout <<"absolute error: " << a << " , " << e << " ---" << absError(a,b) << std::endl;
		std::cout <<"absolute error: " << a << " , " << f << " ---" << absError(a,b) << std::endl;
		std::cout <<"absolute error: " << b << " , " << a << " ---" << absError(c,d) << std::endl;
		std::cout <<"absolute error: " << b << " , " << c << " ---" << absError(c,d) << std::endl;
		std::cout <<"absolute error: " << b << " , " << d << " ---" << absError(c,d) << std::endl;
		std::cout <<"absolute error: " << b << " , " << e << " ---" << absError(c,d) << std::endl;
		std::cout <<"absolute error: " << b << " , " << f << " ---" << absError(c,d) << std::endl;
		std::cout <<"absolute error: " << c << " , " << a << " ---" << absError(e,f) << std::endl;
		std::cout <<"absolute error: " << c << " , " << b << " ---" << absError(e,f) << std::endl;
		std::cout <<"absolute error: " << c << " , " << b << " ---" << absError(e,f) << std::endl;
		std::cout <<"absolute error: " << c << " , " << d << " ---" << absError(c,d) << std::endl;
		std::cout <<"absolute error: " << e << " , " << f << " ---" << absError(e,f) << std::endl;
		std::cout <<"absolute error: " << c << " , " << d << " ---" << absError(c,d) << std::endl;
		std::cout <<"absolute error: " << e << " , " << f << " ---" << absError(e,f) << std::endl;
		return 0;
	}

**Last Modified:** 1/11/2019

