\name{mklog}
\alias{mklog}
\title{mklog}
\usage{
mklog()
}
\description{
Making log dataset
}
\examples{

## make log data for one varialbe
df12$logdebt<-mklog(df12$debt)

## make log data for various varialbe
tmp<-mklog(df12[,c(5:8)])
df12<-cbind(df12, tmp)

}
