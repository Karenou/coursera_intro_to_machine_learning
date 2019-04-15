function centroids = computeCentroids(X, idx, K)
%COMPUTECENTROIDS returns the new centroids by computing the means of the 
%data points assigned to each centroid.
%   centroids = COMPUTECENTROIDS(X, idx, K) returns the new centroids by 
%   computing the means of the data points assigned to each centroid. It is
%   given a dataset X where each row is a single data point, a vector
%   idx of centroid assignments (i.e. each entry in range [1..K]) for each
%   example, and K, the number of centroids. You should return a matrix
%   centroids, where each row of centroids is the mean of the data points
%   assigned to it.
%

% Useful variables
[m n] = size(X);

% You need to return the following variables correctly.
centroids = zeros(K, n);


% ====================== YOUR CODE HERE ======================
% Instructions: Go over every centroid and compute mean of all points that
%               belong to it. Concretely, the row vector centroids(i, :)
%               should contain the mean of the data points assigned to
%               centroid i.
%
% Note: You can use a for-loop over the centroids to compute this.
%

##for j=1:K 
##  idx_col = j*ones(m,1);
##  X_assigned = X .* (idx == idx_col);
##  if sum(idx == idx_col) > 0
##    centroids(j,:) = sum(X_assigned) / (sum(idx == idx_col) / j);
##  endif
##endfor

C_k = zeros(K,1);
for j=1:K 
  for i = 1:m
    if idx(i) == j
      centroids(j,:) = centroids(j,:) + X(i,:);
      C_k(j) = C_k(j) + 1;
    endif
  endfor
  
  if C_k(j) >0
    centroids(j,:) =  centroids(j,:) / C_k(j);
  endif 
endfor







% =============================================================


end

