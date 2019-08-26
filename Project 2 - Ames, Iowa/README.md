### Ames Housing Project

Problem Statement: We are given a dataset that is relatively complete. The data
set contains multiple errors that can corrupt the data, skew the graphs while
making it difficult for us to find patterns or correlations to a variable we
would like to predict. Our variable sales price can be used to sell someone on
a dataset for considering changing or purchasing a house in a certain
neighborhood.

We want to clean the data & model it using linear, ridge & lasso regressions to
predict the sales price of the house. We can pass in features of the data frame
to help with predicting this or help correlate a relationship.

### Overview
I'm tasked with creating a regression model based on the Ames Housing data.
I will be refining models over train-test split, cross-validation &
data with unknown values for the target to simulate the modeling process. The
use of Kaggle as a place to practice data science housing dataset is where I'll
be submitting my model. This model will predict the price of a house at sale.

### The Modeling Process
1. The train dataset has all of the columns needed. The test dataset has all of
those columns except for the target that I'm trying to predict in my model.
2. Generate my regression model using the training data by making use of:
    - train-test split
    - cross-validation/grid searching for hyper parameters
    - strong exploratory data analysis to question correlation & relationship
      across predictive variables.
3. Predict the values for my target column in the test dataset.
4. Evaluate my models by:
    - considering evaluation metrics
    - considering baseline score
    - how can my model be used for inference?
    - why do I believe my model will generalize to new data?

### Pre-processing
    - One-hot encode categorical variables (dummy columns)
    - Train/test split the train data
    - Scale the train data
    - Consider using automated feature selection

### Inferential Visualizations
    - Looking at feature loading & understanding them.
    - Looking at how accurate my predictions are. What is wrong with them? Or do
      they make sense.
    - Is there a pattern to my errors? Consider reworking the model to fix this.   

### Deliverables
For this project, I will be providing a few deliverables that will showcase what
I decided to study, infer & discover from the data sets. This will be my
proof or evidence for my statistical analysis of the project. Below I have
listed all deliverables that you will expect to see:

- Jupyter Notebook that encompasses:
  - All of my Python code
  - All graphs created from the Python code of the data sets:
    - A heatmap showing correlation of the entire data frame & on our predicted
      variable
    - A pairplot of my features that correlated best to my predicted variable
    - A histogram of my training dataset show casing all my columns
    - A boxplot based on my predicted variable & a close correlated feature
  - Statistical inferential analysis of the data
  - My current model & any future model(s)
  - My exploratory data analysis & data cleaning steps
  - Any business recommendations
- All data sets:
  - A dataset encompassing my training data or my MAIN data
  - A dataset known as my test data to match my model around
  - A dataset that represents my Kaggle submission model
  - A sample data set representing an example of what a model should look like
- This exact README.md file stating the background of Project 2
- My presentation in a PDF file format
- A Kaggle Submission to the DSI Competition

### Presentation
My presentation will discuss what I had done in this project. I went over what
data cleaning is & why it was necessary for these data sets. I had to hone in
what my audience was especially since I was presenting this to the stakeholders
as well as any potential house buyers that would purchase a house in the Ames,
Iowa neighborhood. Making predictions off of my model will help show case value.
This would allow me to analyze & model my data in order to determine the direction going forward in making housing suggestions.

I then provided my problem, what I did which could be perceived as the solution
to this problem as well as any graphs that showcase evidence pertaining to any
correlated features that could predict the sales price of a house.
