mklog<-function(df_logdataset){

df_logdataset<-as.data.frame(df_logdataset)

ncolumns<-ncol(df_logdataset)

if(ncolumns==1) {
n<-nrow(df_logdataset)
tmp_df_logdataset<-rep(1,n)
df_logdataset<-cbind(df_logdataset,tmp_df_logdataset)}

else{
n<-nrow(df_logdataset)
df_logdataset<-cbind(df_logdataset, df_logdataset)}


for(j in 1:ncolumns){
ans <- "log_"
tmp_name<-colnames(df_logdataset)[j+ncolumns]
colnames(df_logdataset)[j+ncolumns]<-paste0(ans,tmp_name, sep='' )
df_logdataset[j+ncolumns]<-NA
}

for(j in 1:ncolumns){
for(i in 1:n){
if (is.na(df_logdataset[i,j])) {df_logdataset[i, j+ncolumns]<-NA}
else if(df_logdataset[i,j]==0) {df_logdataset[i, j+ncolumns]<-0 }
else if(df_logdataset[i,j]>0) {df_logdataset[i, j+ncolumns]<-log(df_logdataset[i,j])}
else {df_logdataset[i, j+ncolumns]<- ( -1*log(-1*df_logdataset[i,j]))} 
 }
}

df_logdataset <-df_logdataset[ , -c(1:ncolumns)]

return(df_logdataset)
rm(df_logdataset, n, j, ncolumns, i, tmp_df_logdataset)
}
