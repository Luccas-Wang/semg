
# generate variance profile
v=c(rep(1,200),rep(4,100),rep(1,100),rep(30,100),rep(1,200),rep(4,200))

# generate simulated signal
y=sqrt(v)*rnorm(length(v));

# algorithmExplanation ----------------------------------------------------

par(mfrow=c(2,1))
par(mar=c(4, 4, 0.5, 0.3)) 
#par(mgp=c(2, 3, 3))
par(cex=0.7)
plot(y, xlab = "", ylab="", type="l")
title(xlab = "time (ms)", ylab = "electrical potential", mgp=c(2,4,4), font.lab=2)
abline(v = c(200,300), lty = 2)
abline(v = c(400,500))
abline(v = c(700), lty = 3)
plot(cumsum(y^2), xlab = "", ylab = "", type="l")
title(xlab = "time (ms)", ylab = "cummulated variance",mgp=c(2,4,4), font.lab=2)
abline(v = c(200,300), lty = 2)
abline(v = c(400,500))
abline(v = c(700), lty = 3)

sy = cumsum(y^2)
Qs = c(sy[200]-sy[1],sy[300]-sy[201],sy[400]-sy[301],sy[500]-sy[401])
Qc = c(Qs[1]+Qs[3]/2,Qs[2],Qs[1]+Qs[3]/2,Qs[4])
Qs / Qc
# apply whitening filter
# y=ma_whitefil(y,8); % uncomment this line when working with real SEMG data
Qs = c(186.64 / 200, 431.91 / 100, 99.95 / 100, 2588.19 / 100)
Qc = c(Qs[1]+Qs[3]/2,Qs[2],Qs[1]+Qs[3]/2,Qs[4])