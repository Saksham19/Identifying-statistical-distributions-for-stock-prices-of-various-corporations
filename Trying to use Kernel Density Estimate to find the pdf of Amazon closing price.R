#trying to use kernel density estimation to estimate probability density fncn. for the  daily amazon stock closing price and hopefully relate to some existing statistical distribution
rm(list=ls())
Aclose<-read.csv("AMZNtrain.csv") #loading the data. data obtained from kaggle.com
Aclose<-ts(Aclose$Close,freq=270)
x<-density(Aclose,bw = "nrd0",adjust = 1)
y<-density(Aclose,bw="nrd0",adjust=1/3)
z<-density(Aclose,bw="nrd0",adjust=3)
plot(x,lty=1,main="Daily Amazon stock closing price using kde",xlab="days",ylab="kde")
lines(y,lty=2)
lines(z,lty=3)
#although we can't recognize any major distributions, adjust=3 is probably the closest to normal distribution in this case.

#trying to fit a normal distribution for this example
rm(list=ls())
Aclose<-read.csv("AMZNtrain.csv")
Aclose<-ts(Aclose$Close,freq=270)
z<-density(Aclose,bw="nrd0",adjust=3)
plot(z,lty=1,main="Daily Amazon stock closing price using kde with b=3",xlab="days",ylab="kde",cex.main=0.7)
lines(seq(-500,2500,1),dnorm(seq(-500,2500,1),mean(Aclose),sd(Aclose)),lty=2)
#the kde with b=3 seems to be right skewed, still not a bad match.

#with less extreme estimates i.e. median and mean absolute deviation:
rm(list=ls())
Aclose<-read.csv("AMZNtrain.csv")
Aclose<-ts(Aclose$Close,freq=270)
z<-density(Aclose,bw="nrd0",adjust=3)
plot(z,lty=1,main="Daily Amazon stock closing price using kde with b=3",xlab="days",ylab="kde",cex.main=0.7)
lines(seq(-500,2500,1),dnorm(seq(-500,2500,1),median(Aclose),mad(Aclose)),lty=2)
#a little better now. This shows that extreme observations might be affecting the kde. KDE only provides an empirical method to try and find the pdf of the closing price of the amazon stock, to try and identify similatirities to existing statistical distributions.
#Our best guess for this dataset is that it almost follows a normal dist., which we identified by finding the pdf for this dataset using the kernel density estimator.