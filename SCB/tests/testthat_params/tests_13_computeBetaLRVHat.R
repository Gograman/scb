computeBetaLRVHatFunction = function () {
  cat("\n Testing \'computeBetaLRVHat\' \n")
  mySampleSize = scbParams$sampleSize
  myTParCount = scbParams$tParCount
  mockTParArray <- createTParArray(tParCount = myTParCount)
  # may be different
  mockTVMA1Array <- createTVMA1CoefArray(sampleSize = mySampleSize)

  mockSample <- createSample(sampleSize = mySampleSize)

  myLag = scbParams$lag
  myLagCount = myTParCount - 1
  myKernel = normalDifferenceKernel
  myBandwidth = scbParams$bwidth
 # form all rho hats
  # first try fakes
  mockAllCorHats <- computeAllCorHats(tParArray = mockTParArray,
                                    lagCount = myLagCount,
                                    sample = mockSample,
                                    kernel = myKernel,
                                    bandwidth = myBandwidth)
Start=Sys.time()
  mockBetaLRVHat <- computeBetaLRVHat(tParArray = mockTParArray,
                                      lag = myLag,
                                      sample = mockSample,
                                      kernel = myKernel,
                                      bandwidth = myBandwidth,
                                      allCorHats = mockAllCorHats)
End=Sys.time()
Duration=End-Start

  cat("mockBetaLRVHat[1:5] =", mockBetaLRVHat[1:5], "\n")
  cat("Duration= ",Duration,"\n")
  # expect_that(betaLRVHat, is_a("matrix"))
  # expect_that(dim(betaLRVHat)[1], equals(2))  # the number of rows
  # expect_that(dim(betaLRVHat)[2], equals(10)) # the number of cols

}

test_that("Testing \'computeBetaLRVHat\'", {
  computeBetaLRVHatFunction()
  cat(" End of test computeBetaLRVHat","\n")
  cat("=====================")
  }
)



