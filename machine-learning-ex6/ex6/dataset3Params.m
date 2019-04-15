function [C, sigma] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.3;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%

least_error = 10000000.0;

steps = [0.01; 0.03; 0.1; 0.3; 0.5; 1; 3; 5; 10; 20; 30];
for i = 1: size(steps,1)
  for j = 1: size(steps,1)
    C_test = steps(i);
    sigma_test = steps(j);
    
    train_model = svmTrain(X, y, C_test, @(x1, x2) gaussianKernel(x1, x2, sigma_test));
    prediction = svmPredict(train_model, Xval);
    error = mean(double(prediction ~= yval));
    
    if error < least_error
      C = C_test;
      sigma = sigma_test;
      least_error = error;
      
    endif
    
  endfor
endfor

C
sigma




% =========================================================================

end
