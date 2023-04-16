# making date. Input date format: 2001.01 or 2001-01

mkdate<-function(date0) {

tmp_dataset<-as.data.frame(date0)
n<-nrow(tmp_dataset)
temp1<-sort(unique(date0))
count0<-length(temp1)

tmp_dataset$year<-NA
tmp_dataset$month<-NA


for(i in 1:n){
if(is.na(tmp_dataset$date0[i])) {next}
if(!is.na(tmp_dataset$date0[i])) {
tmp_nchar<-nchar(tmp_dataset$date0[i])
break} 
}


if( tmp_nchar==7){
for(i in 1:n){
tmp_dataset$year[i]<-substring(tmp_dataset$date0[i],1,4)
tmp_dataset$month[i]<-substring(tmp_dataset$date0[i],6,7) }}

tmp_dataset$date00<-NA
for(i in 1:n){
tmp_dataset$date00[i]<-paste0(tmp_dataset$year[i],'-',tmp_dataset$month[i],'-01') }

tmp_dataset<-tmp_dataset[,c(2:4)]

return(tmp_dataset)
}

