

shinyUI(fluidPage(
  titlePanel(
    fluidRow(column(8, div(p(strong("HazTrak Inventory Chemical List")),style="font-family:'bradley hand';color:purple; font-size:30pt"),
                    h4(em(strong("from", span("Gross Lab", style="font-family:'gabriola';color:blue; font-size:15pt"))))),
             column(4, img(src="wustl_name.png", width=210, height=70, align="right"))
    )),
  sidebarLayout(
    sidebarPanel(
      fileInput("ipt0",label=div(em("Click to upload csv!"), style="font-family:'marker felt';color:darkblue; font-size:12pt")),
      hr(),
      textInput("ipt1", label=div(em("Add items to inventory"), style="font-family:'marker felt';color:darkgreen; font-size:12pt"), placeholder = "input inventory # to add"),
      actionButton("GO", label=div(em("Add item!"), style="font-family:'marker felt';color:darkgreen; font-size:12pt")),
      br(),
      br(),
      radioButtons("state", label=div(em("Specify the state of chemical"), style="font-family:'marker felt';color:darkgreen; font-size:12pt"), choices = c("Solid","Liquid","Gas"), selected = "Liquid"),
      numericInput("amount", label=div(em("Specify the Amount"), style="font-family:'marker felt';color:darkgreen; font-size:12pt"),value=1,width="50%"),
      textInput("unit",  label=div(em("Specify the Unit"), style="font-family:'marker felt';color:darkgreen; font-size:12pt"), placeholder = "e.g., ug"),
      textInput("ipt2", label=div(em("Remove items from inventory"), style="font-family:'marker felt';color:darkred; font-size:12pt"), placeholder = "input inventory # then click delete"),
      actionButton("Delete",label=div(em("Delete item!"), style="font-family:'marker felt';color:darkred; font-size:12pt")),
      hr(),
      downloadButton("Output", label=span(em("Download Full Inventory!"), style="font-family:'marker felt';color:#996600; font-size:12pt"))
    ),
  mainPanel(
    tabsetPanel(type="tabs",
      tabPanel(div(strong("Full List"), style="font-family:'bradley hand';color:purple; font-size:13pt"),
        br(),
        DT::dataTableOutput("LIST")
      ),
      tabPanel(div(strong("Confirmed Chemicals"),style="font-family:'bradley hand';color:purple; font-size:13pt"),
        br(),
        fluidRow(
        column(4,actionButton("cf", label=div(em("Update List!"), style="font-family:'marker felt';color:red; font-size:12pt"))),
        column(6,downloadButton("output.cf", label=span(em("Download Confirmed Chemicals!"), style="font-family:'marker felt';color:#996600; font-size:12pt")))),
        br(),
        DT::dataTableOutput("confirmed")
      ),
      tabPanel(div(strong("Unconfirmed Chemicals"),style="font-family:'bradley hand';color:purple; font-size:13pt"),
        br(),
        fluidRow(
          column(4,actionButton("uncf", label=div(em("Update List!"), style="font-family:'marker felt';color:red; font-size:12pt"))),
          column(6,downloadButton("output.uncf", label=span(em("Download Unconfirmed Chemicals!"), style="font-family:'marker felt';color:#996600; font-size:12pt")))),
        hr(),
        DT::dataTableOutput("unconfirmed")
      ),
      tabPanel(div(strong("Guide"),style="font-family:'bradley hand';color:purple; font-size:13pt"),
      helpText(p(strong("Sidebar Panel & Full List Tab")), 
               p('1. Upload the .csv inventory file by clicking "Choose File" button. Under the "Full List" tab, a table corresponding to the inventory list should appear  AUTOMATICALLY.'),
               p('2. To add item to the inventory list, input the "item # / id" to the 1st blank of sidebar, select the "State of chemical" (Solid, Liquid or Gas) and then click "Add item!" button. '),
               p('3. For any new items added to the list, one of the following two would happen: (i) If the current inventory list does NOT contain the "item id / #" you added, this "item id / #" would be inserted to the FIRST ROW of the current list; (ii) If the current inventory list already contains the "item id / #", it will refresh the existing item by specifying its state (solid, liquid or gas) and put the corresponding row to the TOP OF LIST.'),
               p('4. If, by any chance, you wanna remove an item from the inventory list (e.g., you added something to it but later on realized that you mis-spelt the id / #), simply input the "item id / #" to the 2nd blank of sidebar and hit "Delete item!" button.'),
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
))
)