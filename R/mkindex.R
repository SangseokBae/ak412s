# How To Use: Adata$index<-mkindex(Adata) 

mkindex<-function(tmp_data){

n<-nrow(tmp_data)
tmp_index00=c()

for(i in 1:n){
tmp_index00=c(tmp_index00, i)
}

return(tmp_index00)

}

