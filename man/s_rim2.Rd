\name{s_rim2}
\alias{s_rim2}
\title{RIM valuation}
\usage{
s_rim2()
}
\description{
Stock Valuation2
}
\examples{
# 입력 자료 출처: finance.naver.com -> 종목분석 -> 기업현황
# ROE > Ke
> s_rim2('21,613', 12.51, 8, '46,957,120')
> [1] 71975 56406 51958
# ROE < Ke
> s_rim2('21,613', 12.51, 33, '46,957,120')
> [1] NA NA NA
}
