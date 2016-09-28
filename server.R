library(shiny)
library(DT)
library(dplyr)
source("format.R")
source("Add.R")

shinyServer(function(input, output) {

values<-reactiveValues()
values$df<-NULL

observeEvent(input$ipt0, {
  if("Inventory.Number" %in% names(read.csv(input$ipt0$datapath))){
  values$df <- format(read.csv(input$ipt0$datapath))
  } else {
    values$df<-read.csv(input$ipt0$datapath, row.names = 1)} ## row.names = 1 specifies the column where you want it to be the row.name of your table.
})

observeEvent(input$GO, {
  if(!input$ipt1 %in% row.names(values$df) ){
  newLine<-Add(input$ipt1, input$name,input$state, input$amount,input$unit,values$df)
  values$df<-rbind(newLine, values$df)
  } else {
    index<-which(row.names(values$df)==input$ipt1)
    V<-cbind(values$df[index,][1:10], state=input$state)
    values$df<-rbind(V,values$df[-index,])
  }
})

observeEvent(input$Delete, {
  index<-which(row.names(values$df)==input$ipt2)
  if(length(index)!=0){
  values$df<-values$df[-index,]
  } else {
  values$df<-values$df}
})

output$LIST<-DT::renderDataTable({
  values$df[,c(1,4,9,11)]}, options=list(
    lengthMenu=list(c(50,100,-1),c("50","100","All")),
    pageLength=100))
output$Output<-downloadHandler(filename=function(){paste("Full-List-", input$ipt0$name,".csv",sep="")}, content = function(file){write.csv(values$df, file)} )

observeEvent(input$cf,{
output$confirmed<-DT::renderDataTable({ ## the isolate() here is to cancel the dependency of "values$df", so that everytime you modify the LIST (e.g., add one more item to LIST so the table changes, the values$df changes), the "confirmed table" (although its output also depends on the valuesdf) won't re-execute until you hit the actionButton.
  isolate(values$df[!is.na(values$df$state),][,c(1,4,9,11)])}, options=list(
    lengthMenu=list(c(50,100,-1), c("50","100","All")),
    pageLength=50))})
output$output.cf<-downloadHandler(filename=function(){paste("Confirmed-", input$ipt0$name,".csv",sep="")}, content = function(file){write.csv(isolate(values$df[!is.na(values$df$state),]), file)} )

observeEvent(input$uncf,{
  output$unconfirmed<-DT::renderDataTable({ ## the isolate() here is to cancel the dependency of "values$df", so that everytime you modify the LIST (e.g., add one more item to LIST so the table changes, the values$df changes), the "unconfirmed table" (although its output also depends on the valuesdf) won't re-execute until you hit the actionButton.
    isolate(values$df[is.na(values$df$state),][,c(1,4,9,11)])}, options=list(
      lengthMenu=list(c(50,100,-1), c("50","100","All")),
      pageLength=50))})
output$output.uncf<-downloadHandler(filename=function(){paste("Unconfirmed-", input$ipt0$name,".csv",sep="")}, content = function(file){write.csv(isolate(values$df[is.na(values$df$state),]), file)} )


})


