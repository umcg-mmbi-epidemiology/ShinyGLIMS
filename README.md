# ShinyGLIMS

R Shiny app for exploring GLIMS tables. This app is a wrapper around the `mmbi.epi` package, which contains all the core functionality.

## Overview

ShinyGLIMS provides a user-friendly interface to explore GLIMS tables through a Shiny web application. All the data processing and visualization logic is implemented in the `mmbi.epi` package, and this repository serves as a deployment wrapper.

## Installation

To run this app locally, you need to have R installed along with the following packages:

```r
# Install dependencies
install.packages("shiny")

# Install mmbi.epi from GitHub
# remotes::install_github("umcg-mmbi-epidemiology/mmbi.epi")
```

## Running Locally

To run the app locally:

```r
# Option 1: Using shiny::runApp()
shiny::runApp(".")

# Option 2: Open app.R in RStudio and click "Run App"
```

## Deploying to Posit Connect

This app is designed to be deployed to Posit Connect. To deploy:

1. Ensure you have the `rsconnect` package installed:
   ```r
   install.packages("rsconnect")
   ```

2. Configure your Posit Connect account:
   ```r
   rsconnect::setAccountInfo(
     name = "your-account",
     token = "your-token",
     secret = "your-secret"
   )
   ```

3. Deploy the app:
   ```r
   rsconnect::deployApp(
     appDir = ".",
     appName = "ShinyGLIMS",
     forceUpdate = TRUE
   )
   ```

## Dependencies

- R (>= 4.0.0)
- shiny
- mmbi.epi (from umcg-mmbi-epidemiology GitHub organization)

## License

MIT
