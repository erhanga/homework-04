get_top_tweets <- function(name, limit = 10) {
  handle <- switch(name,
                   "Hillary Clinton" = "HillaryClinton",
                   "Donald Trump" = "realDonaldTrump",
                   NA)
  if (is.na(handle)) {
    stop("Wrong name")
  }
  print(name)
  print(limit)
  
  tweets$retweet_favorite_count <- tweets$retweet_count + tweets$favorite_count
  filtered <- tweets[tweets$handle == handle, ]
  sorted <- filtered[with(filtered, order(-retweet_favorite_count)), ]
  limited <- head(sorted, n = limit)
  limited$text
}