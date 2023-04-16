# --- 상태전환 매트릭스 만들기
statetransition <- function(Adata){
    
	cat('# 데이터셋은 두 개의 column으로만 구성되어 있음','\n')
	cat('# 데이터셋의 두 column은 상태를 숫자로 표시하고 있음. 예) 1은 소득1분위, 2는 소득2분위 ... ','\n')
	cat('# 데이터셋의 첫 번째 column은 변화 전의 상태','\n')
	cat('# 데이터셋의 두 번째 column은 변화 후의 상태','\n')
	
	Nrange1<-sum(unique(Adata[,1])>0)
	Nrange2<-sum(unique(Adata[,2])>0)
	
	if(Nrange1==Nrange2) {Nrange<-Nrange1}
	else if(Nrange1>Nrange2) {Nrange<-Nrange1}
	else {Nrange<-Nrange2}
	
    n<-nrow(Adata)
    ## Transition매트릭스 만들기
    Tmat <- matrix(0, nrow=Nrange, ncol=Nrange)
	for (i in 1:n) {
    Tmat[ Adata[,1][i], Adata[,2][i] ] <- Tmat[ Adata[,1][i], Adata[,2][i] ] + 1
    }
	Tmat<-as.data.frame(Tmat)
    return(Tmat)
}
