RetrieveAthlete <- function(id) {
  reqUri <- "https://www.strava.com/api/v3/athlete";
  if (!missing(id)) {
    reqUri <- paste(reqUri, "s/", id, sep="")
  }
  reqUri <- paste(reqUri, "/?resource_state=", resource.state, sep="")
  request <- GET(reqUri, config=config(token=token))
  if (request$status_code != 200) {
    print("Something wrong")
    return();
  }
  return(content(request))
}
