install.packages("shiny")
library(shiny)
library(ggplot2)
library(dplyr)
# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   
  output$distPlot <- renderPlot({

    if (input$dataSource == "DataFile2006") {
      x = read.csv("pop2006.csv")
    } else {
      if(input$dataSource == "DataFile2011"){
        x = read.csv("pop2011.csv")
      }else{
        #This means do not use any data.  This will break things.
        x = NULL
      }
    }
    # generate bins based on input$bins from ui.R
    x    <- x[-1, 3] 
    bins <- seq(min(x), max(x), length.out = input$bins + 1)
    
    # draw the histogram with the specified number of bins
    hist(x, breaks = bins, xlab = 'Population', col = 'darkgray', border = 'white')
    if(input$density){
      hist(x, breaks = bins, col = 'darkgray', border = 'white', ylab="Density", freq=FALSE)
      lines(density(x),col="red")}
  })
  output$dwelPlot <- renderPlot({
    if (input$dataSource == "DataFile2006") {
      x = read.csv("pop2006.csv")
    } else {
      if(input$dataSource == "DataFile2011"){
        x = read.csv("pop2011.csv")
      }else{
        #This means do not use any data.  This will break things.
        x=NULL
      }
    }
    # generate bins based on input$bins from ui.R
    x    <- x[-1, 4]
    bins <- seq(min(x), max(x), length.out = input$bins + 1)
    # Histogram of Private Dwellings
    hist(x, breaks = bins, xlab = 'Population', main = "Private Dwellings", col = 'darkgray', border = 'white')
    if(input$density){
      hist(x, breaks = bins, col = 'darkgray', border = 'white',ylab="Density",freq=FALSE)
      lines(density(x),col="red")}
  })
  
})
