doPath()
sampleSizes <- 1:1000
lags <- 1:1000

compatibles <- matrix(nrow = length(sampleSizes),ncol = length(lags))
cocoses <- numeric(length = length(sampleSizes))
for(i in sampleSizes)
{
  for(j in lags)
  {

    if(isInputCompatible(sampleSize = sampleSizes[j],lag = lags[i]))
    {
      cocoses[i] <- j
      break
    }
  }
}

plot(sampleSizes ~ lags,type = "n")
lines(cocoses)
