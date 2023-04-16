e_mlogit<-function(explaining=0){
if(explaining==0) {
cat("library(nnet); library(stargazer); library(readxl) ", '\n')
cat("결과 <- multinom(gpa~involve+exhaust+gender+age, data=Adata) ", '\n')
cat("stargazer(결과, type='text') ", '\n')
cat("stargazer(결과, type='html', out='Mlogit.doc') ", '\n')
cat(" ", '\n')
cat("## 확률의 계산 ------ ", '\n')
cat("predict(결과, newdata=data.frame(involve=3, exhaust=2, gender=1, age=25), type='prob') ", '\n')
cat(" ", '\n')
cat("## Multinomial Logit의 시뮬레이션-----  ", '\n')
cat("library(nnet)  ", '\n')
cat("Adata<-read.csv('Data34_mlogit3.csv', header=TRUE)  ", '\n')
cat("mlogit.결과 <- multinom(job ~ ed, data=Adata)  ", '\n')
cat(" ", '\n')
cat("## 시뮬레이션: c(상수항, 교육기간은 10년)   ", '\n')
cat("inputdata<-c(1, 10)  ", '\n')
cat("mcoef<-coef(mlogit.결과)  ", '\n')
cat("y2<-sum(mcoef[1,1:2]*inputdata)  ", '\n')
cat("y3<-sum(mcoef[2,1:2]*inputdata)  ", '\n')
cat(" ", '\n')
cat("## 확률계산하기 -------  ", '\n')
cat("prob.블루 <- 1/(1+exp(y2)+exp(y3))  ", '\n')
cat("prob.화이트 <- exp(y2)/(1+exp(y2)+exp(y3))  ", '\n')
cat("prob.전문직 <- exp(y3)/(1+exp(y2)+exp(y3))  ", '\n')

}}

