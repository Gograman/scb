sampleSize <- 100
sample <- createSample(sampleSize = sampleSize)

tParCount <- 8
tParArray <- createTParArray(tParCount = tParCount)

alphas <- seq(0.1,0.9,by = 0.1)

lag <- 1
lagCount <- computeLagCount(sampleSize = sampleSize, lag = lag)

kernel <- normalDifferenceKernel
bandwidth <- 0.5

meArray <- matrix(nrow = length(tParArray),ncol = length(alphas))

for(indexCol in 1:length(alphas))
{

  allCorHats <- computeAllCorHats(tParArray = tParArray,
                                  lagCount = lagCount,
                                  sample = sample,
                                  kernel = kernel,
                                  bandwidth = bandwidth)

  meArray[,indexCol] <- computeMEbyCovHat(tParArray = tParArray,
                                          lag = lag,
                                          lagCount = myLagCount,
                                          sample = sample,
                                          kernel = normalDifferenceKernel,
                                          bandwidth = bandwidth,
                                          nonCoverageProbability = alphas[indexCol],
                                          allCorHats = allCorHats,
                                          C_K = -1.978325,
                                          # int_sq_der = 0.306951,
                                          PHI_K_NORMAL_DIFF = 0.4065)
}

fileName <- paste("meArray3D",sep = "_")

path <- doPath()
saveCVS(fileName = fileName,path = path,dataToSave = meArray)
saveJpg(fileName = fileName,path = path)
wireframe(meArray,row.values=tParArray,column.values=alphas,
          xlab="tParArray",ylab = "NonCoverageProbability")
graphics.off()
