\name{pack_left}
\alias{pack_left}
\title{put together records without blank}
\usage{
pack_left()
}
\description{put together records without blank
}
\examples{

# 21년 창업기업실태조사 자료의 폐업1~7의 원인을 왼쪽 column부터 순차적으로 몰아주기
> a1<-c(1,NA,3,4,NA)
> a2<-c(NA,17,19,NA,18)
> a3<-c(NA,NA,NA,49,0)
> Adata<-cbind(a1,a2,a3)
> Adata<-as.data.frame(Adata)
> Adata
  a1 a2 a3
1  1 NA NA
2 NA 17 NA
3  3 19 NA
4  4 NA 49
5 NA 18  0

> Adata<-as.data.frame(Adata)
> temp<-pack_left(Adata)
> temp
  a1 a2 a3 index check
1  1 NA NA     1     1
2 17 NA NA     2    17
3  3 19 NA     3    22
4  4 49 NA     4    53
5 18  0 NA     5    18


}