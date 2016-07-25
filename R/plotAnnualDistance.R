PlotAnnualDistance <- function() {

  activities <- ListAthleteActivities()

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
}
