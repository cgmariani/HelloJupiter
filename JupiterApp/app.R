#
#
# Shiny Apps
#
#

# Deploying to Shinnyapps.io
path <- "C:/Users/User Ambev/Desktop/Stats/HelloWorld/HelloJupiter/JupiterApp"
install.packages("rsconnect")
library(rsconnect)
library(shiny)
rsconnect::setAccountInfo(name='cgmariani',
                          token='4645870327DD7ABF66E492999A259754',
                          secret='2q3uTWpOF3uY5PvZTpMr4YQlre8Lu/33cw9Tn2U5')
rsconnect::deployApp(path)

# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("Jupiter App"),

    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
            sliderInput("bins",
                        "Number of bins:",
                        min = 1,
                        max = 50,
                        value = 25)
        ),

        # Show a plot of the generated distribution
        mainPanel(
           plotOutput("distPlot")
        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {

    output$distPlot <- renderPlot({
        # generate bins based on input$bins from ui.R
        x    <- faithful[, 2]
        bins <- seq(min(x), max(x), length.out = input$bins + 1)

        # draw the histogram with the specified number of bins
        hist(x, breaks = bins, col = 'skyblue2', border = 'white')
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
