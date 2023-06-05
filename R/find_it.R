find_it<-function(clue_x, index_var, dep_var ) {
	r = c()
	countx = 0
	
	for(i in 1:length(dep_var)) {
    
	if( is.na(index_var[i])) { 
	countx <- countx+1
	next}
	
	if(clue_x == index_var[i]) { 
		r <- c(r, dep_var[i]) 
		countx <- countx+1 }
	
	}
	
	if(countx==0) {r<-c(NA)}
	return(r)	
}

