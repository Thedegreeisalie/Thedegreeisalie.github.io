### Homework Links and writeups

- [x] 1. [task1](https://thedegreeisalie.github.io/math4610/homework/tasksheet1/task1)

Task 1: Email your link to your Github page

Got it done but [here](https://thedegreeisalie.github.io/math4610)'s a link that takes you back to the math4610 io page 

- [x] 2. [task2](https://thedegreeisalie.github.io/math4610/homework/tasksheet1/task2)

Task 2: Email your instructor to indicate that you have created the math4610 Repo make sure it's a private repo and that only you and the instructor can access it.

[Here](https://github.com/Thedegreeisalie/math4610)'s a link to the math4610 repo

- [x] 3. [task3](https://thedegreeisalie.github.io/math4610/homework/tasksheet1/task3)

Task 3: Email your instructor as to which command line environment you will use in the course. Possible choices are: Cygwin, Linux, MacOS, or Windows. 

This has been completed. The OS that was chosen was Linux

- [x] 4. [task4](https://thedegreeisalie.github.io/math4610/homework/tasksheet1/task4)

Write a routine that prints out the command interface you will be using

[Here's a link to the routine](https://github.com/Thedegreeisalie/math4610/tree/master/homework/tasksheet1/task4)

- [x] 5. [task5](https://thedegreeisalie.github.io/math4610/homework/tasksheet1/task5)

Task 5: Email the instructor the link to the table of contents for your homework solutions.

[This](https://thedegreeisalie.github.io/math4610/) sends you to the io page for the homework and software manual
[This](https://thedegreeisalie.github.io/math4610/homework/) is the link for just the homework tasksheets

- [x] 6. [task6](https://thedegreeisalie.github.io/math4610/homework/tasksheet1/task6)

Task 6. In class, an example of computational error involving derivatives was given. The approximation was given by a "oned-sided" difference quotient. Use a central differenct to document the same behavior where the error reduces as h decreases until machine precision causes problems
[The routine that uses a central difference](https://github.com/Thedegreeisalie/math4610/tree/master/homework/tasksheet1/task6)

This is nearly nearly identical to task9 as it's only a one line change to get the different approximation.

- [x] 7. [task7](https://thedegreeisalie.github.io/math4610/homework/tasksheet1/task7)

Task 7. Implement two separate routines to compute (1) the absolute error between a number and an approximation of that number and (2) the relative error between a number and an approximation of that number.. Include separate entries in your software manual for the two routines you created in the previous task.
[Write a routine to compute absolute error](https://github.com/Thedegreeisalie/math4610/tree/master/homework/tasksheet1/task7/abs_error)
[Write a routine to compute relative error](https://github.com/Thedegreeisalie/math4610/tree/master/homework/tasksheet1/task7/rel_error)

- [x] 8. [task8](https://thedegreeisalie.github.io/math4610/homework/tasksheet1/task8)

Repeat the ideas in class of creating a shared library with the machine epsilon routines included in the library. Then include the absolute and relative error routines you created and documented in teh sofware manual for the course. At this point, you should have a total of 4 routines in your shared library at theis point in the course. If you have not written the two machine epsilon codes, do that as part of this task. 

**Compile Steps:**   

	cd lib/
	g++ *.cpp
	ar rcvf mylib.a *.o

[Routines for precision](https://github.com/Thedegreeisalie/math4610/tree/master/homework/tasksheet1/task8/task6)


- [x] 9. [task9](https://github.com/Thedegreeisalie/math4610/tree/master/homework/tasksheet1/task9)

Task9: Write a main program that computes the derivative of the exponential function, ex, at the point x=π. Link to your shared library and use the absolute and relative error routines to compute the errors. You can use either the one sided or centered difference approximation for this task. 

**Usage/Example:**

		pi@raspberrypi:~/Workspace/math4610/homework/tasksheet1/task9/build $ ./Task9
		The approximation for the derivative was off by 4.05428 for h0= 1
		The approximation for the derivative was off by 0.97632 for h0= 0.5
		The approximation for the derivative was off by 0.241803 for h0= 0.25
		The approximation for the derivative was off by 0.0603093 for h0= 0.125
		The approximation for the derivative was off by 0.0150685 for h0= 0.0625
		The approximation for the derivative was off by 0.00376657 for h0= 0.03125
		The approximation for the derivative was off by 0.000941609 for h0= 0.015625
		The approximation for the derivative was off by 0.0002354 for h0= 0.0078125
		The approximation for the derivative was off by 5.88499e-05 for h0= 0.00390625
		The approximation for the derivative was off by 1.47125e-05 for h0= 0.00195312
		The approximation for the derivative was off by 3.67811e-06 for h0= 0.000976562
		The approximation for the derivative was off by 9.19529e-07 for h0= 0.000488281
		The approximation for the derivative was off by 2.29881e-07 for h0= 0.000244141
		The approximation for the derivative was off by 5.74771e-08 for h0= 0.00012207
		The approximation for the derivative was off by 1.43598e-08 for h0= 6.10352e-05
		The approximation for the derivative was off by 3.59139e-09 for h0= 3.05176e-05
		The approximation for the derivative was off by 7.97424e-10 for h0= 1.52588e-05
		The approximation for the derivative was off by 9.89324e-11 for h0= 7.62939e-06
		The approximation for the derivative was off by 1.33898e-10 for h0= 3.8147e-06
		The approximation for the derivative was off by 1.33898e-10 for h0= 1.90735e-06
		The approximation for the derivative was off by 1.33898e-10 for h0= 9.53674e-07
		The approximation for the derivative was off by 1.33898e-10 for h0= 4.76837e-07
		The approximation for the derivative was off by 3.59139e-09 for h0= 2.38419e-07
		The approximation for the derivative was off by 1.13098e-08 for h0= 1.19209e-07
		The approximation for the derivative was off by 1.13098e-08 for h0= 5.96046e-08
		The approximation for the derivative was off by 1.84926e-08 for h0= 2.98023e-08
		The approximation for the derivative was off by 4.11121e-08 for h0= 1.49012e-08
		The approximation for the derivative was off by 7.80972e-08 for h0= 7.45058e-09
		The approximation for the derivative was off by 7.80972e-08 for h0= 3.72529e-09
		The approximation for the derivative was off by 7.80972e-08 for h0= 1.86265e-09
		The approximation for the derivative was off by 1.03177e-06 for h0= 9.31323e-10
		The approximation for the derivative was off by 1.03177e-06 for h0= 4.65661e-10
		The approximation for the derivative was off by 1.03177e-06 for h0= 2.32831e-10
		The approximation for the derivative was off by 6.59762e-06 for h0= 1.16415e-10
		The approximation for the derivative was off by 6.59762e-06 for h0= 5.82077e-11
		The approximation for the derivative was off by 6.59762e-06 for h0= 2.91038e-11
		The approximation for the derivative was off by 6.76328e-05 for h0= 1.45519e-11
		The approximation for the derivative was off by 6.76328e-05 for h0= 7.27596e-12
		The approximation for the derivative was off by 6.76328e-05 for h0= 3.63798e-12
		The approximation for the derivative was off by 6.76328e-05 for h0= 1.81899e-12
		The approximation for the derivative was off by 6.76328e-05 for h0= 9.09495e-13
		The approximation for the derivative was off by 6.76328e-05 for h0= 4.54747e-13
		The approximation for the derivative was off by 6.76328e-05 for h0= 2.27374e-13
		The approximation for the derivative was off by 6.76328e-05 for h0= 1.13687e-13
		The approximation for the derivative was off by 0.0156926 for h0= 5.68434e-14
		The approximation for the derivative was off by 0.0156926 for h0= 2.84217e-14
		The approximation for the derivative was off by 0.0156926 for h0= 1.42109e-14
		The approximation for the derivative was off by 0.140693 for h0= 7.10543e-15
		The approximation for the derivative was off by 0.140693 for h0= 3.55271e-15
		The approximation for the derivative was off by 0.140693 for h0= 1.77636e-15
 
Things are interesting if you look at where h0 gets to approximately 10^-6 you can see that at that point it looks like the error starts to see where the computation hit macEps for this hardware/compiler. 


- [x] 10. [task10](https://thedegreeisalie.github.io/math4610/homework/tasksheet1/task10)
Task 10: Search the internet for sites that discuss absolute and relative errors. Write a brief paragraph (3 or 4 sentences) that describe your findings. Include links to the sites you cite.

Absolute error is a way to quantify if the the measure being used is accurate, to truely calcuaculate it you would need the measurement and the true value of what you want to measure. Traditionally absolute error comes in the form of a plus or minus some hopefully small value at the end of a measurement. If we were measuring the length of a box with a ruler the absolute error would be the small range of values surrounding the measurement. Relative error gives a way to quantify if the measurement is accurate relative to the sheer size of the thing to be measured. Relative error is usually presented in the form of a percentage and requires teh absolute error to be known.

Sources
[1](http://www2.phy.ilstu.edu/~wenning/SLH/Absolute%20Relative%20Error.pdf)
[2](https://www.differencebetween.com/difference-between-absolute-error-and-vs-relative-error/)

