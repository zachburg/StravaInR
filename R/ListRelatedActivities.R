ListRelatedActivities <- function(activity.id) {
  reqUri <- paste("https://www.strava.com/api/v3/activities/", activity.id,
                  "/related", sep = "")
  request <- GET(reqUri, config = config)
  return(fromJSON(toJSON(content(request))))
}
