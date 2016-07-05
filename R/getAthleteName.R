getAthleteName <- function(athleteID, token) {

  reqURI <- paste("https://www.strava.com/api/v3/athletes/", athleteID, sep="")
  request <- GET(reqURI, config = config(token = token))
  df <- fromJSON(toJSON(content(request)))
  return(paste(df$firstname, df$lastname, sep=" "))
}
