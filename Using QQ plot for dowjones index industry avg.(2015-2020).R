#Using Quantile-Quantile plot for the dowjones index industry avg (daily -(2015-2020) source: https://fred.stlouisfed.org/series/DJIA
rm(list=ls())
dj<-read.csv("Dowjones_dailyavg(15-20).csv",header=TRUE)
dj<-ts(dj)
n=length(dj)
par(mfrow=c(3,2))
#First, trying the normal probability plot for the dataset
qqnorm(dj,datax=TRUE,ylab="data",xlab="normal quantiles",main="(a) NPP for dowjones")
qqline(dj,datax=TRUE)
#the normal plot isn't too bad of a fit. Worth trying to fit t dist with df=1,2,4,8,15
dj_avg<-sort(dj)
grid=(1:n)/(1+n)

#tdist with df=1
qqplot(dj_avg,qt(grid,df=1),main="(b) tdist for dowjones(df=1)",xlab="data",ylab="t quantiles")
lmfit<-lm(qt(c(.25,.75),df=1)~quantile(dj_avg,c(0.25,0.75)))
abline(lmfit)

#tdist with df=2
qqplot(dj_avg,qt(grid,df=2),main="(c) tdist with dowjones(df=2)",xlab="data",ylab="t quantiles")
lmfit<-lm(qt(c(.25,.75),df=2)~quantile(dj_avg,c(0.25,0.75)))
abline(lmfit)

#tdist with df=4
qqplot(dj_avg,qt(grid,df=4),main="(d) tdist with dowjones(df=4)",xlab="data",ylab="t quantiles")
lmfit<-lm(qt(c(.25,.75),df=4)~quantile(dj_avg,c(0.25,0.75)))
abline(lmfit)

#tdist with df=8
qqplot(dj_avg,qt(grid,df=8),main="(e) tdist with dowjones(df=8)",xlab="data",ylab="t quantiles")
lmfit<-lm(qt(c(.25,.75),df=8)~quantile(dj_avg,c(0.25,0.75)))
abline(lmfit)

#tdist with df=15
qqplot(dj_avg,qt(grid,df=15),main="(f) tdist with dowjones(df=15)",xlab="data",ylab="t quantiles")
lmfit<-lm(qt(c(.25,.75),df=15)~quantile(dj_avg,c(.25,.75)))
abline(lmfit)

#tdist with df=1 is a really good fit to measure the industry avg for dowjones index. 
