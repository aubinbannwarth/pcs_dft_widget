library(shiny)

shinyUI(fluidPage(
  theme = bslib::bs_theme(bootswatch = "darkly"),
  titlePanel("Characteristic Function and Discrete Fourier Transform of a Pitch Class Sets"),
  fluidRow(
    column(8,
           h3("Click on a note on the circle of fifths to add it to your selection."),
           h4("Double click anywhere within the circle to reset."),
           h5("Use enharmonic equivalents where necessary."),
           plotOutput("c5", click = "c5_click", dblclick = "c5_reset"),
           h3(textOutput("PCS")),
    ),
    column(4, 
           h3("Results"),
           h4("The characteristic function, f, of your PCS and its DFT are tabulated below:"),
           tableOutput("results")
    ),
  ),
  fluidRow(
    column(6, plotOutput("characplot")),
    column(6, plotOutput("DFTplot"))
  )
))
