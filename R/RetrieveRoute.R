RetrieveRoute <- function(route.id) {
  reqUri <- paste("https://www.strava.com/api/v3/routes/", route.id, sep = "")
  request <- GET(reqUri, config=config)
  return(content(request))
}
