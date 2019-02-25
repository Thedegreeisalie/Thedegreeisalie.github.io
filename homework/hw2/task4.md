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

**Implementation/Code:** The following is the code for abserror.h
The following is the code for abserror.cpp
The following is the code for main.cpp

**Last Modified:** 1/11/2019
