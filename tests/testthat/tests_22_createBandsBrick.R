createBandsBrickFunction <- function()
{
  cat ("\n Testing \'createBandsBrick\'\n")
  mySampleSize=40
  myTParCount = 2
  mockTParArray <- createTParArray(tParCount = myTParCount)
  # may be different
  mockTVMA1Array <- createTVMA1CoefArray(sampleSize = mySampleSize)
  myReplicationCount=5
  myLag = 1
  myLagCount = 4
  myKernel = normalDifferenceKernel
  myBandwidth = 0.5
  myNonCoverageProbability=0.05

Start=Sys.time()
bandsBrick=createBandsBrick(tParArray=mockTParArray,
                            lag=myLag,
                            bandwidth= myBandwidth,
                            kernel = normalDifferenceKernel,
                            sampleSize=mySampleSize,
                            nonCoverageProbability = myNonCoverageProbability,
                            replicationCount=myReplicationCount)
End=Sys.time()
Duration=End-Start
cat("bandsArray", bandsBrick[1:5])
cat("\nDuration",Duration,"\n")
}
test_that("createBandsBrick", {
  createBandsBrickFunction()
  cat("End of test createBandsBrick","\n")
  cat("=====================")
})
