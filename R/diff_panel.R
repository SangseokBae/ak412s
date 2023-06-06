diff_panel<-function(AdataSet, T){

## AdataSet = name of dataset, 2019~2022 : T=4
## dplyr package::lag()


ncolumns<-ncol(AdataSet)

if(is.null(ncolumns)) {
ncolumns<-1
n<-length(AdataSet)
tmp_AdataSet<-rep(1,n)
AdataSet<-cbind(AdataSet, tmp_AdataSet)}

AdataSet<-as.data.frame(AdataSet)

LagAdataSet<-dplyr::lag(AdataSet)

df_pdata<-AdataSet-LagAdataSet

ncolumns<-ncol(df_pdata)

n<-nrow(df_pdata)

iteration <- (n/T)

for(j in 1:ncolumns){

for(i in 0:(iteration-1) ){

df_pdata[i*T+1, j]<-NA }
}

df_pdata<-as.data.frame(df_pdata)

for(i in 1:ncolumns){
ans <- "d_"
tmp_name<-colnames(df_pdata)[i]
colnames(df_pdata)[i]<-paste0(ans,tmp_name, sep='' )
}

return(df_pdata)
}