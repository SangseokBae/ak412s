pack_left <- function(Bdata){
ncol_number<-ncol(Bdata)
Bdata$index<-NA
Bdata$index<-as.numeric(rownames(Bdata))
Bdata$check<-NA
Bdata$check<-rowSums(Bdata[,c(1:ncol_number)], na.rm=T)
Bdata<-Bdata[ Bdata$check>0,  ]

for(k in 1:(ncol_number-1)){
for(j in 1:nrow(Bdata)){
for(i in 1:(ncol_number-1))  {
if( is.na(Bdata[ j, i])   ) {
Bdata[ j, i] <- Bdata[ j, i+1]
Bdata[ j, i+1] <- NA }
}}}
return(Bdata)
cat('NA만 있는 레코드는 삭제. index는 원본 데이터셋의 인덱스. check변수는 지우세요.', '\n')
}
