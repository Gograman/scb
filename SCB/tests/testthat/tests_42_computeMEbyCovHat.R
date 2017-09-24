computeMEbyCovHatFunction = function ()
{

cat("\n Testing \'computeMEbyCovHatFunction\' \n")

  myBandwidth = 0.5
  myNonCoverageProbability = 0.9
  mySampleSize = 10
  myTParCount = 10

  mockTParArray <- createTParArray(tParCount = myTParCount)
  # may be different

  mockSample <- createSample(sampleSize = mySampleSize)

  myLag = 4
  cat ("\n myLag = ", myLag)

  errorIfNotInputCompatible(sampleSize = mySampleSize,lag = myLag)

  myLagCount = computeLagCount(lag=myLag,sampleSize = mySampleSize)
  cat ("\n myLagCount = ", myLagCount)

  myKernel = normalDifferenceKernel

  # form all rho hats
  # first try fakes
  mockAllCorHats <- computeAllCorHats(tParArray = mockTParArray,
                                      lagCount = myLagCount,
                                      sample = mockSample,
                                      kernel = myKernel,
                                      bandwidth = myBandwidth)
  Start=Sys.time()
  me <- computeMEbyCovHat(tParArray = mockTParArray,
                          lag = myLag,
                          lagCount = myLagCount,
                          sample = mockSample,
                          kernel = normalDifferenceKernel,
                          bandwidth = myBandwidth,
                          nonCoverageProbability = myNonCoverageProbability,
                          allCorHats = mockAllCorHats,
                          C_K = -1.978325,
                          # int_sq_der = 0.306951,
                          PHI_K_NORMAL_DIFF = 0.4065)

  End=Sys.time()
  Duration=End-Start

  # expect_that(mockBand, is_a("matrix"))
  # expect_that(dim(mockBand)[1], equals(2))  # the number of rows
  # expect_that(dim(mockBand)[2], equals(10)) # the number of cols

  cat(" me = ", me, "\n")
  cat("Duration= ",Duration,"\n")
}

test_that("Testing \'computeMEbyCovHat\'", {
  computeMEbyCovHatFunction()
  cat(" End of test computeMEbyCovHat","\n")
  cat("=====================")
}
)

