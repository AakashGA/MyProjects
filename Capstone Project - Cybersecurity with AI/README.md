# Applying Data Science to Cybersecurity

### The Task
The CSRIC Best Practices Search Tool allows you to search CSRIC's collection of Best Practices using a variety of criteria including Network Type, Industry Role, Keywords, Priority Levels, and BP Number. The Communications Security, Reliability & Interoperability Council's (CSRIC) mission is to provide recommendations to the FCC to ensure, among other things, optimal security and reliability of communications systems, including telecommunications, media, and public safety. CSRIC’s members focus on a range of public safety and homeland security-related communications matters, including: (1) the reliability and security of communications systems and infrastructure, particularly mobile systems; (2) 911, Enhanced 911 (E911), and Next Generation 911 (NG911); and (3) emergency alerting.

The CSRIC's recommendations will address the prevention and remediation of detrimental cyber events, the development of best practices to improve overall communications reliability, the availability and performance of communications services and emergency alerting during natural disasters, terrorist attacks, cyber security attacks or other events that result in exceptional strain on the communications infrastructure, the rapid restoration of communications services in the event of widespread or major disruptions and the steps communications providers can take to help secure end-users and servers.

### Problem Statement
Provide recommendations to the FCC to ensure optimal security & reliability of communication systems in telecommunications, media & public safety.

### Overview
For this project, I decided to leverage data science concepts that I've learned throughout my data science journey & applied it to cybersecurity related data. I studied cybersecurity & information security during my undergrad within my applied information technology degree. With my computer science background, I established that I could use real world data involving network attacks or cyber related attacks to make recommendations, suggestions & still be able to statistically analyze the data for other important information.

In this project, I decided to gather my data from Data.gov that contains the FCC data that I had chosen as my focus for the project. Data.gov is a well known, credible & renowned website that contains tons of valuable information in all sectors of the market.

My first task was to make recommendations for the FCC based off the data I was given. Recommendations could be anything from suggested upgrades in security features or analysis of whatI discovered in my research. I had cleaned the data & sat aside some time to figure out what I could extract from this CSV file. I noticed that the data had a word description column stating what happened in the attack & what suggestions they might think would have averted the attack. Related were 2 columns: one that listed the priority of the attack in string format & another that ranked them from 1 - 3 numerically.

The priority column with strings had important, highly important & critical with the correlated column numerically ranked with 1 -3, 1 being important & 3 being critical. I decided to focus on the highly important & critical data because that is what could demolish any infrastructure the most.

My first notebook outlines my steps in cleaning the data, performing any exploratory data analysis & then applying basic classification concepts to only the priority column. After further research of the data my hypothesis was how can I make recommendations based off of correlated OR loosely correlated network attacks. This proved that my problem was an unbalanced classification problem. I had then combined the highly important & critical data together & applied a Grid Search: Naive Bayes, Random Forest, Adaboost, Gradient Boost & 3 Neural Networks.

I learned quickly that feature engineering on so little data was difficult as well as my models being 60%-70% accurate on my training data versus 57%-63% on my testing data proved that this was very non-informative data science project. I then decided to focus on another column that could correlate to the priorities I wanted & that was the description column detailing the attacks & other suggestions that the FCC might think would be a good idea.

This lead to my 2nd notebook, the natural language processing. I processed, cleaned & tokenized the descriptions through a TFIDF vectorizer to gain information regarding the most frequently used words. I used Regex, stop words, Preprocessing, Tokenization, Lemmatization, Stemming & Word2Vec within my NLP model.

I then built a Logistic Regression model on our data that could be applied to our gathered descriptions & labeled them as very important or not important. Our next step was to classify our very important descriptions as urgent or non-urgent. Finally our goal was to make recommendations based off of the importance & urgency of the data.

### Deliverables
For this project, I will be providing a few deliverables that will showcase what I decided to study, infer & discover from the data. This will be my proof or evidence for my statistical analysis of the project. Below I have listed all deliverables that you will expect to see:

- Jupyter Notebook(s) that encompasses:
  - All of my Python code
  - All graphs created from the Python code of the data sets
  - Statistical inferential analysis of the data
  - A notebook specifically for Natural Language Processing
  - A notebook for other classification related model
- My FCC CSV file from Data.gov
- This exact README.md file stating background of my Capstone Project
- My presentation in a PDF file format

Data.gov FCC URL:
https://catalog.data.gov/dataset/csric-best-practices

Data.gov JSON Related Data URL:
 - *** Note *** The JSON data us the same as the CSV file.
https://opendata.fcc.gov/api/views/qb45-rw2t/rows.json?accessType=DOWNLOAD

### Data Munging, EDA, Modeling & Recommendations (Notebook 1)
In this notebook we focused on the priority column.

- Pre-Processing:
  - Clean the descriptions to remove unwanted characters & words
  - Tokenize, Lemmatize & Stem the words contained within our descriptions
  - Applied Regex related concepts
- Modeling
  - Train/test split the data
    - Apply Logistic Regression Model
    - Apply Grid Search Naive Bayes Model
    - Apply Neural Network Model


### Natural Language Processing (Notebook 2)
In this notebook we focused on the description column & see how that correlated with the priorities column. I combined the highly important & critical priorities & focused on how those correlate on our data to make predictions or recommendations.

- Pre-Processing:
  - Clean the descriptions to remove unwanted characters & words
  - Tokenize, Lemmatize & Stem the words contained within our descriptions
  - Applied Regex related concepts
- Modeling
  - Train/test split the data
    - Apply Logistic Regression Model
    - Apply Grid Search Naive Bayes Model
    - Apply Neural Network Model

### Inferential Visualizations
  - Looking at feature loading & understanding them.  
  - Looking at how accurately we can predict related to network attacks as they occur and given their level of importance.
  - Is there a pattern to the errors? Consider reworking the model to fix this, using Regex to accurately filter out text or even add more stop words.
  - Adding an additional dropout layer to my neural network model or even regularize it even more.
  - Fine tune models through Grid Search or parameters.

### Conclusions, Hurdles, Recommendations, and Improvements
My main takeaway after working on this project is that Natural Language Processing is an incredibly powerful and useful tool when dealing with data. NLP was used as I trained a model to determine whether the words in my description column could correlate to a strong pattern to priority. I then wanted to see if the words in that column could be categorized as important or not important when correlated to the level of priority of the network situation. Based off my models, the data was somewhat or very little correlated because it was overfit however it wasn't pointless because I was still able to make predictions & recommendations off of it.

Some of the hurdles I had faced were: there wasn't enough data, the data was vague & it was an unbalanced classification problem. My recommendations would be to focus on the highly-important & critical based data. The FCC can save money if they prioritize the more important network related issues by fixing the smaller issues before hand. Since most of the cyber related problems were network based we can do the following.

We can focus on the simple first:
- Different Cables                    
- Color Code Cables              
- Better ventilation of warehouse      
- Increase power capacity             
- Better hardware                     
- Spacing of antennas
- Provide Secure Electrical Software where feasible
- Utilize Network Surveillance
- Find thresholds for new hardware & software
- Virus protection

We then can allocate money & put it towards the more critical:
- Minimizing single points of failure
- Device Management Architecture
- Secure networks
- Encrypted systems
- Software faults

However this is more complex.

Looking towards the future, it may be beneficial to utilize different models for our classification problems - specifically whether we're given more data especially in this situation & if they're considered to be important or not important. Additionally, it would likely help to classify importance on a larger scale than just based off of network related attacks. Not having enough data was the biggest hurdle but it could be because the FCC doesn't want to reveal that more of these attacks actually happened or sensitivity of information.
