computeIsCoveredFunction = function()
{
  cat ("\n Testing \'computeIsCovered\'\n")

  mySampleSize = 10
  myTParCount = 10
  mockTParArray <- createTParArray(tParCount = myTParCount)
  # may be different
  mockTVMA1Array <-
    createTVMA1CoefArray(sampleSize = mySampleSize)

myCoefFunction=sin

  myLag = 2

  myLagCount =4
  myKernel = normalDifferenceKernel
  myBandwidth = 0.5
  myNonCoverageProbability = 0.05
  fileName <- paste("ss", mySampleSize, "l", myLag, "bandW", myBandwidth, "alpha"
                    , myNonCoverageProbability, sep = "_")
  mockBand = createBand(
    tParArray = mockTParArray,
    lag = myLag,
    lagCount = myLagCount,
    bandwidth = myBandwidth,
    kernel = myKernel,
    sampleSize = mySampleSize,
    nonCoverageProbability = myNonCoverageProbability
  )

  mockTVMA1CoefArray <- createTVMA1CoefArray(sampleSize = mySampleSize)

  mockCor <- computeCor(lag = myLag,tParArray = mockTParArray)

Start=Sys.time()
  isCovered <- computeIsCovered(mockBand,
                                mockCor,
                                fileName = fileName)
  End=Sys.time()
  Duration=End-Start


  cat("\nIsCovered:",isCovered, "\n")
  cat("Duration",Duration,"\n")
}

test_that("Testing computeIsCovered", {
  computeIsCoveredFunction()
  cat("End of test computeIsCovered","\n")
  cat("=====================")
})
