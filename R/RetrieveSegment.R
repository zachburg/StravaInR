RetrieveSegment <- function(id) {
  reqUri <- paste("https://www.strava.com/api/v3/segments/", id, sep = "")
  request <- GET(reqUri, config = config)
  return(content(request))
}
