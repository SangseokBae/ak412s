# 퍼센트로 바꾸는 명령문
# percent_change() 함수 정의
percent_change <- function(x) {
  c(NA, (x[-1]/x[-length(x)]-1)*100 ) }
