library(shiny)
# following loads variables
# mtcars : base data
# fit : GLM model from mtcars
# t : variable to predict mpg for
library(caret)
load("model.RData")

# build comparison table
# ordering for mpg
x <- order(mtcars$mpg)
obs <- data.frame(mtcars$mpg[x],row.names(mtcars)[x])
names(obs) <- c("MPG","Model")

shinyServer(
  function(input, output) {
    
    output$omodel <- renderPrint({input$model})
    
    dataInput <- reactive({
    t$cyl <- as.numeric(input$cyl)
    
    t$disp <- input$disp
    t$hp <- input$hp
    t$drat <- input$drat
    t$wt <- input$wt
    t$qsec <- input$qsec
    t$vs <- as.numeric(input$vs)
    t$am <- as.numeric(input$am)
    t$gear <- as.numeric(input$gear)
    t$carb <- as.numeric(input$carb)
    row.names(t) <- input$model
    
    t[,-1]
    })
    
    # Generate a prediction for the dataset
    output$ompg <- renderText({
      x <- dataInput()
      predict(fit,x)
    })
    
    output$inputData <- renderTable({
      dataInput()
    })
    
    output$obs <- renderTable({obs})
    
  })