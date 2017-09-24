errorIfNotInputCompatibleFunction=function()
{
  mySampleSize=40
  myLag=4
  myAlpha <- 0.8
  errorIfNotInputCompatible(alpha = myAlpha,sampleSize = mySampleSize,lag=myLag)

}
test_that("Testing \'errorIfNotInputCompatibleFunction\'", {
  errorIfNotInputCompatibleFunction()
  cat("\n End of test errorIfNotInputCompatible", "\n")
  cat("=====================")
})
