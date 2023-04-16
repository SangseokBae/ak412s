s_rim2<-function(B0, ROE, Ke, Nstocks){

if(ROE<Ke) {result<-c(NA, NA, NA); return(result)}

if(ROE>Ke) {
B0<-as.numeric( gsub(',','',B0) )
B0 <- B0 * 100000000
Nstocks<-as.numeric( gsub(',','',Nstocks) )
ROE <- ROE/100
Ke <- Ke/100
over_profit = B0*(ROE-Ke)
V1=B0+ over_profit/Ke
valuex1<-round( ( V1 / Nstocks ) , 0)

V2=B0+ over_profit*( 0.9/(Ke+1-0.9) )
valuex2<-round( ( V2 / Nstocks ), 0)

V3=B0+ over_profit*( 0.8/(Ke+1-0.8) )
valuex3<-round( ( V3 / Nstocks ), 0)

result<-c(valuex1, valuex2, valuex3)
return(result)
}

}

