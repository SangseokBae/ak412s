cor3 <- function(x, y){
 temp<-cbind(x,y)
 temp<-as.data.frame(temp)
 tempx<-temp[complete.cases(temp), ]
 tempx<-tempx[tempx$x != Inf, ]
 tempx<-tempx[tempx$x != -Inf, ]
 tempx<-tempx[tempx$y != Inf, ]
 tempx<-tempx[tempx$y != -Inf, ]
  tempx<-tempx[tempx$y != '', ]
 answer <- cor(tempx$x, tempx$y)
return(answer) }
