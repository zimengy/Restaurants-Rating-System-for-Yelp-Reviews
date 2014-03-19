% This is the script to process additional features that you want to use

% YOUR CODE GOES HERE

load ../data/metadata.mat

% Xt_additional_features = []; % Modify this in if needed
% Xq_additional_features = []; % Modify this in if needed

train_cfu = zeros(25000, 3);
for i = 1:25000
    train_cfu(i,1) = train_metadata(1,i).cool;
    train_cfu(i,2) = train_metadata(1,i).funny;
    train_cfu(i,3) = train_metadata(1,i).useful;
end

quiz_cfu = zeros(5000, 3);
for i = 1:5000
    quiz_cfu(i,1) = quiz_metadata(1,i).cool;
    quiz_cfu(i,2) = quiz_metadata(1,i).funny;
    quiz_cfu(i,3) = quiz_metadata(1,i).useful;
end

    