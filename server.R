library(shiny)

# Adapted in part from code in Shiny built-in example #4, which can be viewed
# by typing 'runExample("04_mpg")' at the command line

shinyServer(function(input, output) {

     # Specifies plotting formula of user-selected variables
     formulaText <- reactive({
          paste(input$variable1, "~", input$variable2)
     })
     
     values <- reactiveValues()

     # Identifies row of data frame based on user-selected country and year
     getrow <- reactive({
          values$row <- which((world1$country == input$country) & (world1$year == input$year))
     })
     
     # Identifies columns of data frame based on user-selected variables
     getcol1 <- reactive({
          if (input$variable1 == "pop") {values$col1 <- 6}
          if (input$variable1 == "gdp") {values$col1 <- 7}
          if (input$variable1 == "sr") {values$col1 <- 8}
     })
     getcol2 <- reactive({
          if (input$variable2 == "pop") {values$col2 <- 6}
          if (input$variable2 == "gdp") {values$col2 <- 7}
          if (input$variable2 == "sr") {values$col2 <- 8}
     })

     # Captions to show variable values in text
     output$caption2 <- renderText({
          getrow()
          getcol1()
          world1[values$row, values$col1]
     })
     output$caption3 <- renderText({
          getrow()
          getcol2()
          world1[values$row, values$col2]
     })

     # Scatterplot of user-selected variables
     output$worldplot <- renderPlot({
          plot(as.formula(formulaText()), data = world1, pch = 16)
          abline(h = world1[values$row, values$col1], col = 2, lwd = 3)
          abline(v = world1[values$row, values$col2], col = 2, lwd = 3)
     })
})
