e_filter<-function(explaining=0){
if(explaining==0) {
cat("  ", '\n')
cat("library(dplyr) ", '\n')
cat("APT수지구<-Adata%>%filter(grepl('용인수지구', Adata$시군구)) # filter와 grepl 조합", '\n')
cat("Adata %>% filter( 가격만족>mean(가격만족) ) # 가격만족이 평균 이상인 레코드 추출 ", '\n')
cat("Adata %>% filter(변수E==2015 & (변수F=='C' | 변수F=='G') )  # 조건식을 이용한 추출 ", '\n')
cat("Adata %>% filter(grepl('RN', Adata$brand)) # brand변수에 'RN'이 기록된 레코드 추출 ", '\n')
cat("Adata %>% select(브랜드, 편의성) # Adata에서 2개 변수를 추출해 Bdata로 저장 ", '\n')
cat("Adata %>% arrange(연령대) # 연령대 변수를 오름차순으로 정리 ", '\n')
cat("Adata %>% arrange(desc(연령대)) # 연령대 변수를 내림차순으로 정리 ", '\n')
cat("Adata<-Adata %>% mutate(새변수 = 기존 변수들을 조합한 수식)  # 기존변수를 조합 ", '\n')
cat("df2<-merge(Adata, Bdata, by='index', all=T)%>% merge(Cdata, by='index', all=T) ", '\n')
cat("Adata <- rename(Adata, 새변수명=구변수명) # 변수명 변경   ", '\n')
cat("Adata <- Adata %>% relocate(브랜드, .before=성별) # 변수 위치의 변경   ", '\n')
cat("Adata <- Adata %>% relocate(브랜드, .after=성별) # 변수 위치의 변경   ", '\n')
cat("  ", '\n')

}}
