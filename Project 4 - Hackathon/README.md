# ![](https://ga-dash.s3.amazonaws.com/production/assets/logo-9f88ae6c9c3871690e33280fcf557f33.png) Project 3: Hackathon

---
## Problem Statement
The task is to predict if a person's income is in excess of $50,000 given certain profile information, and more specifically to generate predicted probabilities of income being above $50,000 for each row in the test set. This will simply be a csv with a single column of the probability with 'wage' as a header. This is a constrained optimization. Our team is constrained by the maximum number of features.
Team Features Constraint
 - Your choice of algorithm
 - Limited to a maximum of 20 features
 - Your choice of samples

---
## Executive Summary
This technical report includes statistical analysis and data visualizations to illustrate the process of creating classification models to predict if a person's income is greater than $50,000. The 20 Features selected (10 most highly correlated and 10 most negatively correlated) to wage greater than $50,0000 are:
 - 'marital-status_Never-married'  *strongest negative*
 - 'relationship_Own-child'
 - 'relationship_Not-in-family'
 - 'occupation_Other-service'
 - 'relationship_Unmarried'
 - 'occupation_Adm-clerical'
 - 'occupation_Handlers-cleaners'
 - 'relationship_Other-relative'
 - 'workclass_Private'
 - 'marital-status_Separated'
 - 'capital-loss'
 - 'occupation_Prof-specialty'
 - 'occupation_Exec-managerial'
 - 'sex_Male'
 - 'capital-gain'
 - 'hours-per-week'
 - 'age'
 - 'education-num'
 - 'marital-status_Married-civ-spouse'  *strongest positive*
 - 'workclass_Self-emp-inc'

This project is based on data acquired from the 1994 Census:  https://archive.ics.uci.edu/ml/datasets/adult

Two datasets were provided for analysis:
- `cheap_train.csv`:  [6.5K records]('data/cheap_train_sample.csv')
- `large_train.csv`:  [32.5K records]('data/large_train_sample.csv')

---
## Technical Report
A detailed technical report illustrating our process and predictions can be accessed via links in the Contents section below.

### Contents:
- [Team Features Constraint](hackathon_in-progress.ipynb)

### Hackathon Submission:
Submissions are submitted here:
 - https://docs.google.com/forms/d/e/1FAIpQLSeLekbLLIkiXJeF2tu-boNipHgw_He9GAsGRGkXCMvBrIjLBw/viewform


---

## Conclusions and Recommendations
#### Model Results
Initial Accuracy Scores against the `cheap_train` data (based on 19 features):
 - 78.08% : Naive Bayes (TRAIN)
 - 78.35% : Naive Bayes (TEST)
 - 88.76% : Random Forest (TRAIN)
 - 85.54% : Random Forest (TEST)
Accuracy scores against the `cheap_train` data (based on 20 features):
 *('workclass_Self-emp-inc' was added)*
 - 87.60% : Random Forest (TRAIN)
 - 86.07% : Random Forest (TEST)

#### Recommendations
To reduce variance in the model, we can continue to engineer features, balance classes, add a pipeline and tune hyperparameters

 