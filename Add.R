Add<-function(id, State,list){
  if(id=="") {
    add<-NULL
    }
  if(id!="" & !id %in% row.names(list)){
  add<-data.frame("Chemical.Description"=NA,"Building"=NA,"Room"=NA,"Storage.Location"=NA,"Receipt.Date"=NA,"Receipt.Quantity"=NA,"Unit"=NA,"Chemical.Unit"=NA,"Catalog.Number"=NA,"Vendor"=NA,"state"=State)
    row.names(add)<-id
    }
 return(add)
  }