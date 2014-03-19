CIS 520 Final Project - pleyelp

1. Data pre-processing

For the training data, we used three methods to do pre-processing:
a. Removing the 'stop words' in the original vocabulary
b. Puting together the words with the same root
c. Feature selection based on information gain

For each method used to train the model, we processed the original data with different pre-processing methods and came up with one way that performed best on each training method.

2. Model initialization.

init_model.m is used to do model initialization.
We used 10 ways combining different algorithms and different datasets to train the model, which are:

a. Naive Bayes on additional features(cool, fun, useful)
b. Linear Regression on the lengths of reviews
c. Linear Regression on the counts matrix (stopwords removed + feature selection)
d. Naive Bayes on the counts matrix (stopwords removed)
e. Naive Bayes on the counts matrix (stopwords removed + feature selection)
f. Logistic Regression on the counts matrix (stopwords removed)
g. Logistic Regression on the counts matrix (stopwords removed + feature selection)
h. Liblinear on Xt (stopwords removed)
i. Liblinear on Xt (stopwords removed + feature selection)
j. Averaging the labels with the same bussiness ID

We finally trained with linear regression to combine the 10 methods together and produce a final prediction.

3. We also implemented the following methods, which are included in the 'unused_model' folder.
knn
decision tree
kmeans
clustering words to generate new features 
