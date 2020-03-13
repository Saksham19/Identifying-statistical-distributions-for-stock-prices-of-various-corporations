#Trying to use the normal probability plot for amzn closing price (2014-19)

Amzn<-read.csv("AMZNtrain.csv")
Acl<-Amzn$Close
x<-rnorm(Acl,0,1)
qqnorm(x,datax = TRUE,ylab="empirical quartiles",xlab="theoretical quartiles",main="amzn close npp")
qqline(x,datax=TRUE)
#Actually fits in really well with the reference line except for a slight amount of outliers. Might be worth looking into the t dist or lognormal dist

#t dist:
set.seed(1234567)
x<-rt(Acl,4)
qqnorm(x,datax=TRUE)
qqline(x,datax=TRUE)
#not really the best fit.

#Lognormal dist:
x<-rlnorm(Acl,0,1)
qqnorm(x,datax=TRUE)
qqline(x,datax=TRUE)

x<-rlnorm(Acl,1,1.5)
qqnorm(x,datax=TRUE)
qqline(x,datax=TRUE)
#the figure is right skewed, as it should be for a lognormal plot but it doesn't fit in well with the reference line.

#best choice: normal dist. for the amzn closing price.