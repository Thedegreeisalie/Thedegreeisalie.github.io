#Task 1
Task: Implement a method that will return the approximate solution of a square linear system of equations where previous methods are not used. That is, inline the row reduction operations and the backsubstitution methods. Test the speed of the code you generated in this problem and the code that references your previous methods. Try this for increasing sizes of the linear system. You will likely need to use large systems of linear equations - possibly 10,000 by 10,000 to see any kind of time. Use cpu_timing methods in the language you have chosen to do your coding. Add a manual page to document the inline version of the solution process. Report any differences you see in the time it takes to solve the linear systems in the two approaches.

#Proof
By inline I'm guessing that it means treat the row operations as an an operation that is done on one line. For my solution, I started with the form with the inline row operations. 
