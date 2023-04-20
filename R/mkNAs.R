mkNAs<-function(tmp_data, col_number, NAs_number){
n<-nrow(tmp_data)
selRows<-sample(1:n, NAs_number, replace=F)
tmp_data[selRows, c(col_number)]<-NA
return(tmp_data)
}
