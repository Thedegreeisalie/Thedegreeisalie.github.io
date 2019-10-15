# Math 5610 Computational linear algebra

**Routine Name:** randomMatrix       

**Author:** Jer Moore

**Language:** C++ the code can be compiled with the gnc compiler (g++) 

For example,

    g++ randomMatrix.cpp

will produce an executable **./a.exe** than can be executed. If you want a different name, the following will work a bit
better

    g++ -o randomMatrix.o randomMatrix.cpp

**Description/Purpose:** This will generate a vecotor made of std::vector<double> of size n by m with values between 0 and 1. 

**Input:** 2 integers N and M that will determine the number of Rows(N) and Columns(M) of the resulting matrix 

**Output:** A std::vector<std::vector<double> > object with each cell value between 0 and 1

**Usage/Example:**


**Implementation/Code:** The following is the code for generateNbyMmatrix(int n, int m)

#include <iostream>
#include <random>
#include <vector>
#include <chrono>


//Task: Write a routine that will generate a random matrix of a given size. That is, input the number of rows and columns and output the matrix created by setting each entry in the matrix to a random value between zero and one. 

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
