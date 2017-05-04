function  U = perform_decomposition_expfactor(v, k)
% This function decomposes each exp(v v^T ) into the form U U^T 
% where v is a vector of size n and U is a matrix of size n x k
%
% inputs : 
% v : 1D array, vector of size n 
% k : integer, order of approximation of the exponential function
% 
% outputs : 
% U : 2D array, matrix of size n x k, such that U U^T is the matrix
% factorization of exp_H(v v^T)

% get the size of the vector v 
[n,m] = size(v);

% get the infinite norm of v
M = norm(v,inf);

% define the vector y 
y = M.*ones(n,1)+v;

% define the vector z 
z = exp(-M*v);

% debug 
disp('v');
disp(v);

disp('y');
disp(y);

disp('M');
disp(M);


% define the matrix U 
U = zeros(n,k);

% fill the matrix U 
for i=0:(k-1)
   U(:,i+1) = exp(-0.5*M^2).*((y.^i)./sqrt(factorial(i)).*z);
   disp('U construction');
   disp(U);
end
   
end

