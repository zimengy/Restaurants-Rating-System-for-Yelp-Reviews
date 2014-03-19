function model = init_model_cluster(vocab)

% Example:
% model.svmw = SVM.w;
% model.lrw = LR.w;
% model.classifier_weight = [c_SVM, c_LR];
% 

load review_dataset.mat
load stem.mat
load fsindex.mat

X = Xt_counts_stemmed(:, fsindex_stemmed(1:3000));
X = X(sum(X')~=0, :);
Yt = train.labels;
Yt = Yt(sum(X')~=0, :);
N = 10;
IDX = kmeans(X', N, 'Distance', 'correlation');

X_new = zeros(size(X,1), N);
for i=1:N
    X_new(:,i) = sum(X(:, IDX==i), 2);
end

model.thetas = normalEqn([ones(size(X_new, 1)) X_new], Yt);
model.IDX = IDX;
