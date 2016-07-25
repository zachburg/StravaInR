RetrieveAthleteStats <- function(id) {
  reqUri <- paste("https://www.strava.com/api/v3/athletes/", id, "/stats",
                  sep = "")
  request <- GET(reqUri, config=config)
  return(content(request))
}
