RetrieveActivity <- function(id, include.all.efforts = FALSE) {
  reqUri <- paste("https://www.strava.com/api/v3/activities/", id,
                  "/?include_all_efforts=", include.all.efforts, sep="")
  request <- GET(reqUri, config=config(token=token))
  return(content(request))
}
