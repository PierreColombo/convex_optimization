% Master Script For Matrix Factorisation

% Constant
N = 3; % Size of the matrix
accuracy = 0.001; % accuracy you would like to reach
stepSize = accuracy/4; % for the gradient descent

% Initialization
X = zeros(N,N);
epsilon = accuracy + 1;


% Generate a symetric matrix to factor
d = 10*rand(N,1); % The diagonal values
t = triu(bsxfun(@min,d,d.').*rand(N),1); % The upper trianglar random values
A = diag(d)+t+t.'; % Put them together in a symmetric matrix


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% Gradient descent for the programm %%%%%
%%%% min loss(A,exp(X))                %%%%%
%%%% st X symetric definite positive   %%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
number_of_projections = 0;
while epsilon > accuracy
    gradient = compute_KL_gradient(A,X);
    X = X - stepSize * gradient;
    X = find_closest_symetric_matrix(X); % projection of the solution on the cone of definite symetric matrix
    epsilon = norm(exp(X)-A,'fro');
    number_of_projections =number_of_projections +1;
end
    