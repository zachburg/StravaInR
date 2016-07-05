getSegmentName <- function(segmentID, token) {
  reqURI <- paste("https://www.strava.com/api/v3/segments/", segmentID,
                  sep = "")
  request <- GET(reqURI, config=config(token=token))
  df <- fromJSON(toJSON(content((request))))
  return(df$name)
}
