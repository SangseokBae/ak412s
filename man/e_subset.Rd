\name{e_subset}
\alias{e_subset}
\title{subset}
\usage{
e_subset()
}
\description{
Command: subset
}
\examples{

subset Usage1:
plot(subset(dataset,평형대==32, select=c( X , Y) ), type='l', ylim=c(min(Y),max(Y)))

subset Usage2:
lm(거래금액~전용면적, data=Bdata, subset=(year==2021) )

}
