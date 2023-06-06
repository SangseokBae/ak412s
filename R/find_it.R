find_it<-function(clue_x, index_var, dep_var ) {
	n<-length(dep_var)
	for(i in 1:n) {
	
	if( is.na(index_var[i])) { 
	next}
	
    if(clue_x == index_var[i]) { cat("Input value:",index_var[i], ", Index:",i, ", Search value:",  dep_var[i], '\n')}
    }}