format<-function(list){
  f.list<-subset(list, select=-c(X,Vendor))
  f.list<-rename(f.list, "Vendor"=X.1)
  f.list$state<-NA
  inv.num<-f.list[,1]
  f.list<-f.list[,-1]
  row.names(f.list)<-inv.num
  return(f.list)
}