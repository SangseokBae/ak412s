\name{mykosis}
\alias{mykosis}
\title{rearrange kosis data}
\usage{
mykosis()
}
\description{
rearrange kosis data
}
\examples{

# Adata의 변수는 3개: 1번=지역 소방서, 2번 변수=화재원인, 3번 변수=데이터
데이터 : https://data.seoul.go.kr/dataList/10949/S/2/datasetView.do

# library(readxl)
# Adata<-read_excel('Data45_KOSIS.xlsx')

# 자료의 내장데이터명: KOSISdata
Adata <- Kosisdata

# CODE: 원본자료에서 V1(지역명)이 NA로 표기된 것은 앞의 레코드로 채워넣는다
<방법1>
na.locf = NA Last Observation Carried Forward
Adata$V1<-zoo::na.locf(Adata$V1) #zoo패키지의 na.locf명령문을 사용
## ---------------------------

<방법2>
n<-nrow(Adata)
for(i in 1:(n-1)) {
if(is.na(Adata$V1[i+1])) {Adata$V1[i+1] <- Adata$V1[i]}}
## ---------------------------


Adata<-Adata[,c(2,4:5)]

## ---------------------------
## Arrange Kosis Data
Kdata<-mykosis(Adata)


}