ListStarredSegments <- function(id) {
  reqUri <- "https://www.strava.com/api/v3/"
  if (missing(id)) {
    reqUri <- paste(reqUri, "segments/starred", sep = "")
  } else {
    reqUri <- paste(reqUri, "athletes/", id, "/segments/starred", sep = "")
  }
  request <- GET(reqUri, config = config)
  return(fromJSON(toJSON(content(request))))
}
