library(shiny)
shinyUI(pageWithSidebar(
  headerPanel("Iris Prediction"),
  sidebarPanel(
    numericInput('sl', 'Choose Sepal Length',value = 4.3, min = 4, max = 8, step = 0.1),
    numericInput('sw', 'Choose Sepal Width',value = 2, min = 1.5, max = 5, step = 0.1),
    numericInput('pl', 'Choose Petal Length ',value = 1, min = 0.5, max = 7, step = 0.1),
    numericInput('pw', 'Choose Petal Width ',value = 0.2, min = 0.1, max = 3, step = 0.1),
    
    tags$br(),
    tags$br(),
    
    radioButtons("id2", "Your prediction of the IRIS class is ?????",
                   c("setosa" = "setosa",
                     "versicolor" = "versicolor",
                     "virginica" = "virginica")),
    tags$br(),
    submitButton('Submit to know the real class....') 
  ),
  mainPanel(
    h3('Results......'),
    h4('You predicted:'),
    verbatimTextOutput("prediction"),
    h4('And the real class is: '),
    verbatimTextOutput("result"),
    h4('So, your answer is:'),
    verbatimTextOutput("answer"),
    
    tags$br(),
    tags$br(),
    tags$br(),
    tags$br(),
    tags$div(
      tags$h4("This is a game to predict the Iris class based on petal and sepal dimensions"), 
      tags$br(),
      tags$h4("How to play?"), 
      tags$br(),
      tags$pre("In the left panel, choose the sizes of petals and sepals\n 
Make also your prediction for the class of Iris flower \n
After the selection is done, click de Submit button \n
And you will obtain, in the rigth panel, the real class and your prediction \n
telling you, as well, if the answer was correct or not \n
..... Enjoy!!!")
    )
    
  )
))
