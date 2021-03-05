
library(shiny)
library(tidyverse)
library(stargazer)
library(DT)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
    df <- read.csv("data/framingham.csv")
    df2 <- df %>%
        select("TOTCHOL","SYSBP","DIABP","HEARTRTE","BMI","GLUCOSE")
    
    #tab1
    output$mytable <- renderDataTable(df2)
    
    #tab2
    output$myplot <- renderPlot({
        xvar <- as.numeric(input$x)
        yvar <- as.numeric(input$y)
        plot(df2[,xvar],df2[,yvar],
             main= "Scatter Plot",
             xlab = names(df2[xvar]),
             ylab = names(df2[yvar]),
             col=input$color)
        if (input$line){
            reg <- lm(df2[,yvar]~df2[,xvar])
            abline(reg)
        }
    })
    
    #tab3
    output$summary <- renderUI(HTML(stargazer(df2,type="html")))
    
    #tab4
    lm1 <- lm(TOTCHOL~SYSBP+DIABP+HEARTRTE+BMI+GLUCOSE,data=df2)
    lm2 <- lm(SYSBP~TOTCHOL+DIABP+HEARTRTE+BMI+GLUCOSE,data=df2)
    lm3 <- lm(DIABP~SYSBP+TOTCHOL+HEARTRTE+BMI+GLUCOSE,data=df2)
    lm4 <- lm(HEARTRTE~SYSBP+TOTCHOL+DIABP+BMI+GLUCOSE,data=df2)
    lm5 <- lm(BMI~SYSBP+TOTCHOL+HEARTRTE+DIABP+GLUCOSE,data=df2)
    lm6 <- lm(GLUCOSE~SYSBP+TOTCHOL+HEARTRTE+BMI+DIABP,data=df2)
    
    output$regression <- renderUI(HTML(stargazer(lm1,lm2,lm3,lm4,
                                                 lm5,lm6, type="html")))
    
    
    
})
