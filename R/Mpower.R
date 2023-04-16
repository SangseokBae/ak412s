# 동일한 매트릭스를 반복적으로 곱하는 함수 만들기
Mpower <- function(Adata, n) {
L <- list(Adata)
if (n==1) return(L)
P <- Adata
for(i in 2:n){L[[i]] <- (P <- P %*% Adata)}
return(L[[n]])
}
