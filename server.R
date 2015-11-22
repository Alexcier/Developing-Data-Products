library(shiny)
library(datasets)
data("mtcars")
options(warn = -1)

glModel <- function(predictors) {
    if ( !is.null(predictors) ) {
        f <- paste(names(mtcars)[1], '~', paste(predictors, collapse = ' + '))
        glm(formula = f, data = mtcars)
    } else {
        NA
    }
}

plotMod <- function(fit, n) {
    if ( !is.na(fit) ) {
        plot(fit, which = n)
    }
}

statInfo <- function(fit) {
    if( !is.na(fit) ) {
        summary(fit)
    }
}

shinyServer(
    function(input, output) {
        output$data <- renderTable(head(mtcars, 3))        
        fit <- reactive(glModel(input$predictors))
        output$fit <- renderPrint(statInfo(fit()))
        output$plot1 <- renderPlot(plotMod(fit(), 1))
        output$plot2 <- renderPlot(plotMod(fit(), 2))
        output$plot3 <- renderPlot(plotMod(fit(), 3))
        output$plot4 <- renderPlot(plotMod(fit(), 4))
        output$plot5 <- renderPlot(plotMod(fit(), 5))
        output$plot6 <- renderPlot(plotMod(fit(), 6))
    }
)