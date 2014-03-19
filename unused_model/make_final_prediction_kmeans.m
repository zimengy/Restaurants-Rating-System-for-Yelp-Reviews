function prediction = make_final_prediction_kmeans(model,test_words,test_meta)

% Input
% test_words : a 1xp vector representing "1" test sample.
% test_meta : a struct containing the metadata of the test sample.
% model : what you initialized from init_model.m
%
% Output
% prediction : a scalar which is your prediction of the test sample
%
% **Note: the function will only take 1 sample each time.

X = model;
Xall = [X; test_words];
IDX = kmeans(Xall, 5);
IDX_train = IDX(1:size(X,1));
IDX_test = IDX(end);
a = trainLabels(IDX_train == IDX_test);
prediction = mode(a);