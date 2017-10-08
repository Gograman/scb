errorIfNotInputCompatibleFunction=function()
{
  cat("\n Testing \'tests_06_errorIfNotInputCompatible\'")

  myLag= 1
  myAlpha <- 0.3
  mySampleSize <- computeMinSampleSize(myAlpha)
  errorIfNotInputCompatible(alpha = myAlpha,sampleSize = mySampleSize,lag=myLag)

}
test_that("Testing \'errorIfNotInputCompatibleFunction\'", {
  errorIfNotInputCompatibleFunction()
  cat("\n End of test errorIfNotInputCompatible", "\n")
  cat("=====================")
})
