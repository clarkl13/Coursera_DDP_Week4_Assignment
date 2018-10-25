#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(tidyverse)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Wine Reviews Data - WineEnthusiast 2017"),
  
  # Sidebar with a input drop down boxes for catogorites 
  sidebarLayout(
    sidebarPanel(
       selectInput("variable", "Variable:",
                   c("Price" = "price",
                     "Points" = "points",
                     "Variety" = "variety"))
       
    ),
    
    # Show a plot of the generated distribution
    mainPanel(

        h5("This app shows data from Kraggle.com, for wine reviews from 2017 for 
                    Cabernet Sauvignon, Sauvignon Blanc, Bordeaux-style Red Blend."),
       
        h3(textOutput("caption")),
        
        plotOutput("Plot")
        
        
    )
  )
))
