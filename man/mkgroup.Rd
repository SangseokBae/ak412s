\name{mkgroup}
\alias{mkgroup}
\title{Making grouping index variables}
\usage{
mkgroup()
}
\description{
Making grouping index variables
}
\examples{

## 예제 데이터셋 만들기
set.seed(12345)
Adata <- as.data.frame( matrix( rnorm(40), ncol=1, byrow=F ) )
colnames(Adata) <- c('testdata')
## 예제 데이터셋 완성 -------------

# aj412s::mkgroup()사용법

> cn<-quantile(Adata$testdata, c(.25, .5, .75))
> #Adata$testdata값을 4개의 그룹으로 나눈다

> Bdata<-mkgroup(Adata$testdata, cn)
  Cutting Numbers : -0.3620575 0.3346758 0.7876847 

> head(Bdata, 3)
>   grouping
> 1        3
> 2        3
> 3        2

> Adata<-cbind(Adata, Bdata)
> head(Adata, 3)
>     testdata grouping
> 1  0.5855288        3
> 2  0.7094660        3
> 3 -0.1093033        2

}
