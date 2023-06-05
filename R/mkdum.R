# How To Use:
# Adata<-cbind(Adata, mkdum(Adata$gender))
# Insert dummy variable name : 동일한 변수명을 입력
# Adata에 새로 생성되는 변수: gender1, gender2

mkdum<-function(TMP_Origin_data){
tmp_01dataset <- as.vector(TMP_Origin_data)
tmp_01dataset <- data.frame(tmp_01dataset)
colnames(tmp_01dataset)[1]<-"tmp_var"
tmp_01dataset$tmp_var[is.na(tmp_01dataset$tmp_var)]<-"NA"
tmp_01dataset$tmp_var<-factor(tmp_01dataset$tmp_var)
tmp_02dataset<-model.matrix(~tmp_var-1, tmp_01dataset)
tmp_02dataset<-as.data.frame(tmp_02dataset)

ans <-readline('  Insert dummy variable name : ')
number_columns<-ncol(tmp_02dataset)

for(i_X0_no in 1:number_columns){
colnames(tmp_02dataset)[i_X0_no]<-paste0(ans,i_X0_no, sep='' )
}

return(as.data.frame(tmp_02dataset))
rm(TMP_Origin_data, tmp_01dataset, tmp_02dataset, ans, number_columns, i_X0_no)
}











