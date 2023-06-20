## How to use: 
## make 34 NAs in 4th column
## Adata <- mkNAs(Adata, 4, 34)

mkNAs<-function(tmp_data, col_number, NAs_number){
tmp_data<-as.matrix(tmp_data)
n<-nrow(tmp_data)
selRows<-sample(1:n, NAs_number, replace=F)
tmp_data[selRows, c(col_number)]<-NA
tmp_data<-as.data.frame(tmp_data)
return(tmp_data)
}
