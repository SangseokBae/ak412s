\name{find_it}
\alias{find_it}
\title{find related varialbe's record}
\usage{
find_it()
}
\description{
find related variable's record
}
\examples{
>
find_it<-function(clue_x, index_var, dep_var ) {
    for(i in 1:length(dep_var)) {
        if(clue_x == index_var[i]) { return(dep_var[i])}
    }}
>
> a<-c(1,2,3,3)
> b<-c(11,12,13,14)
> Adata<-cbind(a,b)
> Adata<-as.data.frame(Adata)
> find_it(3, Adata$a, Adata$b)
[1] 13

}
