# 문자열을 numeric으로  
c2n <- function(x){   
     groups = unique(x)   
     groups= sort(groups)
     tmp<-as.numeric(factor(x, levels=groups))
	 return(tmp)
}
