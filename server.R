#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(tidyverse)

data <- read.csv("Rdata/winemag-data-130k-v2.csv", stringsAsFactors = FALSE)

shiny_data <- data %>%
    transmute(country = as.factor(data$country[!is.na(data$country)]),
              points = as.numeric(data$points[!is.na(data$points)]),
              price = price,
              variety = data$variety[!is.na(data$variety)]) %>%
    subset(data$variety == "Cabernet Sauvignon" | data$variety == "Sauvignon Blanc" | data$variety == "Bordeaux-style Red Blend")

shiny_data$variety <- as.factor(shiny_data$variety)  

# Define server logic required to draw a plots
shinyServer(function(input, output) {
   
    formulaText <- reactive({
        paste(input$variable, "~ variety")
    })
    
    output$caption <- renderText({
        formulaText()
    })
    
    output$Plot <- renderPlot({
        plot(as.formula(formulaText()),
             data = shiny_data,
             col = "blue",
             pch = 19)
    })
    
 
 })
