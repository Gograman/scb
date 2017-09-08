createBandFunction <- function()
{
  cat("\n Testing \'createBand\' \n ")
  mySampleSize = 62
  myTParCount = 10
  mockTParArray <- createTParArray(tParCount = myTParCount)
  # may be different
  mockTVMA1Array <-
    createTVMA1CoefArray(coefFunction = sin, sampleSize = mySampleSize)



  myLag = 1
  myLagCount = 4
  myKernel = normalDifferenceKernel
  myBandwidth = 0.5
  myNonCoverageProbability = 0.05
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
  tParArray = tParArray,
  lag = myLag,
  sample = mySample,
  kernel = myKernel,
  bandwidth = myBandwidth
)

# myfileName <-
#   paste(
#     "ss",
#     sampleSize,
#     "l",
#     lag,
#     "bandW",
#     bandwidth,
#     "alpha"
#     ,
#     nonCoverageProbability,
#     sep = "_"
#   )
lowerBound <- corHat - meByCovHat
upperBound <- corHat + meByCovHat
band <- cbind(lowerBound, upperBound)
  # band <- createBand(
  #   tParArray = mockTParArray,
  #   lag = myLag,
  #   lagCount = myLagCount,
  #   bandwidth = myBandwidth,
  #   kernel = myKernel,
  #   sampleSize = mySampleSize,
  #   nonCoverageProbability = myNonCoverageProbability
  # )

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

