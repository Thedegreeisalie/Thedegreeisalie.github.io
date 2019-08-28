**Routine Name:**    print_cmd_choice 

**Author:** Jer Moore

**Language:** C++, can be compiled with the g++ compiler **cmake** and the **make** commands, The version here was g++ (GCC) 6.4.0.

**Description/Purpose:** informs the instructor of the choice of command line enviorment that was chosen by Jer Moore 
 
**Input:** No input 

**Output:** A single line string of "Linux\n" 

**Usage/Example:** 

	jer@thismachinelaughsatfascists:~/Workspace/math4610/homework/tasksheet1/build$ ./Task4 
	Linux

**Implementation/Code:** The following is the code for .h

	#ifndef _PRINT_CMD_CHOICE_H_
	#define _PRINT_CMD_CHOICE_H_

	#include <iostream>

	void print_cmd_choice(); 

	#endif

The following is the code for .cpp

	#include "print_cmd_choice.h"

	void print_cmd_choice() {
		std::cout << "Linux" << std::endl;
	}

The following is the code for main.cpp

	void print_cmd_choice();

	int main(int argc, char *argv[]) {
		print_cmd_choice();
		return 0;
	}

**Last Modified:** 08/28/2019
