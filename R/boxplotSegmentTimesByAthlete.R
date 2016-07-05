boxplotSegmentTimesByAthlete <- function(segmentID, athleteID, token) {
  boxplot(getSegmentTimesByAthlete(segmentID, athleteID, token), horizontal = TRUE)
  title(main = getSegmentName(segmentID, token),
        xlab = "Time (Seconds)",
        ylab = getAthleteName(athleteID, token))
}
