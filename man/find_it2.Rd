\name{find_it2}
\alias{find_it2}
\title{find_it2}
\usage{
find_it2()
}
\description{
find related values
}
\examples{
> 
find_it2<-function(clue_x, index_var, dep_var ) {
	n<-length(dep_var)
	for(i in 1:n) {
        if(clue_x == index_var[i]) 
		{ cat(i, "번째 Search 값:",index_var[i], ", 관련된 찾고자 하는 값:",  dep_var[i], '\n')}
}}

>
> a<-c(1,2,3,3)
> b<-c(11,12,13,14)
> Adata<-cbind(a,b)
> Adata<-as.data.frame(Adata)
> find_it2(3, Adata$a, Adata$b)
3 번째 Search 값: 3 , 관련된 찾고자 하는 값: 13 
4 번째 Search 값: 3 , 관련된 찾고자 하는 값: 14

}
