function [theta, J_history] = gradientDescent(X, y, theta, alpha, num_iters)

%GRADIENTDESCENT Performs gradient descent to learn theta
%theta = GRADIENTDESCENT(X, y, theta, alpha, num_iters) updates theta by taking num_iters gradient steps with learning rate alpha

% Initialize some useful values
m = length(y); % number of training examples
J_history = zeros(num_iters, 1);

% ====================== YOUR CODE HERE ======================
% Instructions: Perform a single gradient step on the parameter vector theta. 

for iter = 1:num_iters
	delta = zeros(2,1);  
  
	for i = 1:m
    		delta = delta + (X(i,:)*theta - y(i))*X(i,:)';
	end
	delta = delta / m;
	theta = theta - alpha * delta;

    % ============================================================

    % Save the cost J in every iteration    
    J_history(iter) = computeCost(X, y, theta);

end
