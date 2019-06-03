# Math 5610 hw1 task 7
**Routine Name:**          helloParalleism

**Author:** Jer Moore

**Language:** C++ can be compiled with gnc compiler (g++).

For example,

    g++ helloParallelism.cpp

will produce an executable **./a.exe** than can be executed. If you want a different name, the following will work a bit
better

    g++ helloParallelism.cpp -fopenmp

**Description/Purpose:** Displays the number of cores available on a machine

**Input:** None

**Output:** We expect a hello world message from each thread available on the machine

    jer@thismachinelaughsatfascists:~/Workspace/math5610/hw1/Task7$ ./a.out
  	hello world from thread: 0
  	hello world from thread: 3
  	hello world from thread: 2
  	hello world from thread: 1  

**Usage/Example:** May be useful for discovering the number of cores on a computer, or given a wild piece of hardware it may help for determining if more easily parallel-ized methods are better for said hardware.

**Implementation/Code:** The following is the code for helloParallelism()

		#include <stdio.h>
		#include <omp.h>

		int main() {
			// Get the max number of threads openmp will allow
			int numThreads = omp_get_max_threads();
			// use that number to create said number of threads
			#pragma omp parallel num_threads(numThreads)
			{
				int id = omp_get_thread_num();
				printf("hello world from thread: %d \n", id);
			}
			return 0;
		}
