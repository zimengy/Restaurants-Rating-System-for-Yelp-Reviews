function error = rmse(y, yhat)
% RMSE - Compute the RMSE given the prediction label yhat and true label y.
%
% y and yhat are both N x 1 vectors.

error = sqrt(sum((y-yhat).^2)/size(y,1));