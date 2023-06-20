# How To Use:
# cn<-quantile(Adata$edu, c(.25, .5, .75))
# Adata$edu2<-mkgroup(Adata$edu, cn)

mkgroup<-function(target_variable, CuttingNumber) {
  
  c2n <- function(x_x01){   
     groups = unique(x_x01)   
     groups= sort(groups)
     tmp<-as.numeric(factor(x_x01, levels=groups))
	 return(tmp) }

  if( class(target_variable) == 'character') {target_variable<-c2n(target_variable)}
  
  CuttingNumber <- as.vector(CuttingNumber)
    
  nx_0<-length(target_variable)
  mx_0<-length(CuttingNumber)
  
  groupIndexx_0 <- matrix( rep(NA, nx_0), ncol=1)
   
  
  for(ix_0 in 1:nx_0) {
    for(jx_0 in 1:mx_0) {
      if( is.na(target_variable[ix_0]) ) { groupIndexx_0[ix_0] <- -9999}
      else if( target_variable[ix_0] < CuttingNumber[jx_0] ) {
        groupIndexx_0[ix_0] <- jx_0
        break}
    }
    if(is.na(groupIndexx_0[ix_0])) {groupIndexx_0[ix_0]<-(mx_0+1)}
    if(groupIndexx_0[ix_0]==-9999) {groupIndexx_0[ix_0]<-NA}
  }
  groupIndexx_0<-as.vector(groupIndexx_0)
  return(groupIndexx_0)
  rm(nx_0, mx_0, ix_0, jx_0, groupIndexx_0, target_variable, CuttingNumber)
}
