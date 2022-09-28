%%%%% author: Eunice Ofori-Addo


function x = MyTridiagDirectSolution(A,b)
% MyCTridiagDirectSolution 
% Function that takes a Matrix A and vector b.
% Matrix A must be tridiagonal, positive definite and symmetric.
% Vector b must be of appropriate dimension.
% Returns x 


[n,~] = size(A);
[~,m] = size(b);

x = [zeros(n,1)];



for k = 1  %% this loop solve for the e(j) and f(j) when j = 1
    e(1) = -A(k,k+1)/A(k,k);  
    f(1) = b(k)/A(k,k);

end

for k = 1:n-2  %% this loop solves for e(j) and f(j) when j = 2:n-1 

    e(k+1) = -A(k+1,k+2) / ( A(k+1,k+1) + e(k)* A(k+1,k) );
    f(k+1) = ( b(k+1) - f(k) * A(k+1,k) )/ ( A(k+1,k+1) + e(k) * A(k+1,k) );

end

f(n) = ( b(n) - f(n-1) * A(n,n-1) )/ (A(n,n) + (e(n-1) * A(n,n-1) )); %% solves for f(j) when j = n


x(n) = f(n); %% since at x(n), we make the coefficient of x(n+1) = 0

for j = n-1:-1:1   %% this loop solves for x(j) backwards

    x(j) = e(j) * x(j+1) + f(j);

end