

library(shiny)
ui <- fluidPage(
  titlePanel(
    h1('Risk')
  ),
  sidebarLayout(
    sidebarPanel(
      numericInput(inputId = 'international_normalized_ratio',
                   label = 'international normalized ratio:',
                   value = 1,
                   step = 0.01),
      numericInput(inputId = 'hepatic_encephalopathy_score',
                   label = 'hepatic encephalopathy score:',
                   value = 0,
                   step = 0.01),
      numericInput(inputId = 'neutrophil',
                   label = 'neutrophil:',
                   value = 1,
                   step = 0.01),
      numericInput(inputId = 'total_bilirubin',
                   label = 'total bilirubin:',
                   value = 1,
                   step = 0.01),
      numericInput(inputId = 'serum_urea',
                   label = 'serum urea:',
                   value = 1,
                   step = 0.01),
      numericInput(inputId = 'age',
                   label = 'age:',
                   value = 0)
    ),
    mainPanel(
      br(),
      h1('prognostic score:'),
      br(),
      h2(strong(textOutput('answer'),style='color:blue')),
      br(),
      br()
    )
  )
)
server <- function(input,output){
  output$answer <- renderPrint(
    1.649*log(input$international_normalized_ratio)+0.457*input$hepatic_encephalopathy_score+
      0.425*log(input$neutrophil)+0.396*log(input$total_bilirubin)+0.576*log(input$serum_urea)+0.033*input$age
  )
}
shinyApp(ui=ui,server = server)

