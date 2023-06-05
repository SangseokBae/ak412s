cor3 <- function(x, y, z, selecting_z=0){
 temp<-cbind(x,y,z)
 temp<-as.data.frame(temp)
 cat(' #############', '\n')
 cat(' How to use: cor2(x, y, z, 0) No selection. Removing NA/Inf/-Inf, then calc correlation', '\n')
 cat(' How to use: cor2(x, y, z, k) Selecting z=k. Removing NA/Inf/-Inf, then calc correlation', '\n')
 cat(' #############', '\n')
 cat(' Number of Data:', nrow(temp), '\n')
  if(selecting_z==0) { 
       tempx<-temp[complete.cases(temp), ]
       cat('No selection. Removing NA, Number of Data:', nrow(tempx), '\n') }
 else{ tempx<-temp[temp$z == selecting_z, ]
       tempx<-tempx[complete.cases(tempx), ]}
 
 if(selecting_z==0) {cat('NO selection. Removing NA, Number of Data:', nrow(tempx), '\n')}
 else{  cat('YES selection. Removing NA, Number of Data :', nrow(tempx), '\n')}
 
 tempx<-tempx[tempx$x != Inf, ]
 tempx<-tempx[tempx$x != -Inf, ]
 tempx<-tempx[tempx$y != Inf, ]
 tempx<-tempx[tempx$y != -Inf, ]
 tempx<-tempx[tempx$y != '', ]
 cat('YES selection. Removing NA/Inf/-Inf/Blank, Number of Data:', nrow(tempx), '\n')
 cat('YES selection. Removing NA/Inf/-Inf/Blank, Calc correlation', '\n')
 answer <- cor(tempx$x, tempx$y)
return(answer) }
