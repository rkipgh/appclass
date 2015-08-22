library(shiny)

shinyUI(fluidPage(
     
     titlePanel("International economic measurements, 1960 - 1985"),
     
     sidebarLayout(
          sidebarPanel(
               p("Below you may select variables to be plotted on the y- and x-axes."),
               selectInput("variable1", "Variable Y:",
                           c("Gross Domestic Product (GDP)" = "gdp",
                             "Population" = "pop",
                             "Saving Rate" = "sr")),
               selectInput("variable2", "Variable X:",
                           c("Population" = "pop",
                             "Gross Domestic Product (GDP)" = "gdp",
                             "Saving Rate" = "sr")),
               p("Below you may select the country and year that you want to investigate."),
               selectInput('country', 'Country:', levels(world1$country)),
               sliderInput("year", "Year:", sep = "",
                           min = 1960, max = 1985, value = 1960, step = 1)
               ),
          
          mainPanel(
               p("This application lets you look up a country's gross domestic product
                 (GDP), population, or saving rate from 1960 - 1985.  It graphs these
                 variables so that you can see how the country during that year compared 
                 to other countries in that year or to other years."),
               p("Variable Y value:"),
               h3(textOutput("caption2")),
               p("Variable X value:"),
               h3(textOutput("caption3")),
               p("The intersection of the red lines identifies the data point on
                 the graph."),
               plotOutput("worldplot"),
               p("Data from the 'SumHes' data set from the R 'Ecdat' package."),
               p("'pop' = country's population (in thousands)"),
               p("'gdp' = real GDP per capita (in 1985 US dollars)"),
               p("'sr' = saving rate (in percent)"),
               p("Note:  If the same variable is selected as both the Y and the 
                 X variable, the graph will plot that variable against the 'Index',
                 or the order in which the data is listed.")
          )
     )
))
