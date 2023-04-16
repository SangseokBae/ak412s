\name{mkdum}
\alias{mkdum}
\title{Making dummy variables -- Original record is character}
\usage{
mkdum()
}
\description{
Making dummy variables -- Original record is character
}
\examples{

library(readxl)

## mkdum()을 사용하려면 입력변수 형태는 반드시 numeric()
## 입력변수 형태가 character()이면 numeric()으로 변경

> library(readxl)
> Adata<-read_excel('자료2.xlsx', sheet=2, skip=1)
> xtabs(~Adata$brand)
Adata$brand
Ford   GM   HD 
  21   12   15 

## mkdum을 사용해 더미변수 생성 시, NA가 있어도 무관함
> tmp<-mkdum(Adata$brand2)
> Adata<-cbind(Adata, tmp)

> ## mkdum의 주요 코딩은 아래와 같다
> ## Adata$brand2<-NA
## if문을 사용한 더미변수 생성 시, 데이터에 NA가 없어야 함
for(i in 1:nrow(Adata)){
  if(Adata$brand[i]=='Ford') {Adata$brand2[i]<-1}
  else if(Adata$brand[i]=='GM') {Adata$brand2[i]<-2}
  else{Adata$brand2[i]<-3}
}

  
}