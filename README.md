# ShinyGLIMS

R Shiny app for exploring GLIMS tables. This app is a wrapper around the `mmbi.epi` package, which contains all the core functionality.

## Overview

ShinyGLIMS provides a user-friendly interface to explore GLIMS tables through a Shiny web application. All the data processing and visualization logic is implemented in the `mmbi.epi` package, and this repository serves as a deployment wrapper.

## Installation

```r
# Install from GitHub
# remotes::install_github("umcg-mmbi-epidemiology/ShinyGLIMS")
```

## Running Locally

To run the app locally:

```r
# Option 1: Using shiny::runApp()
shiny::runApp(".")

# Option 2: Open app.R in RStudio and click "Run App"
```
