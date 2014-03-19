clear;
model = init_model;
metadata = load('metadata.mat');
reviewdata = load('review_dataset.mat');
rates = zeros(5000,1);
for i=1:5000
    rates(i) = make_final_prediction(model, reviewdata.quiz.counts(i,:), metadata.quiz_metadata(1,i));
end