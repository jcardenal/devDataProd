library(shiny)
shinyUI(pageWithSidebar(
  headerPanel("MPG prediction"),
  sidebarPanel(
    textInput("model","Model:"),
    helpText("Enter car model's"),
    selectInput("cyl", "Cylinders:", choices = c(4,5,6,8)),
    helpText("Number of cylinders; choose one"),
    numericInput('disp','Displacement:',50,min=50,max=500,step=0.1),
    helpText("Displacement (cu. in.); enter value in range 50 - 500"),
    numericInput('hp','Horsepower:',50,min=50,max=500,step=0.1),
    helpText("Gross horsepower; enter value in range 50 - 500"),
    numericInput('drat','DRAT:',2,min=2,max=8,step=0.01),
    helpText("Rear axle ratio; enter value in range 2-8"),
    numericInput('wt','Weight:',1,min=1,max=8,step=0.001),
    helpText("Weight (lb/1000); enter value in range 1-8"),
    numericInput('qsec','Acceleration:',8,min=8,max=30,step=0.1),
    helpText("1/4 mile time; enter value in range 8-30"),
    selectInput("vs", "V/S:", choices = c("V" = 0,"S" =1)),
    helpText("V/S; choose one value"),
    selectInput("am", "Transmission:", choices = c("Automatic" = 0,"Manual" =1)),
    helpText("Transmission type; choose one value"),
    selectInput("gear", "Gears:", choices = c(3,4,5)),
    helpText("Number of forward gears; choose one value"),
    selectInput("carb", "Carburetors:", choices = c(1,2,3,4,6,8)),
    helpText("Number of carburetors; choose one value"),
    submitButton("Go!"),
    helpText("Click to predict for these values")
   
  ),
  mainPanel(
    helpText("Enter the required values on the left panel, and get the corresponding prediction in this panel"),
    h3('Car model being predicted:'),
    tableOutput("inputData"),
    h3("MPG (miles per gallon) predicted value:"),
    h4(textOutput("ompg")),
    h4('Observed cars (for your reference):'),
    tableOutput("obs")
  )
))