library(shiny)
library(tidyverse)

Notes <- read_csv('Notes.csv')

shinyServer(
  function(input, output) {
    thematic::thematic_shiny()
    
    output$Intro <- renderText("DFT of Pitch-Class Sets")
    
    selected = reactiveVal(rep(FALSE, nrow(Notes)))
  
    observeEvent(input$c5_click, {
      clicked <- nearPoints(Notes, 
                            input$c5_click, 
                            allRows = TRUE,
                            threshold = 20)$selected_
      
      selected(as.logical(clicked + selected()))
    })
  
    observeEvent(input$c5_reset, {
      selected(rep(FALSE, nrow(Notes)))
    })
  
    dftfn_r <- function(x){
      fn <- function(y){sum(cos(-2*pi*Notes[selected(), ]$Class*y/12))}
      map_dbl(x, fn)
    }
    dftfn_i <- function(x){
      fn <- function(y){sum(sin(-2*pi*Notes[selected(), ]$Class*y/12))}
      map_dbl(x, fn)
    }
  
    cfn_r <- function(x){
      fn <- function(y){
        sum(dftfn_r(0:11)*cos(2*pi*y*(0:11)/12) -
              dftfn_i(0:11)*sin(2*pi*y*(0:11)/12)) / 12 }
      map_dbl(x, fn)
    }
  
    output$c5 <- renderPlot({
      Notes$sel <- selected()
      ggplot(Notes, aes(c5_x, c5_y)) +
        geom_text(aes(label = Name, color = sel), size = 6, show.legend = FALSE) +
        xlim(-1.5, 1.5) +
        theme_void() + 
        coord_fixed()
    }, res = 96)
    
    output$PCS <- renderText({
      selection <- Notes[selected(), ]$Class %>% str_c(collapse = ", ")
      str_c("The Pitch Class Set for your selection is: {",
            selection, 
            "}", 
            sep = "")
    })
    
    output$results <- renderTable({
      Notes$f <- as.integer(selected())
      Notes %>% 
        mutate(
          argument = as.integer(Class),
          DFT_real = dftfn_r(Class),
          DFT_imaginary = dftfn_i(Class)) %>%
        select(argument, f, DFT_real, DFT_imaginary)
    }, digits = 5)
  
    output$characplot <- renderPlot({
      Notes$sel <- as.numeric(selected())
      ggplot(Notes, aes(Class, sel)) + 
        geom_point(size = 4) + 
        geom_function(fun = cfn_r, n = 200) +
        labs(
          title = "The real part of the characteristic function for your PCS",
          y = "f(k)",
          x = "k"
        ) +
        scale_x_continuous(breaks = 0:11) +
        ylim(-1.2, 1.2)
    }, res = 96)
  
    output$DFTplot <- renderPlot({
      Notes %>% 
        mutate(dft = dftfn_r(Class)) %>%
        ggplot(aes(Class, dft)) + 
        geom_point(size = 4) + 
        geom_function(fun = dftfn_r, n = 200) +
        labs(
          title = "The real part of the DFT for your PCS",
          y = "F(x)",
          x = "x"
        ) +
        scale_x_continuous(breaks = 0:11)
    }, res = 96)
  }
)
