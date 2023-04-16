\name{percent_change}
\alias{percent_change}
\title{Making percent change}
\usage{
percent_change()
}
\description{
Making percent change of variables
}
\examples{
Adata<-read.csv('Data20_Mroz.csv', header=T)
Adata$pchange<-percent_change(Adata$kospi)
}