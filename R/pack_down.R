pack_down <-function(Adata, FromCol, ToCol){
LastNumber <- nrow(Adata)
for(i in 1:LastNumber){
	if(!is.na(Adata[i, FromCol]))  {
		Adata[(LastNumber+1), ] <-Adata[i, ]
		Adata[LastNumber+1, ToCol]<-Adata[i, FromCol]
		Adata[i, FromCol] <- NA
		Adata[LastNumber+1, FromCol]<-NA
		LastNumber<-LastNumber+1
		}
} 
return(Adata)
}
