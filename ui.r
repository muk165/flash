# Defining the layout of the objects. We use a 'mixed row & column' layout
body <- dashboardBody(fluidRow(box(div(class = "my-class", h3("INDIA'S LARGEST COAL PRODUCERS"), style="text-align:center;"), width = NULL, height = 62, status = "primary"
),
# Placing the Map:
column(width = 6, height = 14,
       box(div(class = "my-class", h4("PRODUCTION PER STATE"), style="text-align:left"), style='height:600px;overflow-y: scroll;',
           leafletOutput('myMap', height="500px"), div(class = "my-class", h5("All data for the financial year 2019-20. Units in Metric Tonnes"), style="text-align:left"),width = NULL)),
# Placing the Bar Charts:              
column(width=6,
       box(div(class = "my-class", h4("WHICH COMPANIES GET THE MOST OUT OF EACH MINE?"), style="text-align:center") ,style='height:250px;overflow-y: scroll;',
           plotOutput("bar1", height="350px"), width = NULL, status = "primary"
       ),
       
       box(div(class = "my-class", h4("WHICH ARE THE TOP PRODUCING DISTRICTS?"), style="text-align:center") ,style='height:250px;overflow-y: scroll;',
           plotOutput("bar2", height="350px"), width = NULL
       )
)
),
# Placing the Citations and Creator Info:
fluidRow(box(div(class = "my-class", h5("CREATED BY: JAYANT KAUSHIK | " ,tags$a(href="https://www.linkedin.com/in/jayantkaushik/", "Linkedin")), style="text-align:center"),div(class = "my-class", h6("Data Source: ", tags$a(href="https://dataverse.harvard.edu/dataset.xhtml?persistentId=doi:10.7910/DVN/TDEK8O", "Harvard Dataverse")," | Sandeep Pai and Hisham Zerriffi. A novel dataset for analysing sub-national socioeconomic developments in the Indian coal industry. ", tags$a(href="https://iopscience.iop.org/article/10.1088/2633-1357/abdbbb", "IOPSciNotes")), style="text-align:center"), width = NULL, status = "primary"
))
)
# Giving all the above to the UI function:
ui <- dashboardPage(title="Coal Production - India",
                    dashboardHeader(disable= TRUE),
                    dashboardSidebar(disable = TRUE),
                    body
)