%%%%%% Test Script For Matrix Factorisation : This script factor a matrix A
%%%%%%% of size N*N into a product of two matrices U.V of size N*k and k*N

% Constant
N = 10; % Size of the matrix

% Initialization
A = rand(N);

stringA = 'matrix A';
StringU = 'matrix U';
StringV = 'matrix V';
StringEstimate = 'estimate';

disp(stringA)
disp(A);


for k = 1:(N-1)
    [U,V]=nnmf(A,k,'algorithm','als');
    disp(StringU);
    disp(U);
    disp(StringV);
    disp(V);
    disp(StringEstimate);
    disp(U*V - A);
    disp(norm(U*V-A));
    [U,V]=nnmf(A,k,'mult');
    disp(StringU);
    disp(U);
    disp(StringV);
    disp(V);
    disp(StringEstimate);
    disp(U*V - A);
    disp(norm(U*V-A));
end