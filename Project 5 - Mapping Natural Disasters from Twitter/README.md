# Leveraging Social Media to Map Natural Disasters

### Problem Statement
We've been given the task of using data to leverage social media and map natural disasters. We specifically focused on gathering our data from the Twitter API. This was a great opportunity for us to be exposed to a real organization doing real work with real data.

We want to clean the data, apply any natural language processing, and model the data to see if we can apply it to other related disasters as well as meet the client's needs.

### Overview
For this project, we weren't given any data! We were given possible sources for data, but didn't feel limited by this. This allowed us to be creative in where and how we gathered data!

Two parts of data-gathering:
 - Scraped tweets from Twitter's API
 - Gathered data from CrisisLex

We gathered data from the Twitter API as well as the CrisisLex website. We focused on the 2012 Hurricane Sandy disaster, a well known Oklahoma based tornado in 2013 & the 2013 floods based in Alberta, Canada & Queensland, Australia. We had gained approximately 10,000 tweets for each of these natural disasters, totaling around 40,000 tweets for our data.  

While the CrisisLex tweets were already labeled as on-topic or off-topic, we had to build a Logistic Regression model to label our scraped tweets as on-topic or off-topic. We then categorized the on-topic tweets as being non-urgent or urgent based on vectors created by using Word2Vec. We created urgent and non-urgent vectors and compared the words within each individual tweet to our urgent and non-urgent vectors.

We processed, cleaned & tokenized the tweets through a TFIDF vectorizer to gain information regarding the most frequently used words. We built a Logistic Regression model on our CrisisLex tweet database that could be applied to our gathered tweets and label them as on-topic or off-topic. Our next step was to classify our on-topic tweets as urgent or non-urgent. Finally our goal was to map tweets based on their urgency.

When it came time to map, many of our tweets had little-to-no location data. Utilizing Hydrator - an Electron based desktop application for hydrating Twitter ID datasets - we were able to gather coordinate data for tweets that we previously did not have. Without a tool such as Hydrator, the mapping process may have been more challenging, or may have required us to gather social media posts in a different way.

### The Modeling Process
1. Model is built around 40,000 tweets where these disasters occurred were at different locations with different vocabulary used within the corpus barriers.
2. Generate a Logistic Regression model and train it using the training data.
3. Predict the values for our target column in the test dataset.
4. Evaluate our main models & apply it to our other datasets.

### Pre-processing
  - Clean the tweets to remove unwanted characters and words
  - Tokenize, Lemmatize, and Stem the words contained within our tweets
  - Train/test split the data to apply to our Logistic Regression Model

### Inferential Visualizations
  - Looking at feature loading & understanding them.  
  - Looking at how accurately we can map disasters related to tweets as they occur and given their level of urgency.  
  - Is there a pattern to the errors? Consider reworking the model to fix this or even using Regex to accurately filter out text.  

### Deliverables
For this project, we will be providing a few deliverables that will showcase what we decided to study, infer & discover from the datasets. This will be our evidence for any statistical analysis of the project. Below we have listed all deliverables that you will expect to see.

- Jupyter Notebooks that encompass:
  - Our exploratory data analysis & data cleaning steps.
  - All graphs created from the Python code of the data sets.
  - Statistical inferential analysis of the data.
  - Our current model(s).
  - Map(s) corresponding with our data & location of the tweets during or after the disaster corresponding with the disaster.
- Any business recommendations.
- All data sets.
- An executive summary of the project.
- Our presentation in a PDF file format.

CrisisLex URL:
http://crisislex.org

### Presentation
After some discussion we decided that our model can't predict any other unrelated disasters such as volcanoes or earthquakes because our data & model lacks the vocabulary to train a model over unrelated disaster data. Our presentation will discuss what we had done in this project such as gathering the data through Twitter's basic API as well as online resources.

We went over what data cleaning is & why it was necessary for these data sets. We had to hone in on who our audience was especially since we were presenting this to the client as well as future GIS analysts. This would allow us to analyze & model our data in order to determine the direction going forward in deciding what words in future corpuses are urgent or not within a related natural disaster.

### Conclusions, Hurdles, Recommendations, and Improvements
Our main takeaway after working on this project is that Natural Language Processing is an incredibly powerful and useful tool when dealing with social media. NLP was used as we trained a model to determine whether tweets gathered were on-topic or off-topic, and was used again as we determined the urgency of on-topic tweets. In addition to using traditional NLP methods, Word2Vec was a useful tool in analyzing cosine similarities of urgent and non-urgent tweets. We believe that our model's accuracy can be improved given input from Subject Matter Experts to better cultivate appropriate lists of urgent / non-urgent words.

Twitter, and social media in general, can be very useful tools as we look to map natural disaster data. In the current world we live in, where every moment is documented and people live online almost more than offline, it's not unreasonable to believe that utilizing the population's presence on social media sites is beneficial when discussing disasters. While one person cannot be in every place at once, we can aggregate individual users and their first-hand accounts of what is happening to paint a more clear picture.

We utilized GeoPandas, an open source project to make working with geospatial data in python easier, to map our tweets given a set of coordinates. The biggest hurdle with this, beyond getting GeoPandas to accurately map and display the tweets, is that we were limited by Twitter's basic API. Twitter's basic API provided incredibly limited location data which made mapping the data difficult. In a real environment, we would likely have better access to the location data within Twitter.

One of our main takeaways from this project is that, while our model did very well at predicting tweets related to hurricanes, tornados, or floods (our CrisisLex crises) - our model did not do as well predicting other natural disasters. It stands to reason that people will use different language for different natural disasters. As such, in a real-world application we would want to build a model for each possible natural disaster, using Subject Matter Experts for each individual disaster to help cultivate a list of appropriate words to feed to our Natural Language Processing model. In terms of improving our mapping, it may be beneficial to pull tweets from a grid of coordinates to get a more complete map of areas being affected by the natural disaster.

Looking towards the future, it may be beneficial to utilize different models for our classification problems - specifically whether social media posts are considered to be on-topic or off topic, and whether on-topic social media posts are urgent or non-urgent. Additionally, it would likely help to classify urgency on a larger scale than just urgent or non-urgent. While the basic Twitter API provided some useful data, a lot of the data - specifically coordinate data - was missing. It may be possible to gather this data from other sources, however given the resources available to us this was one of the biggest hurdles.
