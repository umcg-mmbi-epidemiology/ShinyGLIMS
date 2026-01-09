# ShinyGLIMS App
# This is a wrapper around the mmbi.epi package Shiny functionality

# Load required packages
library(shiny)
library(mmbi.epi)

# Run the Shiny app from mmbi.epi package
tryCatch({
  mmbi.epi::glims_shiny_picker()
}, error = function(e) {
  # Provide a helpful error message in the UI
  ui <- fluidPage(
    titlePanel("ShinyGLIMS - Configuration Error"),
    mainPanel(
      h3("Unable to load the application"),
      p("There was an error loading the Shiny app from the mmbi.epi package."),
      h4("Error message:"),
      pre(as.character(e)),
      hr(),
      p("Please ensure that:"),
      tags$ul(
        tags$li("The ", code("mmbi.epi"), " package is properly installed"),
        tags$li("The package runs ", code("glims_shiny_picker()"), " without error"),
        tags$li("All dependencies are available")
      )
    )
  )
  server <- function(input, output, session) {}
  shinyApp(ui = ui, server = server)
})
