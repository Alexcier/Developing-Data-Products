WWWusage
head(WWWusage)
airmiles
cars
head(cars)
nhtemp
head(nhtemp)
occupationalStatus
head(sleep)
volcano
ls(volcano)
LifeCycleSavings
EuStockMarkets
head(EuStockMarkets)
data("cars")
head(mtcars)
mtcars

#eu stock markets is the winner
#Daily Closing Prices of Major European Stock Indices, 1991-1998
fitLinearModel <- function(predictors) {
    if ( !is.null(predictors) ) {
        f <- paste(names(mtcars)[8], '~', paste(predictors, collapse = ' + '))
        glm(formula = f, data = mtcars)
    } else {
        NA
    }
}


plotModel <- function(fit, n) {
    if ( !is.na(fit) ) {
        plot(fit, which = n)
    }
}

summarizeModel <- function(fit) {
    if( !is.na(fit) ) {
        summary(fit)
    }
}
plotModel

data(EuStockMarkets)
names(EuStockMarkets)
head(EuStockMarkets)
EuStockMarkets 
colnames(EuStockMarkets)[1] <- "Year"

esm <- EuStockMarkets
tmp <- EuStockMarkets[,2]
smi <- ts(esm, start=start(esm), freq=frequency(esm))
plot(smi, main="SMI Daily Closing Value") 

lret.smi <- diff (log(smi))
plot(lret.smi, main="SMI Log-Returns") 
fit <- lm()


# server
library(shiny)
library(datasets)
data("mtcars")
options(warn = -1)

fitLinearModel <- function(predictors) {
    if ( !is.null(predictors) ) {
        f <- paste(names(mtcars)[1], '~', paste(predictors, collapse = ' + '))
        glm(formula = f, data = mtcars)
    } else {
        NA
    }
}


plotModel <- function(fit, n) {
    if ( !is.na(fit) ) {
        plot(fit, which = n)
    }
}

summarizeModel <- function(fit) {
    if( !is.na(fit) ) {
        summary(fit)
    }
}

shinyServer(
    function(input, output) {
        output$data <- renderTable(head(mtcars, 6))        
        fit <- reactive(fitLinearModel(input$predictors))
        output$fit <- renderPrint(summarizeModel(fit()))
        output$plot1 <- renderPlot(plotModel(fit(), 6))
        output$plot2 <- renderPlot(plotModel(fit(), 5))
        output$plot3 <- renderPlot(plotModel(fit(), 4))
        output$plot3 <- renderPlot(plotModel(fit(), 4))
    }
)

#ui
library(shiny)

library(datasets)
data("mtcars")

shinyUI (
    fluidPage (
        title = "Daily Closing Prices of Major European Stock Indices, 1991-1998",
        h1("Linear Regression on the European Stock Indices"),
        fluidRow (
            column (
                5,
                h3('Data Set Sample'),
                p (
                    paste (
                        'data pertaining to european stock market prices from',
                        '1991-1998 will be used to predict the next period of times',
                        'outcome. Whilst shorter selections of timespan will be more accurate',
                        'longer series will be less so. The data takes this form'
                    )
                ),
                br(),
                tableOutput('data'),
                p (
                    br(),
                    paste (
                        'Please select the length of the time you would like to predict'
                    )
                )
            ),
            column (
                5,
                offset = 1,
                verbatimTextOutput('fit')
            )
        ),
        fluidRow (
            column (
                2,
                checkboxGroupInput (
                    "predictors",
                    "Choose predictor(s):",
                    names(mtcars)[-1]
                )
            ),
            column (
                3,
                plotOutput('plot1')
            ),
            column (
                3,
                plotOutput('plot2')
            ),
            column (
                3,
                plotOutput('plot3')
            ),
            column (
                3,
                plotOutput('plot4')
            )
        )
    )
)