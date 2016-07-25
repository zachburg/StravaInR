RetrieveSegmentEffort <- function(segment.id) {

  reqUri <- paste("http://www.strava.com/api/v3/segment_efforts/",
                  segment.id, sep="")
  request <- GET(reqUri, config=config)
  return(content(request))
}
