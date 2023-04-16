\name{desc2all}
\alias{desc2all}
\title{Function of calculating mean,SD, and Quantile for all variables}
\usage{
desc2all()
}
\description{
Function of calculating mean, SD, and Quantile for all variables
}
\examples{

library(readxl);library(ggplot2);library(dplyr);library(aj412s)
Adata<-read_excel('Data44_교육만족도.xlsx')

Adata<-as.data.frame(Adata)
Adata<-Adata[, -1]

m1<-desc2all(Adata)[,4]  # 변수들의 평균 구하기

m1<-lapply(m1, as.numeric) # m1데이터의 값을 numeric으로 지정하기
m1<-as.data.frame(m1) 

m2<-t(m1) #하나의 열로 데이터 만들기
m2<-as.vector(m2) # 열을 벡터로 지정한 후
m3<-as.data.frame(matrix(m2, nrow=5, byrow=F)) #5개의 설문문항을 데이터 형태로 전환
colnames(m3)<-c('Professional', 'Change.Making', 'Accountability', 'Administration')

m3$Qnumber<-NA   #5개 설문문항의 순서를 1~5로 표시하는 변수
m3$Qnumber[1:5]<-c(1,2,3,4,5)

library(gridExtra) #ggplot그림을 바둑판 형태로 만들기 위한 패키지
a<-ggplot(m3, aes(x=Qnumber, y=Professional)) + geom_bar(stat='identity', fill='salmon3', width=0.7)+ylim(0,5) +xlab('문항번호')+ylab('전문적 리더십')
b<-ggplot(m3, aes(x=Qnumber, y=Change.Making)) + geom_bar(stat='identity', fill='salmon3', width=0.7) +ylim(0,5) +xlab('문항번호')+ylab('변혁적 리더십')
c<-ggplot(m3, aes(x=Qnumber, y=Accountability)) + geom_bar(stat='identity', fill='salmon3', width=0.7) +ylim(0,5) +xlab('문항번호')+ylab('책임적 리더십')
d<-ggplot(m3, aes(x=Qnumber, y=Administration)) + geom_bar(stat='identity', fill='salmon3', width=0.7) +ylim(0,5) +xlab('문항번호')+ylab('관리적 리더십')

grid.arrange(a,b,c,d, nrow=1, ncol=4) #ggplot그림을 바둑판 형태로 배열하기

## 동일한 유형의 설문문항(1번~5번)들의 평균을 구한 후, 각 설문문항 영역별로 그래프 그리기
m3_mean<-desc2all(m3)[,4]

m4<-as.data.frame(m3_mean)
m4$V2<-rownames(m4)
m4$V2[1:5]<-c('전문적 리더십', '변혁적 리더십', '책임적 리더십', '관리적 리더십','DEL')
m4<-m4[-5,] #설문문항 번호를 1~5로 지정하기 위한 5번째 변수, 전체 설문문항을 묶는 데 불필요함

ggplot(m4, aes(x=V2, y=V1)) + geom_bar(stat='identity', fill='salmon3',width=0.7)+ylim(0,5) +xlab('리더십 유형')+ylab('리더십 평균')+theme(axis.text.x=element_text(angle=40, hjust=1, size=10)) +theme(axis.title.x = element_text(face='bold'))+theme(axis.title.y = element_text(face='bold')) +geom_text(aes(label = round(V1,2), vjust = 1.4, angle=0))

}