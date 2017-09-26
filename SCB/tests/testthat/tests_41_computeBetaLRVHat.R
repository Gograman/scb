computeBetaLRVHatFunction = function () {
  cat("\n Testing \'tests_41_computeBetaLRVHat\' \n")
  mySampleSize =8
  myTParCount = 5
  mockTParArray <- createTParArray(tParCount = myTParCount)
  # may be different
  mockTVMA1Array <- createTVMA1CoefArray(sampleSize = mySampleSize)

  mockSample <- createSample(sampleSize = mySampleSize)

  myLag = 0
  myLagCount = computeLagCount(mySampleSize,myLag)
  myKernel = normalDifferenceKernel
 # form all rho hats
  # first try fakes
  mockAllCorHats <- computeAllCorHats(tParArray = mockTParArray,
                                    lagCount = myLagCount,
                                    sample = mockSample,
                                    kernel = myKernel)
Start=Sys.time()
  mockBetaLRVHat <- computeBetaLRVHat(tParArray = mockTParArray,
                                      lag = myLag,
                                      sample = mockSample,
                                      kernel = myKernel,
                                      allCorHats = mockAllCorHats)
End=Sys.time()
Duration=End-Start

  cat("mockBetaLRVHat[1:5] =", mockBetaLRVHat[1:5], "\n")
  cat("Duration= ",Duration,"\n")
  cat("=====================")
  cat("\nTest parameters :","\n")
  cat("SampleSize= ",mySampleSize,"\n")
  cat("TParCount= ",myTParCount,"\n")
  cat("Lag= ",myLag,"\n")
  cat("LagCount= ",myLagCount,"\n")

  # expect_that(betaLRVHat, is_a("matrix"))
  # expect_that(dim(betaLRVHat)[1], equals(2))  # the number of rows
  # expect_that(dim(betaLRVHat)[2], equals(10)) # the number of cols

}

test_that("Testing \'computeBetaLRVHat\'", {
  computeBetaLRVHatFunction()
  cat("End of test computeBetaLRVHat","\n")
  cat("=====================")
  }
)



