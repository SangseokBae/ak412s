#'mykosis() Function
#' 

mykosis<-function(KosisDataSet){
## V1:지역명(예, 강북소방서), V2:변수명(예, 담배꽁초), V3:데이터값
colnames(KosisDataSet)<-c('V1', 'V2', 'V3')

# 원본자료의 갯수
n<-nrow(KosisDataSet)

## j: 지역명의 갯수
j<-nrow(unique( KosisDataSet[complete.cases(KosisDataSet[1]),][,1]))

## V1Temp: 지역명 종류, V1Number: 지역명의 갯수
V1Temp<-unique( KosisDataSet[complete.cases(KosisDataSet[1]),][,1])
V1Number<-sum(!is.na(V1Temp))

## V2Temp: 변수명 종류, V2Number: 변수명의 갯수
V2Temp<-unique(KosisDataSet[,2])
V2Number<-sum(!is.na(V2Temp))

## 지역명과 변수명이 완전하게 매칭되는 데이터셋을 만든다
Bdata<-(matrix(NA, V1Number, V2Number, byrow=F))
Bdata<-as.data.frame(Bdata)
rownames(Bdata)<-t(unique( KosisDataSet[complete.cases(KosisDataSet[1]),][,1]))
colnames(Bdata)<-t(V2Temp)
colnames(V1Temp)<-c('V1Temp')

## 원본자료에서 V1(지역명)이 NA로 표기된 것은 앞의 레코드로 채워넣는다
for(i in 1:(n-1)) {
if(is.na(KosisDataSet$V1[i+1])) {KosisDataSet$V1[i+1] <- KosisDataSet$V1[i]}}

## 원본자료를 지역명과 변수명이 매칭되는 데이터셋으로 옮기는 작업
for(i in 1:n){
for(j in 1:V1Number){
if(KosisDataSet$V1[i]==rownames(Bdata)[j])
for(k in 1:V2Number){
if(KosisDataSet$V2[i]==colnames(Bdata)[k]) {Bdata[j,][k]<-KosisDataSet$V3[i]}
}}}

return(Bdata)

}

