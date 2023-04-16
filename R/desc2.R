#' desc2() Function
#' 
#' This function print descriptive statistics.
#'기술통계자료 -- 변수는 1개

desc2<-function(x){
x<-as.numeric(x)
cat("desc2 사용 시 Warning Message가 나와도 염려 마시길... ", "\n")
m1<-length(x)
#미싱데이터 제거하기
m2<-sum(is.na(x))
x <- x[!is.na(x)]
m3<-length(x)
# complete.cases()를 사용해 미싱데이터를 제거하려면 x를 data.frame으로 지정해야 함
# x<-as.data.frame(x)
# x <- x[complete.cases(x), ]
mean0<-mean(x) # 평균
median0<-median(x) # 중위수
sd0<-sd(x) # 표준편차
var0<-var(x) # 분산
max0<-max(x) # 최댓값
min0<-min(x) # 최솟값
변동계수0<-sd(x)/mean(x) # 변동계수
Q1<-quantile(x, c(.25))
Q2<-quantile(x, c(.5))
Q3<-quantile(x, c(.75))
기술통계결과<-c(자료수=m1, NA갯수=m2, NA제거후자료수=m3, 중위수=median0, 평균=mean0, 표준편차=sd0, 분산=var0, 최대값=max0, 최소값=min0, 변동계수SM=변동계수0, Q1사분위=Q1, Q2사분위=Q2, Q3사분위=Q3)
result1<-as.data.frame(기술통계결과)
return(round(result1, 3)) }

