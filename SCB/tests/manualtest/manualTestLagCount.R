sampleSizes <- 1:10
lags <- 1:10

lagCounts <- matrix(nrow = length(sampleSizes),ncol = length(lags))

for(i in sampleSizes)
{
  for(j in lags)
  {
    lagCounts[i,j]<- computeLagCount(sampleSize = sampleSizes[i],lag = lags[j])
  }
}

fileName <- "LagCount"

df <- data.frame(lagCounts)

saveCVS(fileName = fileName, doPath(), df)

saveJpg(fileName = fileName, doPath())

wireframe(lagCounts,row.values = sampleSizes,column.values = lags)

dev.off()
