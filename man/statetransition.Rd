\name{statetransition}
\alias{statetransition}
\title{Making State Transition Matrix}
\usage{
statetransition()
}
\description{
Making State Transition Matrix
}
\examples{

A1<-c(1,2,2,3,1,4)
A2<-c(1,2,2,3,3,3)
data<-as.data.frame(cbind(A1,A2))

Trans<-statetransition(data)
# 데이터셋은 두 개의 column으로만 구성되어 있음 
# 데이터셋의 두 column은 상태를 숫자로 표시. 예) 1은 소득1분위, 2는 소득2분위 ...  
# 데이터셋의 첫 번째 column은 변화 전의 상태 
# 데이터셋의 두 번째 column은 변화 후의 상태 

> Trans
  V1 V2 V3 V4
1  1  0  1  0
2  0  2  0  0
3  0  0  1  0
4  0  0  1  0

A11<-c(1,2,2,3,3,3)
A12<-c(1,2,2,3,1,4)
data<-as.data.frame(cbind(A11,A12))
Trans2<-statetransition(data)
# 데이터셋은 두 개의 column으로만 구성되어 있음 
# 데이터셋의 두 column은 상태를 숫자로 표시. 예) 1은 소득1분위, 2는 소득2분위 ...  
# 데이터셋의 첫 번째 column은 변화 전의 상태 
# 데이터셋의 두 번째 column은 변화 후의 상태 

> Trans2
  V1 V2 V3 V4
1  1  0  0  0
2  0  2  0  0
3  1  0  1  1
4  0  0  0  0
 }