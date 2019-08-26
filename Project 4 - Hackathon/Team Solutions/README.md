# Income Classification for 1994 Census Data

## Problem Statement

Can certain personal information (e.g. age, marital status, education, etc.) help us predict whether an individual has a salary over a given amount?  Using modern machine learning techniques, our team set out to answer tackle this question in one day.

Constrained by time, a smaller dataset (~6k samples), and a limited number of given features, we set out to predict with 95% accuracy whether an individual would make over or under $50,000 in a given year.  Given this classification problem, we used a handful of machine learning models including Logistic Regression, Adaboost, K-Nearest Neighbors, Random Forest, Gradient Boost, and Support Vector Machines.


## Data Description

Our dataset was constructed by Barry Becker from the 1994 Census.  Excluding our target feature, we had 13 features that spanned 6513 different samples in our constrained dataset.  

A breakdown of the data and features can be found here:

[UCI - 1994 Adult Data Set](https://archive.ics.uci.edu/ml/datasets/adult)

+----------------+----------------------------------------------------------+---------------+
| Variable Name  | Description                                              | Variable Type |
+----------------+----------------------------------------------------------+---------------+
| Age            | Age of the person                                        | Continuous    |
+----------------+----------------------------------------------------------+---------------+
| Workclass      | Class of Work                                            | Categorical   |
+----------------+----------------------------------------------------------+---------------+
| Fnlwgt         | Final weight of how much of the population it represents | Continuous    |
+----------------+----------------------------------------------------------+---------------+
| Education      | Highest education level, modified to be ordinal          | Ordinal       |
+----------------+----------------------------------------------------------+---------------+
| Education-num  | Highest education level, numerically categorized         | Continuous    |
+----------------+----------------------------------------------------------+---------------+
| Marital-status | Marital status of the person                             | Categorical   |
+----------------+----------------------------------------------------------+---------------+
| Occupation     | Occupation of the person                                 | Categorical   |
+----------------+----------------------------------------------------------+---------------+
| Relationship   | Type of relationship                                     | Categorical   |
+----------------+----------------------------------------------------------+---------------+
| Race           | Race of the person                                       | Categorical   |
+----------------+----------------------------------------------------------+---------------+
| Sex            | Sex of the person                                        | Categorical   |
+----------------+----------------------------------------------------------+---------------+
| Capital-gain   | Capital gains realized                                   | Continuous    |
+----------------+----------------------------------------------------------+---------------+
| Capital-loss   | Capital loss realized                                    | Continuous    |
+----------------+----------------------------------------------------------+---------------+
| Hours-per-week | Average number of hours worked per week                  | Continuous    |
+----------------+----------------------------------------------------------+---------------+
| Native-country | Country of origin                                        | Categorical   |
+----------------+----------------------------------------------------------+---------------+
| Wage           | Income of the person, whether >50K or <= 50K             | Binary        |
+----------------+----------------------------------------------------------+---------------+
| Ed_mar         | Education multiplied by married-civ-spouse               | Continuous    |
+----------------+----------------------------------------------------------+---------------+
| Ed_mar2        | Education multiplied by never-married                    | Continuous    |
+----------------+----------------------------------------------------------+---------------+
| age_ed         | Age multiplied by education                              | Continuous    |
+----------------+----------------------------------------------------------+---------------+
| mar_fnlwgt     | Married-civ-spouse multiplied by fnlwgt                  | Continuous    |
+----------------+----------------------------------------------------------+---------------+


## Model Performance

With our constrained dataset, we had a baseline accuracy score of 74.2%.  All our initial modeling techniques reached peak performance with Adaboost.  Our initial modeling procedures led to accuracy scores of 82.9%(train) and 82.1%(test).  After creating dummy variables of our categorical data, we were able to increase our scores to 86.2%(train) and 85.8%(test).  With some hyper-tuning and gridsearching of our parameters, we were able to incrementally increase our scores to 86.3%(train) and 86.1%(test).  

We continued to engineer features, including ordinally ranking education level, binarizing birth-nationality (US or other) and creating certain interaction items.  The final tactic we used to improve our model was bootstrapping our data, which drastically helped to balance our dataset and improve our model.

With the feature engineering and bootstrapping, we were able to greatly improve our models performance with Random Forest Classifier providing training scores of 99.7% and testing scores of 92.5%.  


## Conclusions

With a smaller, unbalanced dataset, bootstrapping our data was incredibly important to enhancing certain models, like a Random Forest Classifier that can tend to make decisions that favor the larger data collection.  Our final model (92.5) out-performed the baseline model of 74.2%, but fell short of our 95% goal.  Increasing the amount of time to create our model and adding more samples to train our model would hopefully allow us to create a model that would outperform our 95% goal.


## Next Steps

The next steps to improve our model would be the following:

- Continue to clean our data set, specifically evaluating the values for 'occupation,' 'workclass' and 'marital-status'
- Collect additional data, aka work with the full data set
- Build and evaluate additional interaction items, possibly including Polynomial Features
- Use grid searching to evaluate and hypertune our parameters
