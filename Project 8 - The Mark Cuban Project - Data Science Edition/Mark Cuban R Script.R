library(twitterR)
library(ROAuth)

# Set API Keys
api_key <- "XXXXXXXXXXXXXXXXXXXXXXXX"
api_secret <- "XXXXXXXXXXXXXXXXXXXXXXXX"

access_token <- "XXXXXXXXXXXXXXXXX-XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
access_token_secret <- "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"

# Connecting R script to Twitter API
setup_twitter_oauth(api_key, api_secret, access_token, access_token_secret)

#Grab Latest Tweets
tweets_cuban = searchTwitter('from:mcuban', n = 50)
mentions_cuban = searchTwitter('@mcuban', n = 200)
keyword_search = searchTwitter('socialist+communist+globalist', ignore_case = TRUE, n = 50)

#Transform Tweets List into a Data Frame
tweets_cuban_dataframe.df <- twListToDF(tweets_cuban)
mentions_cuban_dataframe.df <- twListToDF(mentions_cuban)
keyword_search_dataframe.df <- twListToDF(keyword_search)

write.csv(tweets_cuban_dataframe, file = "tweets_cuban_dataframe.csv", row.names = FALSE)
write.csv(mentions_cuban_dataframe, file = "mentions_cuban_dataframe.csv", row.names = FALSE)
write.csv(keyword_search_dataframe, file = "keyword_search_dataframe.csv", row.names = FALSE)