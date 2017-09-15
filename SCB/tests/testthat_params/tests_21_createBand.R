createBandFunction <- function(sampleSize=5,lag=1,tParCount=10,bandwidth=0.5,nonCoverageProbability=0.05)
{
  cat("\n Testing \'createBand\' \n ")
  mySampleSize = sampleSize
  myTParCount = tParCount
  mockTParArray <- createTParArray(tParCount = myTParCount)
  # may be different
  mockTVMA1Array <-
    createTVMA1CoefArray(sampleSize = mySampleSize)



  myLag = lag
  myLagCount = computeLagCount(lag = myLag,sampleSize = mySampleSize)
  myKernel = normalDifferenceKernel
  myBandwidth = bandwidth
  myNonCoverageProbability = nonCoverageProbability
Start=Sys.time()
mySample <- createSample(sampleSize = mySampleSize)

mockallCorHat = computeAllCorHats(
  tParArray = mockTParArray,
  lagCount = myLagCount,
  sample = mySample,
  kernel = myKernel,
  bandwidth = myBandwidth

)

meByCovHat <- computeMEbyCovHat(
  tParArray = mockTParArray,
  lag = myLag,
  lagCount = myLagCount,
  sample = mySample,
  bandwidth = 0.5,
  nonCoverageProbability = myNonCoverageProbability,
  allCorHats = mockallCorHat,
  C_K = -1.978325,
  PHI_K_NORMAL_DIFF = 0.4065)

corHat = computeCorHat(
  tParArray = mockTParArray,
  lag = myLag,
  sample = mySample,
  kernel = myKernel,
  bandwidth = myBandwidth
)

lowerBound <- corHat - meByCovHat
upperBound <- corHat + meByCovHat
band <- cbind(lowerBound, upperBound)
End=Sys.time()
Duration=End-Start


cat("\nsize of band",length(band))
  cat("\nband1", band)
  cat("\nDuration= ",Duration)

}

test_that("Testing \'createBand\'", {
  createBandFunction()
  cat("\nEnd of test createBand", "\n")
  cat("=====================")
})

