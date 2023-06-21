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

## mkdum()을 사용하려면 입력변수 형태는 반드시 numeric()
## 입력변수 형태가 character()이면 numeric()으로 변경

## NOT Working command
# Adata$edu_dums<-cbind(Adata, mkdum(Adata$edu))
# Adata$edu_dums(X) -> Adata(O)

## How To Use:
# NA부터 제거
Adata<-Adata[complete.cases(Adata), ]
Adata<-cbind(Adata, mkdum(Adata$gender))
Insert dummy variable name : 동일한 변수명을 입력
Adata에 새로 생성되는 변수: gender1, gender2

  
}