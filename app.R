# ShinyGLIMS App
# This is a wrapper around the mmbi.epi package Shiny functionality

# Load required packages
library(shiny)
library(mmbi.epi)

# Try to find and run the Shiny app from mmbi.epi package
# The package may export the app in different ways:
# 1. A run_*_app() function
# 2. Separate glims_ui() and glims_server() functions
# 3. Direct ui and server objects

tryCatch({
  # Check for various possible run functions
  if (exists("run_glims_app", where = asNamespace("mmbi.epi"), mode = "function")) {
    mmbi.epi::run_glims_app()
  } else if (exists("run_app", where = asNamespace("mmbi.epi"), mode = "function")) {
    mmbi.epi::run_app()
  } else if (exists("glims_ui", where = asNamespace("mmbi.epi"), mode = "function") &&
             exists("glims_server", where = asNamespace("mmbi.epi"), mode = "function")) {
    # Use separate UI and server functions
    ui <- mmbi.epi::glims_ui()
    server <- mmbi.epi::glims_server
    shinyApp(ui = ui, server = server)
  } else if (exists("ui", where = asNamespace("mmbi.epi")) &&
             exists("server", where = asNamespace("mmbi.epi"), mode = "function")) {
    # Use direct ui and server exports
    shinyApp(ui = mmbi.epi::ui, server = mmbi.epi::server)
  } else {
    stop("Could not find Shiny app components in mmbi.epi package. ",
         "Please ensure the package exports either:\n",
         "  - run_glims_app() or run_app() function, or\n",
         "  - glims_ui() and glims_server() functions, or\n",
         "  - ui and server objects")
  }
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
        tags$li("The mmbi.epi package is properly installed"),
        tags$li("The package exports the necessary Shiny components"),
        tags$li("All dependencies are available")
      )
    )
  )
  server <- function(input, output, session) {}
  shinyApp(ui = ui, server = server)
})
