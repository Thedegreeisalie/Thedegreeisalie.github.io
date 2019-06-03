# Task 8:
Task: Look for internet sites that include descriptions of preconditioning of systems of equations. Document at least 3 different preconditioning strategies
# Proof
[link](http://people.maths.ox.ac.uk/wathen/preconditioning.pdf) looks at krylov subspaces indepth. [link](https://en.wikipedia.org/wiki/Preconditioner) Outlines Jacobi preconditioner, SPAI, and provides links to incomplete Cholesky, and LU factorization. Jacobi taeks the preconditioning matrix P to be the diagonal of the matrix A, which is efficient for diagonally dominat matrices.  SPAI uses the frobenius norm to find a suitable sparse P that also minimizes ||AP^-1 -I||_F. 
