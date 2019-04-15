library(shiny)
library(ggplot2)
library(tidyr)

ui <- fluidPage(
  titlePanel("Annual Balances of Each Savings-Investing Modality"),
  
  fluidRow(
    column(4,
           sliderInput("amount",
                       "Initial Amount",
                       min = 0,
                       max = 100000,
                       step = 500,
                       value = 1000,
                       pre = "$", sep = ","),
           sliderInput("contrib",
                       "Annual Contribution",
                       min = 0,
                       max = 50000,
                       step = 500,
                       value = 2000,
                       pre = "$",sep = ",")
           ),
    
    column(4,
           sliderInput("return.rate",
                       "Return Rate(in %)",
                       min = 0,
                       max = 20,
                       step = 0.1,
                       value = 5),
           
           sliderInput("growth.rate",
                       "Growth Rate (in %)",
                       min = 0,
                       max = 20,
                       step = 0.1,
                       value = 2)),
    
    column(4,
           sliderInput("year",
                       "Years",
                       min = 0,
                       max = 50,
                       step = 1,
                       value = 20),
           selectInput("choice",
                       "Facet?",
                       c("Yes","No"), "No"))
  
  ),
  
  hr(),
  
  h3("Timelines"),
  plotOutput("timegraph"),
  
  h3("Balances"),
  verbatimTextOutput("balance")
  
)

server <- function(input, output) {
  
  # create a data frame
  modalities <- reactive({
    annuity <- function(contrib, rate, years){
      return(contrib * ((((1 + rate)^years) - 1) / rate))
    }
    
    growing_annuity <- function(contrib,rate,growth,years){
      return(contrib * (((1+rate)^(years) - (1+growth)^(years))/(rate - growth)))
    }
    
    future_value <- function(amount, rate, years){
      return(amount*(1+rate)^years)
    }
    
    year <- NULL
    no_contrib <- NULL
    fixed_contrib <- NULL
    growing_contrib <- NULL
    
    for(i in 0:input$year){
      year[i+1] <- i
      no_contrib[i+1] <- future_value(amount = input$amount,
                                      rate = (input$return.rate)/100, years = i)
      fixed_contrib[i+1] <- annuity(contrib = input$contrib, 
                                    rate = (input$return.rate)/100, years = i) + no_contrib[i+1]
      growing_contrib[i+1] <- growing_annuity(contrib = input$contrib, rate = (input$return.rate)/100, 
                                              growth = (input$growth.rate)/100,
                                              years = i) + no_contrib[i+1]
    }
    
    modalities <- data.frame(year, no_contrib, fixed_contrib, growing_contrib)
    return(modalities)
  })
  
  # tidy the data
  tidy.model <- reactive({
    tidy.model <- gather(modalities(), key, value, no_contrib, fixed_contrib, growing_contrib)
    
    tidy.model$key <- factor(tidy.model$key,
                             levels = c("no_contrib","fixed_contrib","growing_contrib"))
    return(tidy.model)
  })
  
  output$timegraph <- renderPlot({
    if(input$choice == "Yes"){
      ggplot(tidy.model(), aes(x = year , y = value, col = key, fill = key)) +
        geom_point(size = 0.8) + geom_line() + 
        geom_area(alpha = 0.5) +
        labs(x = "Time (in year)", 
             y = "Annual Balances", 
             title = "Three modes of investing (with faceting)") + 
        facet_wrap(~ key) +
        scale_color_discrete(name = "Modality") +
        scale_fill_discrete(name = "Modality")
    }else{
      ggplot(tidy.model(), aes(x = year , y = value, col = key)) +
      geom_line() + geom_point(size = 0.8) +
      labs(x = "Time (in year)", 
           y = "Annual Balances", 
           title = "Three modes of investing") +
        scale_color_discrete(name = "Modality")
    }
  })
  
  output$balance <- renderPrint({
    modalities()
  })
  
}

shinyApp(ui = ui, server = server)

