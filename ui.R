library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Population Data"),
  # Include radio buttons  (Only one of these can be selected)
  # These radioButtons are used in the server as an input variable called
  # 'dataSource'
  radioButtons("dataSource", "",
               c("Data Source 2006" = "DataFile2006",
                 "Data Source 2011" = "DataFile2011")),
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
        # This is a slider for the number of bins
        #The value determined here will be used as an input in server.R
        #It starts at a value of 30
        #by default it will grow by 1 but here I specify that it will step by 2
        # The format is
        #sliderInput(VariableName, Stuff2WriteInTheWebPage, MinimumValue,MaxValue,Default,StepIncrement)
        sliderInput("bins",  #This is the variable name, the value of which is determined by the slider.
            "Number of bins:",#Label on the html page
            min = 1,#minimum for the slider
            max = 50,#maximum for the slider
            value = 30,#default value
            step=2), #slider increments
        numericInput("bins", "x-axis minimum:", 0),
        numericInput("bins", "x-axis maximum value:", 1000000),
        checkboxInput("density","Add density plot?",value = FALSE)
        ),
    
    # Show a plot of the generated distribution
    mainPanel(
      
      tabsetPanel(type = "tabs",
                  tabPanel("Population", plotOutput("distPlot")),
                  tabPanel("Private Dwellings", plotOutput("dwelPlot"))
      ))
  ))
)
