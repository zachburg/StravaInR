ListAthleteActivities <- function(list.friends.activities = FALSE) {
  reqUri <- "https://www.strava.com/api/v3/"
  if (list.friends.activities) {
    reqUri <- paste(reqUri, "activities/following", sep="")
  } else {
    reqUri <- paste(reqUri, "athlete/activities", sep = "")
  }
  request <- GET(reqUri, config=config(token=token))
  return(fromJSON(toJSON(content(request))))
}
