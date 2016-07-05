boxplotSegmentTimeByAthlete <- function(segment, athlete, token) {

  reqURI <- paste("https://www.strava.com/api/v3/segments/", segment,
                  "/all_efforts?athlete_id=", athlete, sep="")
  request <- GET(reqURI, config=config(token = token))

  if (request$status_code != 200) {
    print("Something wrong with request")
  }

  df <- fromJSON(toJSON(content(request)))
  time <- unlist(df$moving_time)

  boxplot(time, horizontal = TRUE)
  title(main = df$name[1],
        xlab = "Time (Seconds)",
        ylab = getAthleteName(athlete, token))
}
