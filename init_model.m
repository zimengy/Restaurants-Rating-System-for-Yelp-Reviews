function model = init_model(vocab)

% Example:
% model.svmw = SVM.w;
% model.lrw = LR.w;
% model.classifier_weight = [c_SVM, c_LR];
% 

tic;
clear;
addpath('./funcs')
addpath('./liblinear')
addpath('./liblinear/matlab')
addpath('./libsvm')
metadata = load('metadata.mat');
reviewdata = load('review_dataset.mat');
Xt_counts = reviewdata.train.counts;
Yt = reviewdata.train.labels;

load stem.mat
load delete.mat
load fsindex.mat
model.delete_index = delete_index;
model.idx_map = idx_map;
model.fsindex_deleted = fsindex_deleted;
model.fsindex_stemmed = fsindex_stemmed;


%-------------------------
disp('Create train_cfu.');

train_cfu = zeros(25000, 3);
for i = 1:25000
    train_cfu(i,1) = metadata.train_metadata(1,i).cool;
    train_cfu(i,2) = metadata.train_metadata(1,i).funny;
    train_cfu(i,3) = metadata.train_metadata(1,i).useful;
end

%-------------------------
disp('Create train_bid.');
train_bid = cell(1,numel(Yt));
for i=1:numel(Yt)
    train_bid(i) = metadata.train_metadata(1,i).business_id;
end
model.train_bid = train_bid;
model.Yt = Yt;

%------------------------- 
disp('Method 1 starts.');
X_1 = train_cfu;
model.model_1 = nb_mn_train(X_1, Yt);

%------------------------- 
disp('Method 2 starts.');
X_2 = sum(Xt_counts,2);
model.theta_2 = normalEqn([ones(size(X_2,1),1) X_2], Yt);

%------------------------- 
disp('Method 3 starts.');
X_3 = Xt_counts_deleted(:,fsindex_deleted(1:800));
model.theta_3 = normalEqn([ones(size(X_3,1),1) X_3], Yt);

%-------------------------
disp('Method 4 starts.');
X_4 = Xt_counts_deleted;
model.model_4 = nb_mn_train(X_4, Yt);

%-------------------------
disp('Method 5 starts.');
X_5 = Xt_counts_deleted(:,fsindex_deleted(1:310));
model.model_5 = nb_mn_train(X_5, Yt);

%-------------------------
disp('Method 6 starts.');
X_6 = Xt_counts_deleted;
model.model_6 = train(Yt, X_6, '-c 0.2 -s 7');

%-------------------------
disp('Method 7 starts.');
X_7 = Xt_counts_deleted(:,fsindex_deleted(1:1400));
model.model_7 = train(Yt, X_7, '-c 1 -s 7');

%-------------------------
disp('Method 8 starts.');
X_8 = Xt_counts_deleted;
model.model_8 = train(Yt, X_8, '-c 0.006');

%-------------------------
disp('Method 9 starts.');
X_9 = Xt_counts_deleted(:,fsindex_deleted(1:700));
model.model_9 = train(Yt, X_9, '-c 0.1');

%-------------------------
% disp('Method 10 starts.');
% load model_svm.mat
% model.model_10 = model_svm;

%-------------------------

% THETA
disp('THETA');
load theta_bid.mat
load theta_no_bid.mat
model.theta_bid = theta_bid;
model.theta_no_bid = theta_no_bid;
toc;

    
