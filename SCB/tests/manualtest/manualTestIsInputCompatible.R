sampleSizes <- 1:100
lags <- 1:100

compatibles <- matrix(nrow = length(sampleSizes),ncol = length(lags))
cocoses <- numeric(length = length(sampleSizes))
for(i in sampleSizes)
{
  for(j in lags)
  {
    compatibles[i,j] <- isInputCompatible(sampleSize = sampleSizes[j], lag = lags[i])

    if(isInputCompatible(sampleSize = sampleSizes[j],lag = lags[i]))
    {
      cocoses[i] <- j
      break
    }
  }
}
fileName <- "IsinPutCompatible"



saveJpg(fileName = fileName, doPath())

saveCVS(fileName = fileName, doPath(), compatibles)

plot(sampleSizes ~ lags,type = "n",xlim=c(5,80),ylim=c(5,80))

title("Is input Compatible")

legend("bottomright",c("compatibles"),fill = c("red"))

lines(cocoses,col="red")

dev.off(

)

