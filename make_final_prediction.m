function prediction = make_final_prediction(model, test_words, test_meta)

% Input
% test_words : a 1xp vector representing "1" test sample.
% test_meta : a struct containing the metadata of the test sample.
% model : what you initialized from init_model.m
%
% Output
% prediction : a scalar which is your prediction of the test sample
%
% **Note: the function will only take 1 sample each time.

% addpath('funcs')
% addpath('liblinear')
% addpath('libsvm')

test_bid = test_meta.business_id;
b = strcmp(test_bid, model.train_bid);

X_cfu = zeros(1, 3);
X_cfu(1,1) = test_meta.cool;
X_cfu(1,2) = test_meta.funny;
X_cfu(1,3) = test_meta.useful;

X_counts = test_words;
X_deleted = X_counts(:,~model.delete_index);


pre_1 = nb_mn_predict(X_cfu, model.model_1);

pre_2 = [1 sum(X_counts)]*model.theta_2;

X_3 = X_deleted(:,model.fsindex_deleted(1:800));
pre_3 = [1 X_3]*model.theta_3;

pre_4 = nb_mn_predict(X_deleted, model.model_4);

X_5 = X_deleted(:,model.fsindex_deleted(1:310));
pre_5 = nb_mn_predict(X_5, model.model_5);

[~, ~, value] = predict(1, X_deleted, model.model_6, '-b 1');
pre_6 = value*model.model_6.Label;

X_7 = X_deleted(:,model.fsindex_deleted(1:1400));
[~, ~, value] = predict(1, X_7, model.model_7, '-b 1');
pre_7 = value*model.model_7.Label;

[pre_8, ~, ~] = predict(1, X_deleted, model.model_8);

X_9 = X_deleted(:,model.fsindex_deleted(1:700));
[pre_9, ~, ~] = predict(1, X_9, model.model_9);

% X_10 = X_stemmed(:,fsindex_stemmed(1:500));
% [~, ~, value] = svmpredict(1, X_10, model.model_10, '-b 1');
% pre_10 = value*model.model_10.Label;

if sum(b)>0
    pre_11 = sum(model.Yt(b))/sum(b);
    prediction = [1 pre_1 pre_2 pre_3 pre_4 pre_5 pre_6 pre_7 pre_8 pre_9 pre_11]*model.theta_bid;  
else
    prediction = [1 pre_1 pre_2 pre_3 pre_4 pre_5 pre_6 pre_7 pre_8 pre_9]*model.theta_no_bid;
    
end
