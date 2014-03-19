function prediction = nb_mn_predict(Xtest, model)
%NB_MN Summary of this function goes here
%   Detailed explanation goes here

sel_fea = model.sel_fea;
Xtest = Xtest(:,sel_fea);

theta = model.theta;
prior = model.prior;

p = ones(size(Xtest,1),5);
for i = 1:size(Xtest,1)  
%     for j = 1:num_words
%             if Xtest(i,j)~=0
%                 p(i,:) = p(i,:).*(theta(:,j)'.^Xtest(i,j));
%             end
%     end
%     i
    p(i,:) = (theta*Xtest(i,:)')';
    p(i,:) = p(i,:) + prior;
end

% [~, prediction] = max(p,[],2);

% avg = mean(p,2);
% newp = exp(1).^(p-repmat(avg,1,5)-log(5)*ones(size(Xtest,1),5));
% newnewp = newp./repmat(sum(newp,2),1,5);
% prediction = newnewp*[1:5]';

newp = exp(1).^(p-repmat(logsumexp(p,2),1,5));
newnewp = newp./repmat(sum(newp,2),1,5);
prediction = newnewp*[1:5]';





