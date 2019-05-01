#include <iostream>
#include <random>
#include <vector>
#include <chrono>

std::vector<std::vector<double>> generateSymetricNbyNMatrix(int);
std::vector<double> solveLUFactorization(std::vector<std::vector<double>>, std::vector<double>);

int main(int argc, char *argv[]) {

	int n = std::stoi(argv[1]);
	
	std::vector<double> b;
	
	typedef std::chrono::high_resolution_clock clock;
	clock::time_point begining = clock::now();

	for (int i =0; i < n; i++) {
		std::uniform_real_distribution<double> unif(1, 0);
		clock::duration d = clock::now() - begining;
		std::default_random_engine re (d.count());
		double value = unif(re);
		b.push_back(value);
	}
	
	std::vector<std::vector<double>> Matrix = generateSymetricNbyNMatrix(n);

	std::vector<double> x = solveLUFactorization(Matrix, b);
	
	for (int i = 0; i < n; i++) {
		for (int j = 0; j < n; j++) {
			std::cout << Matrix[i][j] << " ";
		}
		std::cout << std::endl;
	}
	
	std::cout << "Is the original matrix, A" << std::endl;


	for (int i = 0; i < n; i++) {
		std::cout << x[i] << std::endl;
	}
	
	std::cout << "Is the solution x" << std::endl;
	
	return 0;
}
#include "solveLUFactorization.h"

std::vector<double> solveLUFactorization(std::vector<std::vector<double>> matrix, std::vector<double> b) {
	
	int n = matrix.front().size();
	
	std::vector<std::vector<double>> l;

	for (int k = 0; k < n; k++) {
		std::vector<double> row;
		for (int i = 0; i < n; i++) {
			if(i != k) {
				row.push_back(0.0);
			}
			else {
				row.push_back(1.0);
			}
		}
		l.push_back(row);
	}

	for (int k = 0; k < n-1; k++) {
		for (int i = k+1; i < n; i++) {
			l[i][k] = (matrix[i][k] / matrix[k][k]);
			for (int j = k; j < n; j++) {
				matrix[i][j] =  matrix[i][j] - (l[i][k] * matrix[k][j]);
			}
			matrix[i][k] = l[i][k];
			b[i] = (b[i] * l[i][k]);
		}
	}
	//now solve LXk
	std::vector<double> Ly = solveLowerTriangular(l, b);
	std::vector<double> x = solveUpperTriangular(matrix, b);


	return x;
}
