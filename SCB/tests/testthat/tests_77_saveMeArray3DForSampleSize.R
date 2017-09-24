saveMe3DForSampleSizeFunction <- function()
{
  alphas <- seq(0.1,0.9,by = 0.2)
  sampleSize <- seq(20, 100,by = 20)

  tParCount <- 10
  tParArray <- createTParArray(tParCount = tParCount)
  tParArrayCenter <- round(length(tParArray)/2,0)

  lag <- 1

  kernel <- normalDifferenceKernel

  meArray <- matrix(nrow = length(sampleSize),ncol = length(alphas))
  for(indexRow in 1:length(sampleSize))
  {
    for(indexCol in 1:length(alphas))
    {
      lagCount <- computeLagCount(sampleSize = sampleSize[indexRow],lag = lag)

      bandwidth <- computeB(sampleSize[indexRow])

      sample <- createSample(sampleSize = sampleSize[indexRow])

      allCorHats <- computeAllCorHats(tParArray = tParArray,
                                      lagCount = lagCount,
                                      sample = sample,
                                      kernel = kernel,
                                      bandwidth = bandwidth)

      me <- computeMEbyCovHat(tParArray = tParArray,
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
      meArray[indexRow,indexCol] <- me[tParArrayCenter]

    }
  }
  fileName <- paste("meArray3DOfSampleSize",sep = "_")

  path <- doPath()
  saveCVS(fileName = fileName,path = path,dataToSave = meArray)
  saveJpg(fileName = fileName,path = path)
  wireframe(meArray,row.values=sampleSize,column.values=alphas,
            xlab="sampleSize",ylab = "NonCoverageProbability",
            screen = list(z=250,x=-75))
  graphics.off()
}
test_that("testing saveMe3DForSampleSize",
          {
            saveMe3DForSampleSizeFunction()
            cat(" End of test saveMe3DForSampleSize", "\n")
            cat("=========================================")
          })
