errorIfNotInputCompatibleFunction=function()
{
  mySampleSize=40
  myLag=4
  errorIfNotInputCompatible(sampleSize = mySampleSize,lag=myLag)

}
test_that("Testing \'createBand\'", {
  errorIfNotInputCompatibleFunction()
  cat("\n End of test errorIfNotInputCompatible", "\n")
  cat("=====================")
})
