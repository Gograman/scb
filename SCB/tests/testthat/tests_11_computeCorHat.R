computeCorHatFunction = function () {
  cat("\n Testing \'computeCorHat\' \n")

  tParCount = 10
  mySampleSize=100
  mockTParArray <- createTParArray(tParCount = tParCount)
  mockTVMA1CoefArray <- createTVMA1CoefArray(coefFunction = sin,sampleSize = mySampleSize)

  mockSample <- createSample(sampleSize = mySampleSize)

  myLag = 1
  myKernel = normalDifferenceKernel
  myBandwidth = 1
Start=Sys.time()
  mockCorHat <- computeCorHat(tParArray = mockTParArray,
                              lag = myLag,
                              sample = mockSample,
                              kernel = myKernel,
                              bandwidth = myBandwidth)
End=Sys.time()
Duration=End-Start

  cat("mockCorHat[1:5] = ", mockCorHat[1:5], "\n")
  cat ("length(mockCorHat) = ", length(mockCorHat), "\n")
  cat("Duration= ",Duration,"\n")
  expect_that(mockCorHat, is_a("numeric"))

  # expect_that(mockBand, is_a("matrix"))
  # expect_that(dim(mockBand)[1], equals(2))  # the number of rows
  # expect_that(dim(mockBand)[2], equals(10)) # the number of cols

}

test_that("Testing \'computeCorHat\'", {
  computeCorHatFunction()
  cat(" End of test computeCorHat","\n")
  cat("=====================")
}

)
