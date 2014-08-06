library(shiny)
data(iris)
library(nnet)
set.seed(123)
x <- iris[sample(1:nrow(iris)),] ## sample to create a training a test set
train <- x[1:120,] 
test <- x[121:150,]
model_nnet <- nnet(Species~., data=train, size=10)


irispred <- function(sl,sw,pl,pw) {
  test=data.frame(Sepal.Length=sl,Sepal.Width=sw,Petal.Length=pl,Petal.Width=pw)
  predict(model_nnet, test, type="class") 
}

answerResult <- function(sl,sw,pl,pw, prediction) {
  test=data.frame(Sepal.Length=sl,Sepal.Width=sw,Petal.Length=pl,Petal.Width=pw)
  res=predict(model_nnet, test, type="class") 
  if (res==prediction)
    "Answer is Correct"
  else
    "Answer is Wrong"
}


shinyServer(
  function(input, output) {
    output$prediction <- renderPrint({input$id2})
    output$result <- renderPrint({irispred(input$sl,input$sw,input$pl,input$pw)})
    output$answer <- renderPrint({answerResult(input$sl,input$sw,input$pl,input$pw,input$id2)})
    
  }
)
