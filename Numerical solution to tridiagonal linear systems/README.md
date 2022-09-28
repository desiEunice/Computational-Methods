## Direct algorithm for solving tridiagonal linear systems. 

The algorithm is simply conducting Gaussian elimination with respect to a tri-diagonal matrix. 
For a positive definite and symmetric matrix, $A$ that is tridiagonal in $R^{n\times n}$, and a right-hand term $b$ in $R^{n\times 1}$, this algorithm finds the direct solution to the linear system $Ax=b$.

Suppose that the first $k$ equations of $Ax=b$
$$a_{k,k-1}x_k + a_{k,k}x_{k} + a_{k,k+1}x_{k+1} = b_{k}$$

have been reduced to the form: 
$$x_{j} - e_{j}x_{j+1} = f_{j} \quad j = 1,2, \dots, k$$

Example: 
$$ x_{1} - \underbrace{ [- \frac{a_{12}}{a_{11}}] }_ {e_{1}} x_{2} = \underbrace{\frac{b_1}{a_11}}_ {f_{1}}  $$

the  $k+1$ th equation:
$$a_{k+1,k}x_k + a_{k+1,k+1}x_{k+1} + a_{k+1,k+2}x_{k+2} = b_{k+1}$$

Reducing the $k+1$ th equation into the general form gives us:

$$ x_{k+1} - \underbrace{ [- \frac{a_{k+1, k+2}}{a_{k+1,k+1} + e_k a_{k+1,k}}]}_ {e_{k+1}} x_{k+2} = \underbrace{\frac{b_{k+1} - f_k a_{k+1,k}}{a_{k+1, k+1} + e_k a_{k+1, k}}}_ {f_{k+1}} $$ 

Therefore the reduced form of the $k+1$ equation is:
$$x_{k+1} - e_{k+1}x_{k+2} = f_{k+1}$$

We solve the system by first solving for coefficients of the reduced form of our system, $e_j$ and $f_j$ for $j = 1, 2, \dots, n-1$ and $f_n$ for $j=n$. 
Note: $$x_n = f_n$$

Then we plug $x_n$ into the equation: 

$$x_{n-1} -e_{n-1}x_n = f_{n-1}$$

to solve for $x_{n-1}$ and repeat the process until we get $x_1$
