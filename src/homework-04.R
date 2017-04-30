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

# III. feladat

# 1. feladat

library(fivethirtyeight)
data(hiphop_cand_lyrics)

colors <- c("#a6d854", "#66c2a5", "#ffd92f", "#fec075",
            "#94d7fa", "#ff8974", "#fccde5", "#e78ac3")
names <- c("Carson", "Sanders", "Christie", "Trump",
           "Clinton", "Bush", "Huckabee", "Cruz")

ggplot(hiphop_cand_lyrics, aes(x = album_release_date, fill = candidate)) +
  geom_bar(stat = "count", position = position_stack()) +
  ggtitle("Every mention of 2016 primary candidates in hip-hop songs") +
  theme(legend.position="top") +
  labs(x = "Album release year", y = "Number of mentions") +
  scale_fill_manual(values = colors, labels = names)

ggsave("fig/hiphop1.png", width = 10, height = 5, dpi = 100)

ggplot(hiphop_cand_lyrics, aes(x = album_release_date, fill = candidate)) +
  geom_bar(stat = "count", position = position_stack()) +
  ggtitle("Candidate mentions, by sentiment") +
  theme(legend.position="bottom") +
  labs(x = "Album release year", y = "Number of mentions") +
  scale_fill_manual(values = colors,labels = names) +
  facet_grid(. ~ sentiment)

ggsave("fig/hiphop2.png", width = 10, height = 5, dpi = 100)

# 2. feladat

themes <- hiphop_cand_lyrics[is.element(hiphop_cand_lyrics$theme,
                                        c("personal", "political")), ]
ggplot(themes, aes(x = album_release_date, fill = candidate)) +
  geom_bar(stat = "count", position = position_stack()) +
  ggtitle("Candidate mentions, by theme") +
  theme(legend.position="bottom") +
  labs(x = "Album release year", y = "Number of mentions") +
  scale_fill_manual(values = colors, labels = names) +
  facet_grid(. ~ theme)

ggsave("fig/hiphop3.png", width = 10, height = 5, dpi = 100)