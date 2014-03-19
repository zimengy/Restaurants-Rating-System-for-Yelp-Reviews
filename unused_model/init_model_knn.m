function model = init_model_knn(vocab)

% Example:
% model.svmw = SVM.w;
% model.lrw = LR.w;
% model.classifier_weight = [c_SVM, c_LR];
% 

load review_dataset.mat
load stem.mat
load fsindex.mat

X = Xt_counts_stemmed(:, fsindex_stemmed(1:300));
Yt = train.labels;

k = 300;
model = ClassificationKNN.fit(X, Yt);
model.NumNeighbors = k;
