RetrieveAthlete <- function(id) {
  reqUri <- "https://www.strava.com/api/v3/athlete";
  if (!missing(id)) {
    reqUri <- paste(reqUri, "s/", id, sep="")
  }
<<<<<<< HEAD:R/RetrieveAthlete.R
  request <- GET(reqUri, config=config)
=======
  request <- GET(reqUri, config=config(token=token))
>>>>>>> ecc8813aefe76ffa8cda2587c6ff047705853830:R/base/RetrieveAthlete.R
  if (request$status_code != 200) {
    print("Something wrong")
    return();
  }
  return(content(request))
}
