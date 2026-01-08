# ShinyGLIMS App
# This is a wrapper around the mmbi.epi package Shiny functionality

# Load required packages
library(shiny)
library(mmbi.epi)

# Check if mmbi.epi exports a run function
if (exists("run_glims_app", where = asNamespace("mmbi.epi"), mode = "function")) {
  # Use the run function if available
  mmbi.epi::run_glims_app()
} else {
  # Otherwise, use separate UI and server components
  # Get UI and server from mmbi.epi package
  ui <- mmbi.epi::glims_ui()
  server <- mmbi.epi::glims_server
  
  # Run the app
  shinyApp(ui = ui, server = server)
}
