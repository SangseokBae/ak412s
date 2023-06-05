# Converting character into numeric

c2n <- function(x){   
     groups = unique(x)   
     groups= sort(groups)
     tmp<-as.numeric(factor(x, levels=groups))
	 return(tmp)
}
