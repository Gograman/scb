computeCovHatFunction = function ( tParCount=10,sampleSize=10) {
  cat("\n Testing \'tests_31_computeCovHat\' \n")
  tParCount=tParCount
  tParArray=createTParArray(tParCount = tParCount)
  mySampleSize=sampleSize
  mockTVMA1CoefArray <- createTVMA1CoefArray(sampleSize = mySampleSize)
  mockSample <- createSample(sampleSize = mySampleSize)


  myLag = 3
  errorIfNotInputCompatible(alpha = 0.1,sampleSize = sampleSize,lag = myLag)
  myKernel = normalDifferenceKernel

  Start=Sys.time()
  mockCovHat <- computeCovHat(tParArray = tParArray,
                              lag = myLag,
                              sample = mockSample)
  End=Sys.time()
  Duration=End-Start

  cat ("mockCovHat[1:5] = ", mockCovHat[1:5], "\n")
  cat ("length(mockCovHat) = ", length(mockCovHat), "\n")
  cat("Duration= ",Duration,"\n")
  cat("=====================")
  cat("\nTest parameters :","\n")
  cat("sampleSize= ",sampleSize,"\n")
  cat("tParCount= ",tParCount,"\n")

  expect_that(mockCovHat, is_a("numeric"))
  # expect_that(dim(mockBand)[1], equals(2))  # the number of rows
  # expect_that(dim(mockBand)[2], equals(10)) # the number of cols

}

test_that("Testing \'computeCovHat\'", {
  computeCovHatFunction()
  cat(" End of test computeCovHat","\n")
  cat("=====================")

}

)
