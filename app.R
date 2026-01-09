library(shiny)
library(mmbi.epi)


# 2026-01-09 MB
# aan de praat gekregen met:
# renv::install("umcg-mmbi-epidemiology/mmbi.epi", repos =c(Certe = "https://certe-medical-epidemiology.r-universe.dev", CRAN = "https://cran.r-project.org"))
# renv::install(c("shiny", "DT", "dplyr", "rsconnect"))
# renv::install("certegis", repos =c(Certe = "https://certe-medical-epidemiology.r-universe.dev", CRAN = "https://cran.r-project.org"))
# renv::snapshot()
# rsconnect::deployApp()

tryCatch({
  mmbi.epi:::glims_shiny_picker()
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
