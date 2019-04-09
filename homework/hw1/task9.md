# Math 5610 Computational linear algebra homework 1 task 9

**Routine Name:** randomMatrix       

**Author:** Jer Moore

**Language:** C++, can be compiled with the g++ compiler **cmake** and the **make** commands, The version here was g++ (GCC) 6.4.0.

For example, the following will compile the small demonstration function as well as the routine absError

    g++ -c generateNbyMmatrix.cpp
	ar rcv generateNbyMmatrix.a generateNbyMmatrix.o
	mkdir build
	cd build
	cmake ..
	make


**Description/Purpose:** This will generate a vector made of `std::vector<double>` of size n by m with values between 0 and 1.

**Input:** 2 integers N and M that will determine the number of Rows(N) and Columns(M) of the resulting matrix

**Output:** A `std::vector<std::vector<double>>` object with each cell value between 0 and 1.

The following is the output of the driver program main.cpp.

    jer@thismachinelaughsatfascists:~/Workspace/math5610/hw1/Task9/build$ ./Task9 9 9
    0.357607 0.0191422 0.0799826 0.597281 0.202323 0.52796 0.419883 0.524144 0.0214533
    0.3134 0.136691 0.49239 0.0241088 0.0729387 0.779831 0.855594 0.194433 0.325626
    0.264658 0.11019 0.852682 0.357468 0.379364 0.654264 0.519253 0.0419322 0.932291
    0.85881 0.0704586 0.207564 0.87082 0.131988 0.172309 0.536516 0.79612 0.634176
    0.59961 0.942796 0.948364 0.190074 0.345072 0.938477 0.383485 0.590786 0.37654
    0.727389 0.702895 0.68153 0.791702 0.76286 0.0123906 0.140456 0.92621 0.501191
    0.908848 0.358203 0.0991313 0.920859 0.838151 0.29689 0.792636 0.893768 0.967967
    0.535659 0.455735 0.616645 0.33064 0.404839 0.652805 0.0170129 0.170447 0.902335
    0.389228 0.336237 0.680987 0.735729 0.573786 0.900987 0.475968 0.497865 0.782837

**Usage/Example:** It's not always that you can just find a matrix of the right size in the wild, so why not just make your own? Or when you write a linear algebra software package you might want to trouble shoot a routine may or may not involve a number of matrix operations, this will give a nearly endless supply of matrices for those steps.


**Implementation/Code:** The following is the code for generateNbyMmatrix.h

    #ifndef _GENERATENBYMMATRIX_H_
    #define _GENERATENBYMMATRIX_H_

    #include <vector>
    #include <chrono>
    #include <random>

    std::vector<std::vector<double>> genererateNbyMmatrix(int n, int m);

    #endif

The following is the code for generateNbyMmatrix.cpp

    #include "generateNbyMMatrix.h"

    //Task: Write a routine that will generate a random matrix of a given size. That is, input the number of rows and columns and output the matrix created by setting each entry in the matrix to a random value between zero and one.

    std::vector<std::vector<double>> genererateNbyMmatrix(int n, int m) {
    	//Have to do some seeding for this to generate some numbers
    	typedef std::chrono::high_resolution_clock clock;
    	clock::time_point begining = clock::now();

    	//allocate the space
    	std::vector<std::vector<double> > matrix;
    	//inialize each value
    	for (int i = 0; i < n; ++i) {
    		std::vector<double> Row;
    		for (int j = 0; j < n; ++j) {
    			// the number needw to be betwen 0 and 1 do some seeding of the random generator as well
    			std::uniform_real_distribution<double> unif(1, 0);
    			clock::duration d = clock::now() - begining;
    			std::default_random_engine re (d.count());
    			Row.push_back(unif(re));
    		}
    		matrix.push_back(Row);
    	}
    	//return a pointer to the array
    	return matrix;
    }

The following is the code for main.cpp

    #include <iostream>
    #include <random>
    #include <vector>
    #include <chrono>

    std::vector<std::vector<double>> genererateNbyMmatrix(int n, int m);

    int main(int argc, char *argv[]) {


    	std::vector<std::vector<double>> nBymMatrix;
    	int n = std::stoi(argv[1]);
    	int m = std::stoi(argv[2]);
    	nBymMatrix = genererateNbyMmatrix(n,m);
    	for (int i = 0; i < n; ++i) {
    		for (int j = 0; j < n; ++j) {
    				std::cout << nBymMatrix[i][j] << " ";
    		}
    		std::cout << std::endl;
    	}
    	return 0;
    }
