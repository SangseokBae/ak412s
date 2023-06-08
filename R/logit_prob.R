## 활용법: Logit_prob(로짓결과)

logit_prob <- function( LogitResult, my_input=c(1) ){
r=c()
max.ylev<-2
nvariables<-LogitResult$rank

for(i in 1:nvariables){
if( nrow(unique(LogitResult$model[i])) > max.ylev ) { r=c(r, median(LogitResult$model[, i])) }
else {r<-c(r, 0)} }

r[1]<-1

if(length(my_input)==1) { OriginData<-r } else{ OriginData<-my_input }

cat('*** 확률계산을 위한 OriginData 입력값: ', OriginData, '\n')
cat('    OriginData의 첫 번째값 1은 상수항을 의미함', '\n')

for(i in 2:length(OriginData)){
input<-OriginData
input[i]<-input[i]+1

확률계산자료<-as.data.frame(LogitResult$coef)
확률계산자료<-cbind(확률계산자료, input)
colnames(확률계산자료)[1]<-c('Result')
확률계산자료$temp<-확률계산자료$Result * 확률계산자료$input
tmp<-sum( 확률계산자료[ ,3] )
tmp분자<- exp(tmp)
tmp분모<- 1+exp(tmp)
확률<-round( tmp분자/tmp분모*100, 3)

확률계산자료se<-as.data.frame(LogitResult$coef)
확률계산자료se<-cbind(확률계산자료se, OriginData)
colnames(확률계산자료se)[1]<-c('Result')
확률계산자료se$temp <- 확률계산자료se$Result * 확률계산자료se$OriginData
tmp<-sum( 확률계산자료se[ ,3] )
tmp분자<- exp(tmp)
tmp분모<- 1+exp(tmp)
확률se<-round( tmp분자/tmp분모*100, 3)

if(length(my_input)>1) { 
cat('    입력 자료의 확률은', 확률se, '퍼센트이다', '\n')
break
}

ChPROB<-round((확률-확률se) , 3)
cat('   ', i-1, '번째 독립변수 값을 1단위 증가시키면 확률은', 확률, '퍼센트 이고, OriginData의 확률은', 확률se, '퍼센트이다. 즉 독립변수 1단위 증가로 종속변수가 1이 될 확률은', ChPROB, '퍼센트 변한다', '\n')

  }  }
