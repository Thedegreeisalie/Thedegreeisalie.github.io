# Math 4610 Fundamentals of Computational Mathematics Software Manual Template File
This is a template file for building an entry in the student software manual project. You should use the formatting below to
define an entry in your software manual.

**Routine Name:**           singleAndDoubePrecision

**Author:** Jer Moore

**Language:** C++, can be compiled with the g++ compiler, The version here was g++ (GCC) 6.4.0.

For example,

    g++ singleAndDobulePrecison.cpp

will produce an executable **./a.exe** than can be executed. If you want a different name, the following will work a bit
better

    g++ -o singleAndDoublePrecision singleAndDobulePrecison.cpp

**Description/Purpose:** 

**Input:** 

**Output:** 

**Usage/Example:**

Output from the lines above:

    1.19209e-07 is your single (float) machine precision
    2.22045e-16 is your double (double) machine precision

The first value (24) is the number of binary digits that define the machine epsilon and the second is related to the
decimal version of the same value. The number of decimal digits that can be represented is roughly eight (E-08 on the
end of the second value).

**Implementation/Code:** The following is the code for smaceps()
    #include<iostream>

    void singleMachinePrecision(float E) {
            float prev_E;

            while((1+E) !=1) {
                    prev_E = E;
                    E /=2;
            }
            std::cout << prev_E << " is your single (float) machine precision" << std::endl;
    }
    void doubleMachinePrecision(double E) {
            double prev_E;

            while((1+E) !=1) {
                    prev_E = E;
                    E /=2;
            }
            std::cout << prev_E << " is your double (double) machine precision" << std::endl;
    }

    int main(){
            singleMachinePrecision(0.5);
            doubleMachinePrecision(0.5);
            return 0;
    }


**Last Modified:** 1/11/2019
