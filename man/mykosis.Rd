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
# 데이터 : https://data.seoul.go.kr/dataList/10949/S/2/datasetView.do
# 원본자료: Data45_KOSIS.xlsx
  library(aj412s)
# 내장데이터명: KOSISdata
# V1:지역명(예, 강북소방서), V2:변수명(예, 담배꽁초), V3:데이터값
  Adata <- KOSISdata

# 원자료에서 V1(지역명)이 NA로 표기된 것은 앞의 레코드로 채워넣는다

  na.locf = NA Last Observation Carried Forward

# zoo패키지의 na.locf명령문을 사용

  Adata$V1<-zoo::na.locf(Adata$V1)

# Re-arrange Kosis Data

  NewData<-mykosis(Adata)


}