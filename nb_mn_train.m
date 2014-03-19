function model = nb_mn_train(X, Y)
%NB_MN Summary of this function goes here
%   Detailed explanation goes here

sel_fea = sum(X)~=0;
X = X(:,sel_fea);

num_words = size(X,2);
theta = zeros(5,num_words);
for i=1:5
    data = sum(X(Y==i,:));
    theta(i,:) = (data+1)/(sum(data)+num_words);
end

theta = log(theta);

prior = [sum(Y==1) sum(Y==2) sum(Y==3) sum(Y==4) sum(Y==5)]/numel(Y);
prior = log(prior);

model.sel_fea = sel_fea;
model.theta = theta;
model.prior = prior;





