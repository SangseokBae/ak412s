\name{e_datamining}
\alias{e_datamining}
\title{e_datamining}
\usage{
e_datamining()
}
\description{
e_datamining Program
}
\examples{

## 변수를 선택해서 새 데이터셋으로 만들기
인덱스 <- c(2,4,6)
새데이터셋 <- df[ , 인덱스]

## 자료를 솎아내서 새데이터셋 만들기 -------
새데이터셋 <- df[ df$debtratio !=Inf , ]
새데이터셋 <- df[ !is.na(df$debtratio) , ]
새데이터셋 <- df[ df$debtratio <= 124 , ]
새데이터셋 <- df[ complete.cases(df$편의성, df$가격만족, df$연령대), ] 

## 코드값 재코딩 -------
df$편의성2[df$conv==5] <- 4
df$성별2[df$gender==2] <- 0
df[df==''] <- NA 

## 자료수 확인 -------
sum(is.na(df$브랜드)) 
sum(!is.na(Adata$브랜드)) 
sum(Adata$브랜드=='Ford')

## 변수명 변경 -------
colnames(BasicData)<-c('id','brand','conv','satprice','age','gender')
colnames(BasicData)[6]<-c('성별')

## 더미변수 만들기 -------
library(fastDummies) 
df<-data(BasicData)
df12<-dummy_cols(df12, 'age')

## Grouping변수 만들기 -------
cn<-quantile(df$income, c(.25, .5, .75) , na.rm=T)
df$income2<-mkgroup(df$income, cn)

## 간단한 density그래프 그릭 -------
ggplot(df, aes(x=income)) + geom_density()

## 결과의 저장 -------
sink('결과저장.csv') 
  …… 
sink() 

## dplyr사용법 -------
df %>% group_by(브랜드) 
      %>% summarize(편의성평균=mean(편의성, na.rm=T), 표준편차=sd(편의성, na.rm=T), 자료수=n()) 
df %>% select(브랜드, 편의성)
df %>% filter(변수E==2015 & (변수F=='C' | 변수F=='G') )
df %>% arrange(연령대)
df <- rename(df, 새변수명=편의성)
merge(data0, data1, by='index')
   %>% merge(data2, by='index')
   %>% merge(data3, by='index')
   
-----------------------------------------------------
xtabs를 사용해 막대그래프 그리기
xtabs(~df$성별+df$브랜드) 
barplot(xtabs(~df$성별+df$브랜드), beside=T, horiz=F, ylab='빈도수') 

-----------------------------------------------------
rowSums 및 rowMeans 명령문 
Adata$check<-rowSums(Adata[, c(3:4)], na.rm=T) 
Adata$check<-rowMeans(Adata[, c(3:4)], na.rm=T) 

-----------------------------------------------------
정규분포 경계값: qnorm(확률) 
정규분포 p값찾기: 1-pnorm(z값) 
t분포 경계값: qt(확률, n-1) 
t분포 p값찾기: 1-pt(t값, n-1) 
카이자승 경계값: qchisq(확률, 자유도) 
카이자승 p값찾기: 1-pchisq(카이자승값, 자유도) 
F분포 경계값: qf(확률, 자유도1, 자유도2) 
F분포 p값찾기: 1-pf(F값, k-1, n-k) 

-----------------------------------------------------
문자 레코드를 숫자로 바꾸기
library(aj412s); df<-read_excel('자료1.xlsx')
df$브랜드2<-c2n(df$브랜드)

-----------------------------------------------------
여러 개의 변수들을 numeric으로 지정하기
index <- c(4, 5, 11:23) 
df[,index] <- lapply(df[,index], as.numeric) 

-----------------------------------------------------
substring 사용법: 수원시 -> 마지막 문자인 '시'를 area2에 저장
# 문자열의 개수를 알려주는 함수: nchar( )
for(i in 1:n){
총문자열수<-nchar(df$area1[i])
df$area2[i] <- substring(df$area1[i], 총문자열수) } #area1의 마지막 문자를 area2에 저장

-----------------------------------------------------
substring 사용법: 수원시 -> 기초자치단체명 '수원'을 area3에 저장
df$area3 <- NA
for(i in 1:n){
총문자열수_마이너스1<- ( nchar(df$area1[i]) - 1 )
df$area3[i] <- substring(df$area1[i], 1, 총문자열수_마이너스1) }

-----------------------------------------------------
df$시군구 변수에서 용인수지구 단어가 있는 레코드를 솎아내기
df%>%filter( grepl('용인수지구' , df$시군구))

-----------------------------------------------------
상현동 아파트들 중 상떼빌 아파트만 솎아내기
df%>%filter( grepl('상현동', df$시군구) & grepl('상떼빌', df$단지명))

-----------------------------------------------------
계약년월(예: 202404) 변수에서 5번~6번째 월(04)을 솎아내서 month변수로 저장하기
df$month <- substring(df$계약년월, 5,6)

-----------------------------------------------------
거래금액에 있는 콤마(82,345)를 제거한 후 거래금액(82345)를 numeric으로 지정하기
df$거래금액<-gsub(',', '', df$거래금액)
df$거래금액<-as.numeric(df$거래금액)

-----------------------------------------------------
year, month, 01을 연결해 날짜변수date0 만들기", '\n')
df$month2<-sprintf('-%02d', df$month)
df$date0<-paste0(df$year, df$month2, '-01')
df$date0<-as.Date(df$date0)

-----------------------------------------------------
subset명령문활용
subset(df, 평형==32, select=c(date0, 평당매매가평균))

subset으로 32평 및 41평의 평당매매가평균을 하나의 그래프로 그리기
plot(subset(df, 평형==32, select=c(date0, 평당매매가평균)), type='l',
     col='cornflowerblue', lwd=2, ylim=c(1000, 2800))
par(new=T)

subset을 이용해 특정 레코드만 솎아내서 회귀분석하기
Result <- lm(거래금액~전용면적+층, data=df, subset=c(year==2021)  )

-------------------------------------------------------------- 
국가<-c('미국','중국','일본','독일','영국','인도','프랑스','이탈리아','캐나다','대한민국' )
국내총생산<-c(22.99, 17.73, 4.93, 4.22, 2.18, 3.17, 2.93, 2.99, 1.99, 1.81)
인구수<-c('3.39','14.25','1.23','0.83','0.67','14.28','0.64','0.58','0.38','0.51')
df<-as.data.frame(cbind(국가, 국내총생산, 인구수))
df$일인당국내총생산<-NA
index<-c(2:4)
df[,index]<-lapply(df[,index], as.numeric)
df$일인당국내총생산<-df$국내총생산/df$인구수
index2<-sample(nrow(df), 6, replace=F)
SampleData<-df[index2 , ]


}