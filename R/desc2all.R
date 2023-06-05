## 모든 변수들의 평균을 구하는 함수

desc2all<-function(A0_data){

tempx<-ncol(A0_data)

if(is.null(tempx)){

X0x2 <- as.vector(A0_data)
r_n<-sum( !is.na(X0x2) )
r_NA<-sum( is.na(X0x2) )
X0x2 <- X0x2[!is.na(X0x2)]
r_median<-median(X0x2, na.rm=T)
r_mean<-mean(X0x2, na.rm=T)
r_sd<-sd(X0x2, na.rm=T)
r_14<-quantile(X0x2, c(.25), na.rm=T)
r_24<-quantile(X0x2, c(.5), na.rm=T)
r_34<-quantile(X0x2, c(.75), na.rm=T)
r_min<-min(X0x2, na.rm=T)
r_max<-max(X0x2, na.rm=T)
r_sm<-sd(X0x2, na.rm=T)/mean(X0x2, na.rm=T)

B0_data <- rbind(r_n, r_NA,r_median, r_mean, r_sd, r_14, r_24, r_34, r_min, r_max, r_sm)

B0_data<-as.data.frame(B0_data)
colnames(B0_data)<-'var'

rownames(B0_data)[1] <- c('  Ndata')
rownames(B0_data)[2] <- c('  NAs')
rownames(B0_data)[3] <- c('  Median')
rownames(B0_data)[4] <- c('  Mean')
rownames(B0_data)[5] <- c('St.Dev.')
rownames(B0_data)[6] <- c('Q1')
rownames(B0_data)[7] <- c('Q2')
rownames(B0_data)[8] <- c('Q3')
rownames(B0_data)[9] <- c('  Min')
rownames(B0_data)[10] <- c('  Max')
rownames(B0_data)[11] <- c('    S/M:Variation')
return(t(B0_data))
}
### ------------------------------------------
else {

A0_data<-as.data.frame(A0_data)
nc <- ncol(A0_data)

for(j in 1:nc){
 A0_data<-A0_data[ A0_data[,j] != Inf, ]
 A0_data<-A0_data[ A0_data[,j] != -Inf, ]
}

## coverting data into numeric variables
index2<-c(1:nc)
A0_data[,index2] <- lapply( A0_data[, index2], as.numeric)

## Variables for saving
r_mean<-c(); r_sd<-c(); r_14<-c(); r_24<-c(); r_34<-c(); r_min<-c(); 
r_max<-c(); r_sm<-c();r_n<-c(); r_NA<-c(); r_median<-c()

for(ix00 in 1:nc){
t_n<-sum( !is.na(A0_data[,ix00]) )
t_NA<-sum( is.na(A0_data[,ix00]) )
t_median<-median(A0_data[,ix00], na.rm=T)
t_mean<-mean(A0_data[,ix00], na.rm=T)
t_sd<-sd(A0_data[,ix00], na.rm=T)
t_14<-quantile(A0_data[,ix00], c(.25), na.rm=T)
t_24<-quantile(A0_data[,ix00], c(.5), na.rm=T)
t_34<-quantile(A0_data[,ix00], c(.75), na.rm=T)
t_min<-min(A0_data[,ix00], na.rm=T)
t_max<-max(A0_data[,ix00], na.rm=T)
t_sm<-sd(A0_data[,ix00], na.rm=T)/mean(A0_data[,ix00], na.rm=T)

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


r0<-as.vector(colnames(A0_data))
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

rownames(Bdata)[1] <- c('  Ndata')
rownames(Bdata)[2] <- c('  NAs')
rownames(Bdata)[3] <- c('  Median')
rownames(Bdata)[4] <- c('  Mean')
rownames(Bdata)[5] <- c('St.Dev.')
rownames(Bdata)[6] <- c('Q1')
rownames(Bdata)[7] <- c('Q2')
rownames(Bdata)[8] <- c('Q3')
rownames(Bdata)[9] <- c('  Min')
rownames(Bdata)[10] <- c('  Max')
rownames(Bdata)[11] <- c('  S/M:Variation')
return(t(Bdata))
}


}


