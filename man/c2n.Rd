\name{c2n}
\alias{c2n}
\title{Converting character into numbers}
\usage{
c2n()
}
\description{
Converting character into numbers
}
\examples{
Adata<-read.csv('Data20_Mroz.csv', header=T)
Adata$wc2<-c2n(Adata$wc)
Adata$hc2<-c2n(Adata$hc)
}