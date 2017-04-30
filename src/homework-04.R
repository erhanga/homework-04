#######################
# Házi feladat 4.     #
# Programozás I.      #
# 2016/17. II. félév  #
# Erdélyi Hanga       #
# 2017-04-30          #
#######################

# II. feladat

# 1. feladat

# clinton_trump_tweets.csv beolvasása
# fileEncoding helyett encodingot írtam, így beolvasott minden sort
# bár pár karaktert így nem jelenít meg Windowson
# ez alapján: https://tinyurl.com/moldw87

tweets <- read.table(file = "data/clinton_trump_tweets.csv", header = T,
                     sep = ";", dec = ".", encoding = "UTF-8")

# 2. feladat

tweet_counts <- table(tweets$handle)
tweet_counts

names <- c("Hillary Clinton", "Donald Trump")
png("fig/tweet1.png", width = 960, height = 700, res = 120)
barplot(tweet_counts,
        col = c("#0000FF", "#FF0000"),
        ylab = "Tweet frequency",
        names.arg = names,
        legend = names,
        border = FALSE,
        main = "Candidate Tweets")
dev.off()

# 3. feladat

library(ggplot2)

ggplot(tweets, aes(x = handle, fill = lang)) +
  geom_bar(stat = "count", position = position_dodge()) +
  ggtitle("Language of Tweets") +
  scale_fill_manual(values=c("darkgrey", "cornflowerblue"))

ggsave("fig/tweet2.png", width = 10, height = 5, dpi = 100)

# 4. feladat

get_top_tweets("Hillary Clinton")
get_top_tweets("Donald Trump", 15)