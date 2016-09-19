Add<-function(id, State,amount,unit,ist){
  if(id=="") {
    add<-NULL
    }
  if(id!="" & !id %in% row.names(list)){
  add<-data.frame("Chemical.Description"=NA,"Building"=NA,"Room"=NA,"Storage.Location"=NA,"Receipt.Date"=NA,"Receipt.Quantity"=NA,"Unit"=amount,"Chemical.Unit"=unit,"Catalog.Number"=NA,"Vendor"=NA,"state"=State)
    row.names(add)<-id
    }
 return(add)
  }