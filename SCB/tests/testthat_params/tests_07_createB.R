createBFunction<-function()
{
  cat("\n Testing \'createB\' \n")
  mySampleSize = scbParams$sampleSize
  Start=Sys.time()
  b <- computeB(mySampleSize)
  End=Sys.time()
  Duration=End-Start

  cat("bandwidth =", b, "\n")
  cat("Duration =",Duration,"\n")
}
  test_that("Testing  \'createB\'", {
    createBFunction()
    cat(" End of test createB","\n")
    cat("=====================")
  }
  )


