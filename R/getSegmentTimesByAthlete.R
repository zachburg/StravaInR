getSegmentTimesByAthlete <- function(segmentID, athleteID, token) {
  reqURI <- paste("https://www.strava.com/api/v3/segments/", segmentID,
                  "/all_efforts?athlete_id=", athleteID, sep="")
  request <- GET(reqURI, config=config(token = token))

  if (request$status_code != 200) {
    print("Something wrong with request")
    return()
  }

  df <- fromJSON(toJSON(content(request)))
  return(unlist(df$moving_time))
}
