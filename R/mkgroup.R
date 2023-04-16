mkgroup<-function(target_variable, CuttingNumber) {

CuttingNumber <- as.vector(CuttingNumber)
cat('  Cutting Numbers :', CuttingNumber, '\n')

n<-length(target_variable)
m<-length(CuttingNumber)

groupIndex <- as.data.frame( matrix( rep(NA, n), ncol=1) )
colnames(groupIndex) <-c('grouping')


for(i in 1:n) {
  for(j in 1:m) {
    if( is.na(target_variable[i]) ) { groupIndex$grouping[i] <- -99998888}
	else if( target_variable[i] < CuttingNumber[j] ) {
	groupIndex$grouping[i] <- j
	break}
	}
if(is.na(groupIndex$grouping[i])) {groupIndex$grouping[i]<-(m+1)}
if(groupIndex$grouping[i]==-99998888) {groupIndex$grouping[i]<-NA}
}

return(groupIndex)
}
