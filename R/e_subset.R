# e_subset()

e_subset<-function(explaining=0){
if(explaining==0) {
cat("    ", '\n')
cat("library(dplyr); library(readxl) ", '\n')
cat("Adata<-read_excel('Data38_LocalExpend.xlsx') ", '\n')
cat("    ", '\n')
cat("lm(log(총세출)~log(지방세)+log(인구수), data=Adata, subset=(year==1995) )", '\n')
cat("plot(subset(dataset,평형대==32,select=c(sales,price)), type='l', ylim=c(min(price),max(price)))", '\n')
cat("    ", '\n')
}}
