e_ttest1<-function(explaining=0){
if(explaining==0) {
cat("library(jmv); library(readxl) ", '\n')
cat("Adata<-read.csv('Data1_CrispyRoll.csv') ", '\n')
cat("jmv::ttestOneS(  ", '\n')
cat("data = Adata, # 데이터프레임명을 Adata로 지정  ", '\n')
cat("vars = weight,  ", '\n')
cat("testValue = 10,  ", '\n')
cat("# norm = TRUE,  # normality 검정/Shapiro-Wilk검정  ", '\n')
cat("desc = TRUE )  ", '\n')
}}


