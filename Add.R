Add<-function(id, Name,State,amount,unit,list){
  if(id=="") {
    add<-NULL
    }
  if(id!="" & !id %in% row.names(list)){
  add<-data.frame("Chemical.Description"=Name,"Building"=NA,"Room"=NA,"Storage.Location"=NA,"Receipt.Date"=NA,"Receipt.Quantity"=NA,"Unit"=amount,"Chemical.Unit"=unit,"Catalog.Number"=NA,"Vendor"=NA,"state"=State)
    row.names(add)<-id
    }
 return(add)
  }