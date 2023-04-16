s_rim<-function(B0, ROE, Ke, Nstocks){
cat("예시) 데이터 입력 예시: s_rim( '21,613', 12.51, 8, '46,957, 120)", '\n')
if(ROE<Ke) {print('ROE가 Ke보다 적기 때문에 계산이 불가능합니다. Ke를 ROE보다 작게 설정하세요.')}

B0<-as.numeric( gsub(',','',B0) )
B0 <- B0 * 100000000
Nstocks<-as.numeric( gsub(',','',Nstocks) )
ROE <- ROE/100
Ke <- Ke/100
over_profit = B0*(ROE-Ke)
cat('B0=지배주주지분(단위 억원)=',B0,' ROE=',ROE,' Ke=',Ke,' Nstock=주식수=',Nstocks, '\n')
V1=B0+ over_profit/Ke
valuex1<-round( ( V1 / Nstocks ), 0)
cat('적정주가 = ', valuex1, '\n')

V2=B0+ over_profit*( 0.9/(Ke+1-0.9) )
valuex2<-round( ( V2 / Nstocks ), 0)
cat('초과이익 10% 감소 시 적정주가 = ', valuex2, '\n' )

V3=B0+ over_profit*( 0.8/(Ke+1-0.8) )
valuex3<-round( ( V3 / Nstocks ), 0)
cat('초과이익 20% 감소 시 적정주가 = ', valuex3, '\n' )
}

