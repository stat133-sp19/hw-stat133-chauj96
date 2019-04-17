# Workout 02: Shiny App
# The purpose of this assignment is to create a shiny app that allows us to visualize in an
# interactive way some of the saving/investing scenarios considered in warmup06.


library(shiny)

# Input Widgets
ui <- fluidPage(
  
  titlePanel("Investing Modalities"),
  
  fluidRow(
    column(3,
           sliderInput("amount",
                       "Initial Amount",
                       min = 0,
                       max = 100000,
                       step = 500,
                       value = 1000),
           
           sliderInput("contribution",
                       "Annual Contribution",
                       min = 0,
                       max = 50000,
                       step = 500,
                       value = 2000)),
    
    column(4,
           sliderInput("return",
                       "Return Rate (in %)",
                       min = 0,
                       max = 20,
                       step = 0.1,
                       value = 5),
           
           sliderInput("growth",
                       "Growth Rate (in %)",
                       min = 0,
                       max = 20,
                       step = 0.1,
                       value = 2)),
    
    column(4,
           sliderInput("years",
                       "Years",
                       min = 0,
                       max = 50,
                       step = 1,
                       value = 10),
           
           selectInput("facet", label = "Facet?", 
                       choices = list("Yes" = 1, "No" = 2), 
                       selected = 2))
    
  ),
  
    mainPanel(
      h3("Timelines"),
      plotOutput("distPlot1", width = "150%"),
      h3("Balances"),
      verbatimTextOutput("Balances")
  )
)


# Timeline Graphs
library(ggplot2)
library(reshape2)

server <- function(input, output) {
  
  output$distPlot1 <- renderPlot({
    
    return_rate <- input$return / 100
    return_grow <- input$growth / 100
    
    # fv function
    fv <- function(amount = 0){
      total <- 0
      for (i in 0:input$years) {
        total[i+1] <- input$amount * (1 + return_rate)^i
      }
      total
    }
    
    # fva function
    fva <- function(contribution = 0){
      total <- 0
      for (i in 1:input$years) {
        total[i+1] <- input$contribution * ((1 + return_rate)^i - 1) / return_rate
      }
      total
    }
    
    # fvga function
    fvga <- function(contribution = 0){
      total <- 0
      for (i in 0:input$years) {
        total[i+1] <- input$contribution * ((1 + return_rate)^i - (1 + return_grow)^i) / (return_rate - return_grow)
      }
      total
    }
    
    # create a data frame of modalities
    modalities <- data.frame(year = c(0:input$years), no_contrib = c(fv(amount = input$amount)), 
                             fixed_contrib = c(fva(contribution = input$contribution) + fv(amount = input$amount)), 
                             growing_contrib = c(fv(amount = input$amount) + fvga(contribution = input$contribution)))
    
    
    # a select option to determine whether the timeline graphs should be facetted or not
    if(input$facet == 2){
      ggplot(data = modalities, aes(x = year, colour = variable)) + 
        geom_line(aes(y = no_contrib, colour = "no_contrib")) + 
        geom_line(aes(y = fixed_contrib, colour = "fixed_contrib")) + 
        geom_line(aes(y = growing_contrib, colour = "growing_contrib")) + 
        geom_point(aes(y = no_contrib, colour = "no_contrib")) + 
        geom_point(aes(y = fixed_contrib, colour = "fixed_contrib")) + 
        geom_point(aes(y = growing_contrib, colour = "growing_contrib")) + 
        scale_x_continuous(breaks = seq(0,input$years,2.5)) + 
        xlab("year") + 
        ylab("value") + 
        ggtitle("Three modes of investing")
    } else {
      modalities2 <- melt(modalities, id = "year")
      colnames(modalities2)[2] <- 'modality'
      colnames(modalities2)[3] <- 'balance'
      
      ggplot(modalities2, aes(x = year, y = balance)) +
        geom_line(aes(color = modality)) +
        geom_point(aes(color = modality)) +
        facet_wrap(~modality) +
        labs(title = "Three modes of investing") +
        geom_area(aes(fill = modality), alpha = 0.5) +
        theme_bw() +
        ylab("value")
    }
    
    
  })
  
  
  # Balance Table
  output$Balances <- renderPrint({
    return_rate <- input$return / 100
    return_grow <- input$growth / 100
    
    # fv function
    fv <- function(amount = 0){
      total <- 0
      for (i in 0:input$years) {
        total[i+1] <- input$amount * (1 + return_rate)^i
      }
      total
    }
    
    # fva function
    fva <- function(contribution = 0){
      total <- 0
      for (i in 0:input$years) {
        total[i+1] <- input$contribution * ((1 + return_rate)^i - 1) / return_rate
      }
      total
    }
    
    # fvga function
    fvga <- function(contribution = 0){
      total <- 0
      for (i in 0:input$years) {
        total[i+1] <- input$contribution * ((1 + return_rate)^i - (1 + return_grow)^i) / (return_rate - return_grow)
      }
      total
    }
    
    # call the modalities table
    modalities <- data.frame(year = c(0:input$years), no_contrib = c(fv(amount = input$amount)), 
                             fixed_contrib = c(fva(contribution = input$contribution) + fv(amount = input$amount)), 
                             growing_contrib = c(fv(amount = input$amount) + fvga(contribution = input$contribution)))
    
    modalities
  })
}




# Run the application 
shinyApp(ui = ui, server = server)