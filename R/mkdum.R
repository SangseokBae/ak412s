# How To Use:
# Adata<-cbind(Adata, mkdum(Adata$gender))
# Insert dummy variable name : 동일한 변수명을 입력
# Adata에 새로 생성되는 변수: gender1, gender2

mkdum<-function(TMP_data){

c2n <- function(x_x01){   
     groups = unique(x_x01)   
     groups= sort(groups)
     tmp<-as.numeric(factor(x_x01, levels=groups))
	 return(tmp) }

TMP_data<-as.data.frame(TMP_data)

if( class(TMP_data) == 'character') {TMP_data<-c2n(TMP_data)}
ncolumns<-ncol(TMP_data)
n<-nrow(TMP_data)


if(ncolumns==1) {
n<-nrow(TMP_data)
tmp_datasetx<-TMP_data
TMP_data<-cbind(TMP_data,tmp_datasetx)}

ncolumns<-ncol(TMP_data)

for(j in 1:ncolumns){
ans <- "dum_"
tmp_name<-colnames(TMP_data)[j+ncolumns]
colnames(TMP_data)[j+ncolumns]<-paste0(ans,tmp_name, sep='' )
}

print(colnames(TMP_data)); braeak

tmp_01dataset<-TMP_data[2]
print(colnames(tmp_01dataset))

tmp_01dataset$tmp_var[is.na(tmp_01dataset$tmp_var)]<-"NAs"
tmp_01dataset$tmp_var<-factor(tmp_01dataset$tmp_var)
tmp_02dataset<-model.matrix(~tmp_var-1, tmp_01dataset)

ncolumns<-ncol(tmp_02dataset)


for(j in 1:ncolumns){
ans <- "dum_"
tmp_name<-colnames(TMP_data)
colnames(tmp_02dataset)[j]<-paste0(ans,tmp_name, j, sep='' )
}


tmp_02dataset<-as.matrix(tmp_02dataset)

return(tmp_02dataset)

}
