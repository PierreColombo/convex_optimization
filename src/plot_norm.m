%%%%%%% Master Script To Plot : Comparaison of Froebunius norm with
%%%%%%% perturbation

% Constant
N = 2; % Size of the matrix
accuracy = 0.5; % accuracy you would like to reach
stepSize = 1; % for the gradient descent
epsilon = accuracy + 1;

MAX_ITER =5;

% To store the Froebunius norm of the algo
norm_our_algo =zeros(1,10); %V. Krishnamurthy and A.d\?Aspremont algorithm
norm_als = zeros(1,10); % alternative least square solutions
norm_mult = zeros(1,10); % multiplicative update solutions
norm_cvx = zeros(1,10); % cvx algorithm


number = 0;

% Prepare the plotting
for eps =  linspace(0,0.4,10)
    number = number +1;
    for iter = 1:MAX_ITER
        % Initialization
        X = zeros(N,N);
        
        % Generate a symetric matrix to factor
        d = rand(N,1); % The diagonal values
        %t = triu(bsxfun(@min,d,d.').*rand(N),1); % The upper trianglar random values
        A = diag(d) + eps * [-2 -7;-7 0]; % Put them together in a symmetric matrix
        
        % Compute X :
        
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        %%%% Gradient descent for the programm %%%%%
        %%%% min loss(A,exp(X))                %%%%%
        %%%% st X symetric definite positive   %%%%%
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        epsilon = accuracy + 1;
        number_of_projections = 0; % number of projections ( O(1/accuracy^2) )
        while epsilon > accuracy
            gradient = compute_KL_gradient(A,X);
            X = X - stepSize* gradient;
            epsilon = norm(gradient,'fro');
            disp('------------- espsilon -------------------')
            
            disp('-------------  -------------------')
            
            disp('-------------  -------------------')
            disp(epsilon)
           
            
        end
         X = find_closest_symetric_matrix(X);
        
        % compute exp_H(X)
        
        % just apply piece wise function
        E_HX = exp(X);
        
        % compute U
        
        % fix the level of approximation :
        % as the rank is 2 : we can use k = 2^2
        k = 10;
        
        % compute U
        U = perform_factorization_expH(X, k);
        
        % compute the estimation
        estim = U * (U.');
        
        [U_als,V_als]=nnmf(A,N,'algorithm','als');
        
        [U_mult,V_mult]=nnmf(A,N,'algorithm','mult');
        %number_of_iteration = 60;
        %[U_cvx ,V_cvx] = cvx_matrix_factor( A, N , number_of_iteration );
        
        % Comput norm of all solutions
        norm_our_algo(number) =norm_our_algo(number)+ norm(A-estim,'fro')/MAX_ITER;
        norm_als(number)  =norm_als(number) +norm(A-U_als* (V_als.'),'fro')/MAX_ITER;
        norm_mult(number)  = norm_mult(number)+norm(A-U_mult* (V_mult.'),'fro')/MAX_ITER;
        norm_cvx(number)  =norm_cvx(number)  +norm(A-U_cvx* (V_cvx.'),'fro')/MAX_ITER;
        
        disp('iter')
        disp(iter)
        
    end
end

% Plot the graph : average over 20 random matrix of the norm in function of
% a perturbation
X = linspace(0,0.5,10);
plot(X,norm_our_algo,'-.b*',X,norm_mult,':bs',X,norm_als,'--mo','Linewidth',2)
title('Comparaison of Froebunius norm with perturbation')
xlabel('Epsilon') % y-axis label
ylabel('Froebunius norm') % y-axis label
legend('y = V. Krishnamurthy and A.d\ Aspremont','y = ALS','y =  Multiplicative update')