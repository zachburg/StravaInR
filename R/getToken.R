# requests token from Strava
# name, clientID, and clientSecret are unique to the user
# and must be retrieved from the Strava API settings page

GetToken <- function(name, clientID, clientSecret) {
  library(httr)
  endpoints <- oauth_endpoint(request="https://www.strava.com/oauth/authorize?",
                              authorize="https://www.strava.com/oauth/authorize",
                              access="https://www.strava.com/oauth/token")

  stravaApp <- oauth_app(appname=name, key=clientID, secret=clientSecret)
  token <- oauth2.0_token(endpoint = endpoints, app=stravaApp)
  return(config(token = token))
}
