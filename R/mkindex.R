mkindex<-function(tmp_data){

n<-nrow(tmp_data)
tmp_data$tmp_index00<-NA
colnumber_Last<-ncol(tmp_data)

for(i in 1:n){

tmp_data$tmp_index00[i]<-i

}

ans <-readline('  Insert group variable name : ')
colnames(tmp_data)[colnumber_Last]<-paste0(ans, '', sep='' )
return(tmp_data)

}
