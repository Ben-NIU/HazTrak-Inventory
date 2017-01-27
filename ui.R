library(shinydashboard)

dashboardPage(
  dashboardHeader(title=span(p(strong("HazTrak Inventory Chemical List")), style="font-family:'bradley hand'; font-size;30pt"), titleWidth = 400),
  dashboardSidebar(
    sidebarMenu(
 
      fileInput("ipt0",label=div(em("Click to upload csv!"), style="font-family:'marker felt'; font-size:12pt")),
      textInput("ipt1", label=div(em("Inventory #"), style="font-family:'marker felt'; font-size:12pt"), placeholder = "input inventory # to add"),
      textInput("name", label=div(em("Chemical Name"), style="font-family:'marker felt'; font-size:12pt"), placeholder = "input chemical name here")),
     
    fluidRow(
       column(3, helpText("    ")),
       column(4, actionButton("GO", label=span(em("Add item!"), style="font-family:'marker felt'; font-size:12pt")))),
      
      br(),
      radioButtons("state", label=div(em("State of chemical"), style="font-family:'marker felt'; font-size:12pt"), choices = c("Solid","Liquid","Gas"), selected = "Liquid", inline = TRUE),
      fluidRow(
      column(6,numericInput("amount", label=span(em("Amount"), style="font-family:'marker felt'; font-size:12pt"),value=1,width="100%")),
      column(6,textInput("unit",  label=span(em("Unit"), style="font-family:'marker felt'; font-size:12pt"), placeholder = "e.g., ug", width = "100%"))),
      textInput("ipt2", label=div(em("Remove items from inventory"), style="font-family:'marker felt'; font-size:12pt"), placeholder = "input inventory # then click delete"),
    
    fluidRow(
      column(3, helpText("     ")),
      column(4, actionButton("Delete",label=div(em("Delete item!"), style="font-family:'marker felt'; font-size:12pt")))),
      
    hr(),
     fluidRow(
       column(1, helpText("")),
      column(10, downloadButton("Output", label=span(em("Output Full Inventory!"), style="font-family:'marker felt';color:#996600; font-size:11pt"))))
    ),
  dashboardBody(
  tabBox(width = 12, side="left", id="tabbox", selected = "Guide",
   tabPanel("Full List",icon=icon("table"),
        br(),
        DT::dataTableOutput("LIST")
      ),
   tabPanel("Confirmed Chemicals", icon=icon("table"),
        br(),
        fluidRow(
        column(4,actionButton("cf", label=div(em("Update List!"), style="font-family:'marker felt';color:red; font-size:12pt"))),
        column(6,downloadButton("output.cf", label=span(em("Download Confirmed Chemicals!"), style="font-family:'marker felt';color:#996600; font-size:12pt")))),
        br(),
        DT::dataTableOutput("confirmed")
      ),
   tabPanel("Unconfirmed Chemicals", icon=icon("table"),
        br(),
        fluidRow(
          column(4,actionButton("uncf", label=div(em("Update List!"), style="font-family:'marker felt';color:red; font-size:12pt"))),
          column(6,downloadButton("output.uncf", label=span(em("Download Unconfirmed Chemicals!"), style="font-family:'marker felt';color:#996600; font-size:12pt")))),
        hr(),
        DT::dataTableOutput("unconfirmed")
      ),
   tabPanel("Guide", icon=icon("area-chart"),
        helpText(p(strong("Sidebar Panel & Full List Tab")), 
               p('1. Upload the .csv inventory file by clicking "Choose File" button. Under the "Full List" tab, a table corresponding to the inventory list should appear  AUTOMATICALLY.'),
               p('2. To add item to the inventory list, input the "item #" to the sidebar, select the "State of chemical" (Solid, Liquid or Gas) and then click "Add item!" button. '),
               p('3. For any new items added to the list, one of the following two would happen: (i) If the current inventory list does NOT contain the "item id" you added, this "item id" would be inserted to the FIRST ROW of the current list; (ii) If the current inventory list already contains the "item id", it will refresh the existing item by specifying its state (solid, liquid or gas) and put the corresponding row to the TOP OF LIST.'),
               p('4. If, by any chance, you wanna remove an item from the inventory list (e.g., you added something to it but later on realized that you mis-spelt the id), simply input the "item id" to the "Remove item from Inventory" sidebar and hit "Delete item!" button.'),
               p(strong("Confirmed & Unconfirmed Chemicals Tab")),
               p('1. Unlike in the Full list Tab where contents are shown interactively, the contents in these two tabs will NOT present / update until you hit the red "Update List!" button'),
               p('2. Under Confirmed Chemicals Tab, only those chemicals inputted by user are shown. (i.e., the lab DOES have those chemicals.)'),
               p('3. Under Unconfirmed Chemicals Tab, only those chemicals that are on the Inventory List BUT NOT FOUND IN THE LAB are shown. '),
               p(strong("Download files")),
               p('(i). Once done with Add / Delete, you can download the full inventory list (containing both confirmed & unconfirmed chemicals) by clicking the "Download Full Inventory" button.'),
               p('(ii). Under the "Confirmed Chemicals" Tab, you can download those confirmed chemicals ONLY by clicking the "Download Confirmed Chemicals!" button.'),
               p('(iii). Under the "Unconfirmed Chemicals" Tab, download the unconfirmed chemicals by clicking the "Download Unconfirmed Chemicals!" button.')
               )
               
      )
    )
    
    
    
  )
)
