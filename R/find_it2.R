find_it2<-function(clue_x, index_var, dep_var ) {
	n<-length(dep_var)
	for(i in 1:n) {
        if(clue_x == index_var[i]) { cat(i, "번째 Search 값:",index_var[i], ", 관련된 찾고자 하는 값:",  dep_var[i], '\n')}
    }}