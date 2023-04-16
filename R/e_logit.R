e_logit<-function(explaining=0){
if(explaining==0) {
cat("library(gmodels); library(stargazer); library(readxl) ", '\n')
cat("Adata<-read.csv('Data20_Mroz.csv', header=T) ", '\n')
cat("---- character형로 기록된 wc변수와 hc변수값을 numeric형태로 전환 ----", '\n')
cat("Adata$wc2<-c2n(Adata$wc) ", '\n')
cat("Adata$hc2<-c2n(Adata$hc) ", '\n')
cat("------------ logit분석하기 ------------  ", '\n')
cat("아무거나1 <- glm(lfp~k5+k618+age+wc2+hc2+lwg+inc, family='binomial', data=Adata) ", '\n')
cat("--------- 시뮬레이션: 첫 번째 입력값은 1(상수항) --------- ", '\n')
cat("아무거나2<-c(1, 0, 1, 43, 0, 0, median(Adata$lwg), median(Adata$inc)) ", '\n')
cat("아무거나3<-coef(아무거나1) ", '\n')
cat("아무거나4<-sum(아무거나3*아무거나2) ", '\n')
cat("Result_exp=exp(아무거나4) ", '\n')
cat("------------ 확률계산하기 ------------  ", '\n')
cat("logit_probability=Result_exp/(1+Result_exp) ", '\n')
cat("   ", '\n')
}}

