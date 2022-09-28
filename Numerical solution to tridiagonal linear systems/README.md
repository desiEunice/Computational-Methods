## Direct algorithm for solving tridiagonal linear systems. 

For a positive definite and symmetric matrix, $A$ that is tridiagonal in $R^{n\times n}$, and a right-hand term $b$ in $R^{n\times 1}$, this algorithm finds the direct solution to the linear system $Ax=b$.

Suppose that the first $k$ equations of $Ax=b$ have been reduced to the form
$$x_{j} - e_{j}x_{j+1} = f_{j} \quad j = 1,2, \dots, k$$
