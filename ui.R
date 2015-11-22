library(shiny)

shinyUI(
    navbarPage("Creating a Generic Linear Model on the mtcars dataset",
               tabPanel("Your Shiny Application",
                        h1(tags$hr("Your Shiny Application")),
                        hr(),
                        tags$ol(
                            tags$li("Write a shiny application with associated supporting documentation. The documentation should be thought of as whatever a user will need to get started using your application."), 
                            tags$li("Deploy the application on Rstudio's shiny server"), 
                            tags$li("Share the application link by pasting it into the text box below"),
                            tags$li("Share your server.R and ui.R code on github")
                            ),
               tags$div(
                   tags$p("The application must include the following:"),
                   tags$ol(
                       tags$li("Some form of input (widget: textbox, radio button, checkbox, ...)"), 
                       tags$li("Some operation on the ui input in sever.R"), 
                       tags$li("Some reactive output displayed as a result of server calculations"),
                       tags$li("You must also include enough documentation so that a novice user could use your application."),
                       tags$li("The documentation should be at the Shiny website itself. Do not post to an external link.")
                   ),
                   tags$p("The Shiny application in question is entirely up to you. However, if you're having trouble coming up with ideas, you could start from the simple prediction algorithm done in class and build a new algorithm on one of the R datasets packages. Please make the package simple for the end user, so that they don't need a lot of your prerequisite knowledge to evaluate your application. You should emphasize a simple project given the short time frame.  ")
               ),
               h3("My Solution"),
               tags$div(
                   tags$p("Using the mtcars dataset available from the datasets package, build a regression model which allows you to iteratively select components of a model and evaluate different models manually")
               )),
               tabPanel("Examining the data",
                        h1(tags$hr("Examining the data")),
                        hr(),
                        h2("Description"),
                        hr(),
                        helpText("The data was extracted from the 1974 Motor Trend
                                US magazine and comprises fuel consumption and 10 
                                aspects of automobile design and performance
                                for 32 automobiles (1973–74 models)."),
                        h2("Format"),
                        hr(),
                        p("A data frame with 32 observations on 11 variables. Below is a brief explaination of each variable."),
                        tags$ol(
                            tags$li(tags$b("mpg"), "Miles/(US) gallon"), 
                            tags$li(tags$b("cyl"),	 "Number of cylinders"), 
                            tags$li(tags$b("disp"),	 "Displacement (cu.in.)"),
                            tags$li(tags$b("hp"),	 "Gross horsepower"),
                            tags$li(tags$b("drat"),	 "Rear axle ratio"),
                            tags$li(tags$b("wt"),	 "Weight (lb/1000)"),
                            tags$li(tags$b("qsec"),	 "1/4 mile time"),
                            tags$li(tags$b("vs"),	 "V/S"),
                            tags$li(tags$b("am"),	 "Transmission (0 = automatic, 1 = manual)"),
                            tags$li(tags$b("gear"),	 "Number of forward gears"),
                            tags$li(tags$b("carb"),	 "Number of carburetors")
                        ),
                       
                        
                        fluidPage(
                            h2("What the data looks like"),
                            hr(),
                            fluidRow (
                                column (
                                    12,
                                    p (
                                        paste (
                                            "Below is an example of what the first three rows of the dataset looks like, including the id variable, which specifies the name of each car."
                                        )
                                    ),
                                    br(),
                                    tableOutput('data')
                                   
                                )
                               
    
                        ))),
               tabPanel("Create the regression model",
                        h1(tags$hr("Create the regression model")),
                        hr(),
                            fluidRow (
                                column (
                                    4,
                                    p (
                                        br(),
                                        paste (
                                            "Please select the variables you would like to include in the regression model.",
                                            "You can use the right hand side of the screen to validate the accuracy"
                                        )
                                    ),
                                    checkboxGroupInput (
                                        "predictors",
                                        "Choose predictor(s):",
                                        names(mtcars)[-1]
                                    )
                                ),
                                column (
                                    5,
                                    offset = 1,
                                    verbatimTextOutput('fit')
                                ))),
               tabPanel("Examine the residuals",
                        h1(tags$hr("Examine the residuals")),
                        hr(),
                        fluidRow ( 
                        column (
                            4,
                            plotOutput('plot1')
                        ),
                        column (
                            4,
                            plotOutput('plot2')
                        ),
                        column (
                            4,
                            plotOutput('plot3')
                        ),
                        column (
                            4,
                            plotOutput('plot4')
                        ),
                        column (
                            4,
                            plotOutput('plot5')
                        ),
                        column (
                            4,
                            plotOutput('plot6')
                        )
               )
               )
               )
    )

