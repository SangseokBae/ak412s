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

library(readxl); library(dplyr) 
Adata<-read_excel('Data0_자료1.xlsx') 
-----------------------------------------------------
seq(1, 12, 3) 
rep(NA, 12) 
Adata$편의성[Adata$편의성==5]<-4 
Adata[Adata==''] <- NA 
Adata[Adata=='NA']<-NA 
Adata<-Adata[complete.cases(Adata$편의성, Adata$가격만족, Adata$연령대), ] 
-----------------------------------------------------
sum(Adata$브랜드=='Ford') 
sum(is.na(Adata$브랜드)) 
sum(!is.na(Adata$브랜드)) 
-----------------------------------------------------
Adata<-Adata%>%filter( 가격만족>mean(가격만족) ) 
Adata<-select(Adata, 편의성, 가격만족, 성별) 
Adata<-arrange(Adata, 편의성) 
Adata<-rename(Adata, 새변수명=구변수명) 
-----------------------------------------------------
재코딩 방법1 
Adata<-read_excel('자료2.xlsx', sheet=3, skip=6) 
Adata$gender[Adata$gender=='①']<-1 # gender의 재코딩 
Adata$gender[Adata$gender=='②']<-2 # gender의 재코딩 
-----------------------------------------------------
재코딩 방법2: FOR문을 사용한 재코딩 
Adata$gender2<-NA # gender의 재코딩 값을 기록할 변수 지정 
n<-nrow(Adata) 
for(i in 1:n){ 
   if(Adata$gender[i]=='①')  {Adata$gender2[i]<- 1} 
   else if(Adata$gender[i]=='②')  {Adata$gender2[i]<- 2} 
   else {Adata$gender2[i] <- NA} 
} 
-----------------------------------------------------
더미변수 만들기 -- 방법1 
Adata<-read_excel('자료1.xlsx') 
Adata$dums<-ifelse(Adata$성별==1, 1, 0), 
-----------------------------------------------------
더미변수 만들기 -- 방법2 
library(aj412s)
Adata$dums<-mkdum(Adata$브랜드) # V2변수의 레코드가 문자character", '\n')
Adata$dums<-mkdum(Adata$성별) # V3변수의 레코드가 숫자numeric", '\n')
-----------------------------------------------------
sink('결과저장.csv') 
  …… 
sink() 
-----------------------------------------------------
dplyr사용법
Adata%>%group_by(브랜드)%>%summarize(편의성평균=mean(편의성, na.rm=T), 
        표준편차=sd(편의성, na.rm=T), 자료수=n()) 
Adata%>%select(브랜드, 편의성)
Adata %>% filter(변수E==2015 & (변수F=='C' | 변수F=='G') )
Adata%>%arrange(연령대)
Adata%>%arrange(desc(연령대))
Adata2<-rename(Adata, 새변수명=편의성)
merge(data0, data1, by='index')%>%merge(data2, by='index')%>%merge(data3, by='index')
-----------------------------------------------------
xtabs를 사용해 막대그래프 그리기
xtabs(~Adata$성별+Adata$브랜드) 
barplot(xtabs(~Adata$성별+Adata$브랜드), beside=T, horiz=F, ylab='빈도수') 
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
library(aj412s); Adata<-read_excel('자료1.xlsx')
Adata$브랜드2<-c2n(Adata$브랜드)
-----------------------------------------------------
여러 개의 변수들을 numeric으로 지정하기
index <- c(4, 5, 11:23) 
Adata[,index] <- lapply(Adata[,index], as.numeric) 
-----------------------------------------------------
substring 사용법: 수원시 -> 마지막 문자인 '시'를 area2에 저장
# 문자열의 개수를 알려주는 함수: nchar( )
for(i in 1:n){
총문자열수<-nchar(Adata$area1[i])
Adata$area2[i] <- substring(Adata$area1[i], 총문자열수) } #area1의 마지막 문자를 area2에 저장
-----------------------------------------------------
substring 사용법: 수원시 -> 기초자치단체명 '수원'을 area3에 저장
Adata$area3 <- NA
for(i in 1:n){
총문자열수_마이너스1<- ( nchar(Adata$area1[i]) - 1 )
Adata$area3[i] <- substring(Adata$area1[i], 1, 총문자열수_마이너스1) }
-----------------------------------------------------
Adata$시군구 변수에서 용인수지구 단어가 있는 레코드를 솎아내기
Adata%>%filter( grepl('용인수지구' , Adata$시군구))
-----------------------------------------------------
상현동 아파트들 중 상떼빌 아파트만 솎아내기
Adata%>%filter( grepl('상현동', Adata$시군구) & grepl('상떼빌', Adata$단지명))
-----------------------------------------------------
계약년월(예: 202404) 변수에서 5번~6번째 월(04)을 솎아내서 month변수로 저장하기
Adata$month <- substring(Adata$계약년월, 5,6)
-----------------------------------------------------
거래금액에 있는 콤마(82,345)를 제거한 후 거래금액(82345)를 numeric으로 지정하기
Adata$거래금액<-gsub(',', '', Adata$거래금액)
Adata$거래금액<-as.numeric(Adata$거래금액)
-----------------------------------------------------
year, month, 01을 연결해 날짜변수date0 만들기", '\n')
Adata$month2<-sprintf('-%02d', Adata$month)
Adata$date0<-paste0(Adata$year, Adata$month2, '-01')
Adata$date0<-as.Date(Adata$date0)
-----------------------------------------------------
subset으로 32평 및 41평의 평당매매가평균을 하나의 그래프로 그리기
plot(subset(Adata, 평형==32, select=c(date0, 평당매매가평균)), type='l',
col='cornflowerblue', lwd=2, ylim=c(1000, 2800))
par(new=T)
plot(subset(Cdata, 평형==41, select=c(date0, 평당매매가평균)), type='l',
col='salmon2', lwd=2, ylim=c(1000, 2800))
-----------------------------------------------------
subset을 이용해 특정 레코드만 솎아내서 회귀분석하기
Result <- lm(거래금액~전용면적+층, data=Adata, subset=(year==2021)  )", '\n')
-----------------------------------------------------
stargazer(Result, type='text')
stargazer(Result, type='html', out='OLS결과.doc')
stargazer(mtcars,title='Description statistics', digit=2, type='html', out='cars1.html', flip=T)
-------------------------------------------------------------- 
국가<-c('미국','중국','일본','독일','영국','인도','프랑스','이탈리아','캐나다','대한민국' )
국내총생산<-c(22.99, 17.73, 4.93, 4.22, 2.18, 3.17, 2.93, 2.99, 1.99, 1.81)
인구수<-c('3.39','14.25','1.23','0.83','0.67','14.28','0.64','0.58','0.38','0.51')
Adata<-as.data.frame(cbind(국가, 국내총생산, 인구수))
Adata$일인당국내총생산<-NA
index<-c(2:4)
Adata[,index]<-lapply(Adata[,index], as.numeric)
Adata$일인당국내총생산<-Adata$국내총생산/Adata$인구수
index2<-sample(nrow(Adata), 6, replace=F)
SampleData<-Adata[index2 , ]
-------------------------------------------------------------- 
library(moonBook); library(openxlsx)
TempDoc<-mytable(~국내총생산+인구수, data=Adata)
write.xlsx(TempDoc, 'TempDoc.xlsx')
}