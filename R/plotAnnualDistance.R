plotAnnualDistance <- function(year) {

  afterTime <- paste(year, "-01-01", sep="")
  beforeTime <- paste(year + 1, "-01-01", sep="")
  afterUnix <- as.numeric(as.POSIXct(afterTime, format="%Y-%m-%d"))
  beforeUnix <- as.numeric(as.POSIXct(beforeTime, format="%Y-%m-%d"))

  reqURI <- paste("https://www.strava.com/api/v3/athlete/activities/?after=",
                  afterUnix, "&before=", beforeUnix, sep="");
  request <- GET(reqURI, config=config(token=token))
  if (request$status_code != 200) {
    print("Something wrong with request")
    return()
  }

  activities <- fromJSON(toJSON(content(request)))

  if (length(activities) != 0) {

    activities <- activities[activities$type == "Ride", ]
    date <- as.Date(strptime(activities$start_date_local, "%Y-%m-%dT%H:%M:%S"))
    distance <- unlist(activities$distance) * 0.00062137

    data <- data.frame(date, distance)
    aggData <- aggregate(distance~date, data, sum)

    runningSum <- vector(mode="double", length=length(aggData$date))
    runningSum[1] <- aggData$distance[1]

    for (i in 2 : length(runningSum)) {
      runningSum[i] <- runningSum[i - 1] + aggData$distance[i]
    }

    plot(aggData$date, runningSum, type="s", main="Annual Distance",
         xlab="Month", ylab="Miles")
  } else {
    print(paste("No activities in", year))
  }
}
