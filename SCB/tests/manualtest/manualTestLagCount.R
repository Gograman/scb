doPath()
sampleSizes <- 1:100
lags <- 1:100

lagCounts <- matrix(nrow = length(sampleSizes),ncol = length(lags))

for(i in sampleSizes)
{
  for(j in lags)
  {
    lagCounts[i,j]<- computeLagCount(sampleSize = sampleSizes[i],lag = lags[j])
  }
}


wireframe(lagCounts,row.values = sampleSizes,column.values = lags)


