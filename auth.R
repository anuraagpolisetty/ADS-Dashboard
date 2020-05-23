library("googledrive")
library("googlesheets4") # I am using the developing version 0.2.0
library("shiny")

# Root folder for storing all files:
# Title: "ADS Survey Responses"
# adsCenterData@gmail.com
# Password: Kingcounty1

# After downloading this directory, follow the steps below to authenticate the correct google account.
# Run each line specified by moving your cursor to the line and pressing 'Ctrl + Enter'

########### STEP ONE 
# Declare a folder '.secrets' to store the token in
options(gargle_oauth_cache = ".secrets") # 
# options(gargle_quiet = FALSE) # So you can know what is happening

########### STEP TWO
# Generate a token to store inside the '.secrets' folder
# drive_auth() # Authenticate to produce the token in the cache folder (comment after generating)
# Set googlesheets to access to the same token produced
# gs4_auth(token = drive_token()) #(comment after authenticating)

########### STEP THREE
# Comment lines 20 and 22 and uncomment lines 29 and 30
# You tell gargle to search the token in the secrets folder and to look
# for an auth given to a certain email (enter your email linked to googledrive!)
# drive_auth(cache = ".secrets", email = "adscenterdata@gmail.com")
drive_auth(cache = ".secrets", email = TRUE) # Use only if EXACTLY 1 email is preauthorized
gs4_auth(token = drive_token())
options(
  gargle_oauth_cache = ".secrets",
  gargle_oauth_email = TRUE
)
# test
# drive_ls()


# THIRD STEP---

# Add these lines in any downstream google functions if necessary
# options(
#   gargle_oauth_cache = ".secrets",
#   gargle_oauth_email = TRUE
# )

# Now you can deploy your app in shinyapps.io!!
# Test if your app runs properly in the local version
# Authenticate in ShinyApps.io
# rsconnect::setAccountInfo(name="<ACCOUNT>", token="<TOKEN>", secret="<SECRET>")





