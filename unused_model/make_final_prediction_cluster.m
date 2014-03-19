function prediction = make_final_prediction_cluster(model,test_words,test_meta)

% Input
% test_words : a 1xp vector representing "1" test sample.
% test_meta : a struct containing the metadata of the test sample.
% model : what you initialized from init_model.m
%
% Output
% prediction : a scalar which is your prediction of the test sample
%
% **Note: the function will only take 1 sample each time.

load fsindex.mat
test_words_deleted = test_words(:, ~deleted_index);
test_words_stemmed = gen_stem_counts(test_words_deleted, idx_map);
test_words_fs = test_words_stemmed(:, fsindex_stemmed(1:3000));
N = 10;
test_words_new = zeros(1, N);
for i = 1:N
    test_words_new(:,i) = sum(test_words_fs(:, IDX == i),2);
end
prediction = [1 test_words_new] * model;