mkdum<-function(dums){

ans <-readline('  Insert dummy variable name : ')

xdata<-as.vector(dums)
x<-xdata[!is.na(xdata)]
x<-sort(unique(x))
mcol<-length(x)
mrow<-length(dums)
dm<-matrix(NA, mrow, mcol)
for( k in 1:mcol){
for(i in 1:mrow){
ifelse( dums[i]==k , dm[i,k]<-1 , dm[i,k]<-0 )
} }

dm<-as.data.frame(dm)
for(i in 1:mcol){
colnames(dm)[i]<-paste0(ans,i, sep='' )
}
return(dm) }
