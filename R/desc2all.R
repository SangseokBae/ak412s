## 모든 변수들의 평균을 구하는 함수

desc2all<-function(Adata, choicenumber=0){

if(choicenumber==0){
cat(" #------------------------------------------------------------------------   ","\n")
cat(" ##  desc2all(Adata[ ,c(3:6)] , 0)    ","\n")
cat(" ##  =>  NA제거 후 기초통계 계산 ","\n")
cat(" #------------------------------------------------------------------------   ","\n")
cat(" ##  desc2all(Adata[ ,c(3:6)] , 1)  ","\n")
cat(" ##  => 개별 변수별로 NA만 제거 후, 기초통계량을 계산 ","\n")
cat(" ##     자료수   NA갯수   Median   Mean St.Dev. Q1 Q2 Q3   Min   Max  변동계수","\n")
cat(" #------------------------------------------------------------------------   ","\n")
cat("    ","\n")

Adata<-as.data.frame(Adata)
Adata<-Adata[complete.cases(Adata), ]
nc <- ncol(Adata)
for(j in 1:nc){
 Adata<-Adata[ Adata[,j] != Inf, ]
 Adata<-Adata[ Adata[,j] != -Inf, ]
}

## 데이터셋을 numeric으로 변경하는 코드
index2<-c(1:nc)
Adata[,index2] <- lapply( Adata[, index2], as.numeric)

## 변수들의 값들을 저장하기 위한 전단계
r_mean<-c(); r_sd<-c(); r_14<-c(); r_24<-c(); r_34<-c(); r_min<-c(); 
r_max<-c(); r_sm<-c();r_n<-c(); r_NA<-c(); r_median<-c()

for(i in 1:nc){
t_n<-sum( !is.na(Adata[,i])==T )
t_NA<-sum( is.na(Adata[,i])==T )
t_median<-median(Adata[,i], na.rm=T)
t_mean<-mean(Adata[,i], na.rm=T)
t_sd<-sd(Adata[,i], na.rm=T)
t_14<-quantile(Adata[,i], c(.25), na.rm=T)
t_24<-quantile(Adata[,i], c(.5), na.rm=T)
t_34<-quantile(Adata[,i], c(.75), na.rm=T)
t_min<-min(Adata[,i], na.rm=T)
t_max<-max(Adata[,i], na.rm=T)
t_sm<-sd(Adata[,i], na.rm=T)

r_n<-c(r_n, t_n)
r_NA<-c(r_NA, t_NA)
r_median=c(r_median, t_median) 
r_mean=c(r_mean, t_mean) 
r_sd=c(r_sd, t_sd)
r_14=c(r_14, t_14)
r_24=c(r_24, t_24)
r_34=c(r_34, t_34) 
r_min=c(r_min, t_min) 
r_max=c(r_max, t_max) 
r_sm=c(r_sm, t_sm) 
}

r0<-as.vector(colnames(Adata))
r_n<-as.vector(r_n);
r_NA<-as.vector(r_NA);
r_median<-as.vector(r_median);
r_mean<-as.vector(r_mean)
r_sd<-as.vector(r_sd);  
r_14<-as.vector(r_14)
r_24<-as.vector(r_24)
r_34<-as.vector(r_34);  
r_min<-as.vector(r_min);
r_max<-as.vector(r_max);
r_sm<-as.vector(r_sm);

Bdata <- rbind(r0, r_n, r_NA,r_median, r_mean, r_sd, r_14, r_24, r_34, r_min, r_max, r_sm)
Bdata<-as.data.frame(Bdata)
colnames(Bdata)<-Bdata[1,]
Bdata<-Bdata[-c(1),]
Bdata<-as.data.frame(Bdata)
nc2<-ncol(Bdata)
index<-c(1:nc2)
Bdata[ , index] <- lapply( Bdata[ , index], as.numeric )

rownames(Bdata)[1] <- c('  자료수')
rownames(Bdata)[2] <- c('  NA갯수')
rownames(Bdata)[3] <- c('  Median')
rownames(Bdata)[4] <- c('  Mean')
rownames(Bdata)[5] <- c('St.Dev.')
rownames(Bdata)[6] <- c('Q1')
rownames(Bdata)[7] <- c('Q2')
rownames(Bdata)[8] <- c('Q3')
rownames(Bdata)[9] <- c('  Min')
rownames(Bdata)[10] <- c('  Max')
rownames(Bdata)[11] <- c('  변동계수')
return(t(Bdata))
}

else {
cat("    ","\n")
cat(" #------------------------------------------------------------------------   ","\n")
cat(" ##  입력코드: desc2all(Adata[ ,c(3:6)] , 1) ","\n")
cat(" ##  NA/Inf/-Inf 레코드는 제외하지 않음 ","\n")
cat(" ##     자료수   NA갯수   Median   Mean St.Dev. Q1 Q2 Q3   Min   Max  변동계수  ","\n")
cat(" #------------------------------------------------------------------------   ","\n")
cat("    ","\n")

Adata<-as.data.frame(Adata)
nc <- ncol(Adata)

## 데이터셋을 numeric으로 변경하는 코드
index2<-c(1:nc)
Adata[,index2] <- lapply( Adata[, index2], as.numeric)

## 변수들의 값들을 저장하기 위한 전단계
r_mean<-c(); r_sd<-c(); r_14<-c(); r_24<-c(); r_34<-c(); r_min<-c(); 
r_max<-c(); r_sm<-c();r_n<-c(); r_NA<-c(); r_median<-c()

for(i in 1:nc){
t_n<-sum( !is.na(Adata[,i])==T )
t_NA<-sum( is.na(Adata[,i])==T )
t_median<-median(Adata[,i], na.rm=T)
t_mean<-mean(Adata[,i], na.rm=T)
t_sd<-sd(Adata[,i], na.rm=T)
t_14<-quantile(Adata[,i], c(.25), na.rm=T)
t_24<-quantile(Adata[,i], c(.5), na.rm=T)
t_34<-quantile(Adata[,i], c(.75), na.rm=T)
t_min<-min(Adata[,i], na.rm=T)
t_max<-max(Adata[,i], na.rm=T)
t_sm<-sd(Adata[,i], na.rm=T)

r_n<-c(r_n, t_n)
r_NA<-c(r_NA, t_NA)
r_median=c(r_median, t_median) 
r_mean=c(r_mean, t_mean) 
r_sd=c(r_sd, t_sd)
r_14=c(r_14, t_14)
r_24=c(r_24, t_24)
r_34=c(r_34, t_34) 
r_min=c(r_min, t_min) 
r_max=c(r_max, t_max) 
r_sm=c(r_sm, t_sm) 
}

r0<-as.vector(colnames(Adata))
r_n<-as.vector(r_n);
r_NA<-as.vector(r_NA);
r_median<-as.vector(r_median);
r_mean<-as.vector(r_mean)
r_sd<-as.vector(r_sd);  
r_14<-as.vector(r_14)
r_24<-as.vector(r_24)
r_34<-as.vector(r_34);  
r_min<-as.vector(r_min);
r_max<-as.vector(r_max);
r_sm<-as.vector(r_sm);

Bdata <- rbind(r0, r_n, r_NA,r_median, r_mean, r_sd, r_14, r_24, r_34, r_min, r_max, r_sm)
Bdata<-as.data.frame(Bdata)
colnames(Bdata)<-Bdata[1,]
Bdata<-Bdata[-c(1),]
Bdata<-as.data.frame(Bdata)
nc2<-ncol(Bdata)
index<-c(1:nc2)
Bdata[ , index] <- lapply( Bdata[ , index], as.numeric )


rownames(Bdata)[1] <- c('  자료수')
rownames(Bdata)[2] <- c('  NA갯수')
rownames(Bdata)[3] <- c('  Median')
rownames(Bdata)[4] <- c('  Mean')
rownames(Bdata)[5] <- c('St.Dev.')
rownames(Bdata)[6] <- c('Q1')
rownames(Bdata)[7] <- c('Q2')
rownames(Bdata)[8] <- c('Q3')
rownames(Bdata)[9] <- c('  Min')
rownames(Bdata)[10] <- c('  Max')
rownames(Bdata)[11] <- c('  변동계수')
return(t(Bdata))
}

}