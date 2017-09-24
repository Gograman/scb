computeCorTestFunction = function () {
  cat("\n Testing \'computeCor\' \n")

  myTParCount = 10
  myLag = 0
  mySampleSize=40

  mockTParArray <- createTParArray(tParCount = myTParCount)
  mockTVMA1CoefArray <- createTVMA1CoefArray(sampleSize = mySampleSize)
  mockComputeCor <- computeCor(lag = myLag,tParArray = mockTParArray)

  cat ("lag = 0; mockComputeCor[1:5] =", mockComputeCor[1:5], "\n")
Start=Sys.time()
  myLag = 1
  mockComputeCor <- computeCor(lag = myLag,tParArray = mockTParArray)
  cat ("lag = 1; mockComputeCor[1:5] =", mockComputeCor[1:5], "\n")

  myLag = 2
  mockComputeCor <- computeCor(lag = myLag,tParArray = mockTParArray)
  cat ("lag = 2; mockComputeCor[1:5] =", mockComputeCor[1:5], "\n")
End=Sys.time()
Duration=End-Start
cat("Duration= ",Duration,"\n")
cat("=====================")
cat("\nTest parameters :","\n")
cat("SampleSize= ",mySampleSize,"\n")
cat("TParCount= ",myTParCount,"\n")
cat("Lag= ",myLag,"\n")

  cat ("length(mockComputeCor) =", length(mockComputeCor), "\n")

  # expect_that(mockComputeCor, is_a("numeric"))
}

test_that("Testing \'computeCor\'", {
  computeCorTestFunction()
  cat(" End of test computeCor","\n")
  cat("=====================")
  }
)
