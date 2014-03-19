Restaurants-Rating-System-for-Yelp-Reviews
==========================================

Naicheng Zhang, Ye Yang, Zimeng Yang

This project is a final competition for CIS 520 Machine Learning, requiring the training of a prediction model on 20000 data and predicting the star ratings of 15000 unreleased data. <br>
Our team finally achieved high-performance predicting results of RMSE 0.8128 and placed 6th out of 47 teams.

Data pre-processing
-------------------
For the training data, we used three methods to do pre-processing:
<ul>
<li> Removing the 'stop words' in the original vocabulary </li>
<li> Puting together the words with the same root </li>
<li> Feature selection based on Information Gain </li>
</ul>

Visualization
-------------
Based on the results of feature selection, we clustered the words from vocabulary and used this way to produce
new features.<br>
The visualization of the word clusters can be viewed in https://github.com/zimengy/Restaurants-Rating-System-for-Yelp-Reviews/tree/master/images

Model initialization
--------------------
init_model.m is used to do model initialization.<br>
We used 10 ways combining different algorithms and different datasets to train the model, which are:
<ul>
<li> Naive Bayes on additional features(cool, fun, useful) </li>
<li> Linear Regression on the lengths of reviews </li>
<li> Linear Regression on the counts matrix (stopwords removed + feature selection) </li>
<li> Naive Bayes on the counts matrix (stopwords removed) </li>
<li> Naive Bayes on the counts matrix (stopwords removed + feature selection) </li>
<li> Logistic Regression on the counts matrix (stopwords removed) </li>
<li> Logistic Regression on the counts matrix (stopwords removed + feature selection) </li>
<li> Liblinear on Xt (stopwords removed) </li>
<li> Liblinear on Xt (stopwords removed + feature selection) </li>
<li> Averaging the labels with the same bussiness ID </li>
</ul>
We finally trained with linear regression to combine the 10 methods together and produce a final prediction.


