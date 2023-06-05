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

# V1:NA로 채워져있음 V2:지역명(예, 강북소방서), V3:변수명(예, 담배꽁초), V4:데이터값
  Adata <- KOSISdata

# V1은 필요없으므로 지운 후, 3개 변수로만 구성된 데이터셋을 mykosis()에 입력해야함
# V2:지역명(예, 강북소방서), V3:변수명(예, 담배꽁초), V4:데이터값
  Adata<-Adata[,c(2:4)]

# 원자료에서 V1(강북소방서, 중부소방서 등)이 NA로 표기된 것은 앞의 레코드로 채워넣는다
  
  Adata$V2<-zoo::na.locf(Adata$V2)
  NewData<-mykosis(Adata)


}