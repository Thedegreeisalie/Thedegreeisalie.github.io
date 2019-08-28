**Routine Name:**   single_precision or double_precision

**Author:** Jer Moore

**Language:** C++, can be compiled with the g++ compiler **cmake** and the **make** commands, The version here was g++ (GCC) 6.4.0.

**Description/Purpose:** computes the single(or double) precision machine epsilon for the machine it's run on 
 
**Input:** No input 

**Output:** a line of script with the machine precision and " is your single(or double) precision" 

**Usage/Example:** 


**Implementation/Code:** The following is the code for .h
	
		#ifndef _SINGLE_PRECISION_H_
		#define _SINGLE_PRECISION_H_

		#include <iostream>

		void single_precision(); 

		#endif

For a double

		#ifndef _DOUBLE_PRECISION_H_
		#define _DOUBLE_PRECISION_H_

		#include <iostream>

		void double_precision(); 

		#endif

The following is the code for .cpp

		#include "single_precision.h"

		void single_precision() {
			float E = 1.0;
			float prev_E;
			while((1 + E) != 1) {
				prev_E = E;
				E /=2;
			}
			std::cout << prev_E << " is your single machine precision" << std::endl;
		}

And for a double

		#include "double_precision.h"

		void double_precision() {
			double E = 1.0;
			double prev_E;
			while((1 + E) != 1) {
				prev_E = E;
				E /=2;
			}
			std::cout << prev_E << " is your double machine precision" << std::endl;
		}

The following is the code for main.cpp
		
		void single_precision();
		void double_precision();

		int main(int argc, char *argv[]) {
			single_precision();
			double_precision();
			return 0;
		}


**Last Modified:** 08/28/2019
