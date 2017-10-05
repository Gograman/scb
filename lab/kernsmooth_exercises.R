library("KernSmooth")
data(geyser, package = "MASS")
x <- geyser$duration
x
y <- geyser$waiting
y
head (y)
head (x)
plot(x, y)
h <- dpill(x, y)
h
h = 0.05
fit <- locpoly(x, y, bandwidth = h)
fit
lines(fit)

######################

data(geyser, package="MASS")
x <- geyser$duration
x
h <- dpik(x)
h
est <- bkde(x, bandwidth=h)
plot(est,type="l")



######################
data(geyser, package="MASS")
x <- geyser$duration
x
plot(x)
est <- bkde(x, bandwidth=0.25)
est
plot(est, type="l")

######################

data(geyser, package="MASS")
x <- geyser$duration
x
est <- bkfe(x, drv=4, bandwidth=0.3)
est
######################


data(geyser, package="MASS")
x <- geyser$duration
h <- dpih(x)
h
bins <- seq(min(x)-h, max(x)+h, by=h)
bins
hist(x, breaks=bins)

?geyser
