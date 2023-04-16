mkgroup2<-function(target_variable, CuttingNumber) {
  
  ans <-readline('  Insert group variable name : ')
  
  CuttingNumber <- as.vector(CuttingNumber)
  cat('  Cutting Numbers :', CuttingNumber, '\n')
  
  n<-length(target_variable)
  m<-length(CuttingNumber)
  
  groupIndex <- as.data.frame( matrix( rep(NA, n), ncol=1) )
  colnames(groupIndex) <-c('grouping')
  
  
  for(i in 1:n) {
    for(j in 1:m) {
      if( is.na(target_variable[i]) ) { groupIndex$grouping[i] <- -9999}
      else if( target_variable[i] < CuttingNumber[j] ) {
        groupIndex$grouping[i] <- j
        break}
    }
    if(is.na(groupIndex$grouping[i])) {groupIndex$grouping[i]<-(m+1)}
    if(groupIndex$grouping[i]==-9999) {groupIndex$grouping[i]<-NA}
  }
  colnames(groupIndex)[1]<-paste0(ans, '', sep='' )
  return(groupIndex)
}

