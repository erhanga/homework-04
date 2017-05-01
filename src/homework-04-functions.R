# II. feladat

# 4. feladat

get_top_tweets <- function(name, limit = 10) {
  # leképezem a neveket a handle-re
  handle <- switch(name,
                   "Hillary Clinton" = "HillaryClinton",
                   "Donald Trump" = "realDonaldTrump",
                   NA)
  # álljon meg, ha rossz nevet kap
  if (is.na(handle)) {
    stop("Wrong name")
  }
  # írja ki a nevet és a limitet
  print(name)
  print(limit)
  
  # kiszámoljuk az összeget új oszlopba
  tweets$retweet_favorite_count <- tweets$retweet_count + tweets$favorite_count
  # leszűrjük a keresett handle-re
  filtered <- tweets[tweets$handle == handle, ]
  # rendezzük az összeg szerint csökkenő sorrendbe
  sorted <- filtered[with(filtered, order(-retweet_favorite_count)), ]
  # kiszedjük a kellő számú elemet
  limited <- head(sorted, n = limit)
  # csak a szövegeket adjuk vissza
  limited$text
}