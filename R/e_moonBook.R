#  How to use moonbook
e_moonBook<-function(explaining=0){
if(explaining==0) {
cat(" ", '\n')
cat("library(moonBook); library(ztable); library(readxl) ", '\n')
cat("options(ztable.type='html')  ", '\n')
cat("Adata<-read_excel('자료1.xlsx')  ", '\n')
cat("colnames(Adata)<-c('brand','conv','satprice','age','gender')  ", '\n')
cat(" ## 회귀분석결과를 테이블로 만들기 ", '\n')
cat("re<-lm(satprice~gender+conv, data=Adata) ", '\n')
cat("ztable(re) # html소스코드를 따로 저장해서 브라우저 - 복사 ", '\n')
cat(" ", '\n')
cat(" ## 범주형 데이터에 대한 기술 ", '\n')
cat("Adata$alldata <- 999  ", '\n')
cat("mytable(alldata~. , data=Adata)  # 복사해서 텍스트로 저장 - 엑셀", '\n')
cat("  ", '\n')
cat("# max.ylev는 더미변수가 최대 몇개의 숫자로 코딩되었는지 지정  ", '\n')
cat("# max.ylev에서 지정한 숫자를 넘어서 코딩된 변수는 연속형변수로 인식  ", '\n')
cat("re<-mytable(~gender+age+edu, data=Adata, max.ylev=8)   ", '\n')
cat("  ", '\n')
cat(" # 결과물을 viewer에 보여주는 기능  ", '\n')
cat("library(flextable)  ", '\n')
cat("flextable(re)  ", '\n')
cat("  ", '\n')
cat(" ## 연속형 데이터에 대한 기술 ", '\n')
cat("desc2all(Adata[, -c(1)])  # 복사해서 텍스트로 저장 - 엑셀 ", '\n')
cat(" ", '\n')

}}
