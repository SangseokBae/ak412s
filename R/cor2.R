cor2 <- function(x, y, z, selecting_z=0){
 temp<-cbind(x,y,z)
 temp<-as.data.frame(temp)
cat('#############', '\n')
 cat('함수사용법: cor2(x, y, z, 0) Selection없음. NA/Inf/-Inf제거후 x와 y의 상관계수 구함', '\n')
 cat('함수사용법: cor2(x, y, z, k) z변수 레코드가 k인 자료만 솎아냄. NA/Inf/-Inf제거후 상관계수 구함', '\n')
 cat('#############', '\n')
 cat('자료수 :', nrow(temp), '\n')
  if(selecting_z==0) { 
       tempx<-temp[complete.cases(temp), ]
       cat('selection없음. NA제거 후의 자료수 :', nrow(tempx), '\n') }
 else{ tempx<-temp[temp$z == selecting_z, ]
       tempx<-tempx[complete.cases(tempx), ]}
 
 if(selecting_z==0) {cat('selection없음. NA제거 후의 자료수 :', nrow(tempx), '\n')}
 else{  cat('selection있음. NA제거 후의 자료수 :', nrow(tempx), '\n')}
 
 tempx<-tempx[tempx$x != Inf, ]
 tempx<-tempx[tempx$x != -Inf, ]
 tempx<-tempx[tempx$y != Inf, ]
 tempx<-tempx[tempx$y != -Inf, ]
 tempx<-tempx[tempx$y != '', ]
 cat('selection있음. NA/Inf/-Inf/Blank제거 후의 자료수 :', nrow(tempx), '\n')
 cat('selection이 고려되고 NA/Inf/-Inf/Blank제거 후의 자료로 구한 상관계수', '\n')
 answer <- cor(tempx$x, tempx$y)
return(answer) }
