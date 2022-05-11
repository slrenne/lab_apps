#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)


# Define UI for dataset viewer app ----
ui <- fluidPage(
  
  # App title ----
  titlePanel("Random Mice!"),
  
  # Sidebar layout with a input and output definitions ----
  sidebarLayout(
    
    # Sidebar panel for inputs ----
    sidebarPanel(
      
      # Input: Selector for choosing dataset ----
      numericInput(inputId = "tot_mice",
                   label = "Total mice available:",
                   value = 5,
                   step = 1),
      
      # Input: Numeric entry for number of obs to view ----
      numericInput(inputId = "n_to_rnd",
                   label = "How many to pick:",
                   value = 2,
                   step = 1)
    ),
    
    # Main panel for displaying outputs ----
    mainPanel(
      h4("Selected Mice"),
      # Output: Verbatim text for data summary ----
      verbatimTextOutput("view")
      
    )
  )
)


# Define server 
server <- function(input, output) {
  output$view <- renderPrint({
    sample(1:input$tot_mice, size = input$n_to_rnd)
  })
}

# Run the application 
shinyApp(ui = ui, server = server)
