function W = perform_Hadamard_product( U,V )
% This function perform the Hadamard product of two matrices A = UU^T and 
% B = VV^T, and returns W such that AoB = WW^T
% 
% input : 
% "U" : 2D array, n x k matrix
% "V" : 2D array, n x l matrix
%
% output : 
% "W" : 2D array, n x (kxl) matrix

% get the size of U
[n,k] = size(U);

% get the size of V
[m,l] = size(V);

% check that U and V have same number of lines
% TO DO

% define the matrix W
W = zeros(n,k*l);

% fill the matrix W
for i=1:k
   for j=1:l
      W(:,(i-1)*l+j)=U(:,i).*V(:,j); 
   end
end

end

