# Deployment Helper Script for Posit Connect
# This script helps deploy the ShinyGLIMS app to Posit Connect

# This file can be sourced to set up deployment configuration
# Usage: source("deploy.R")

deploy_to_posit_connect <- function(
    account_name = NULL,
    server_url = NULL,
    app_name = "ShinyGLIMS",
    force_update = TRUE) {
  
  # Check if rsconnect package is installed
  if (!requireNamespace("rsconnect", quietly = TRUE)) {
    stop("The 'rsconnect' package is required for deployment.\n",
         "Install it with: install.packages('rsconnect')")
  }
  
  # Load rsconnect
  library(rsconnect)
  
  # If account_name and server_url are provided, configure the account
  if (!is.null(account_name) && !is.null(server_url)) {
    message("Note: You need to configure your account credentials separately using:")
    message("rsconnect::setAccountInfo(name = '", account_name, 
            "', token = 'YOUR_TOKEN', secret = 'YOUR_SECRET')")
  }
  
  # Deploy the application
  message("Deploying ShinyGLIMS to Posit Connect...")
  rsconnect::deployApp(
    appDir = ".",
    appName = app_name,
    forceUpdate = force_update,
    launch.browser = FALSE
  )
  
  message("Deployment complete!")
}

# Example usage (uncomment and customize):
# deploy_to_posit_connect(
#   account_name = "your-account",
#   server_url = "https://your-server.com",
#   app_name = "ShinyGLIMS",
#   force_update = TRUE
# )
