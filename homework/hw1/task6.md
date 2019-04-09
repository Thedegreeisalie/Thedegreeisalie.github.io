# Task 6
To complete this problem, you will need to go to the Engineering Computer Lab on the third floor of the Engineering Building. Login to one of the computers and open up a Cygwin window. A Linux shell window will pop up for you to use. Complete the following steps:

    Log onto a computer (Engineering Lab) and open a command terminal to work in.
    Upload/copy the routines that you created in the first problem.
    Compile the routines into object modules (.o files). For example, put the files you have uploaded into a folder, say hw1_prob3, using the command

                % mkdir hw1_prob3


    and in a Cygwin/Linux/Unix operating system. Note that the "%" is the command prompt that may appear in the command terminal. Then use

                % mv *.f hw1_prob3
                % cd hw1_prob3


    to move all files ending with a .f suffix to the folder just created and change the working folder to the folder just created. Finally, compile the files using

                % gfortran -c *.f


    or

                % gcc -c *.c


    using the C-compiler in Cygwin. The result will be a bunch of object files with a suffix of ".o".
    The last step in this problem is to create a shared library from the routines you have created.

                % ar rcv mylib *.o


    or

                % ar rcv mylib *.o
                % ranlib mylib.a


# Proof
The following are the commands run and their corresponding outputs.

		$mkdir Task6
		$cp Task1/*.cpp Task6
		$cd Task6

This contains main.cpp, so I'll remove it and then compile

    $rm main.cpp
		$g++ -c *.cpp
		$ar rcv mylib.a *.o
        a - doublePrecision.o
        a - singlePrecision.o


This made a file mylib.a, the compiled version of these two in one.:w
