computeIsCoveredArrayFunction <- function()
{
  cat("\n Testing \'computeIsCoveredArray\'\n")

  mySampleSize=5
  myTParCount = 5
  mockTParArray <- createTParArray(tParCount = myTParCount)
  # may be different
  mockTVMA1Array <- createTVMA1CoefArray(sampleSize = mySampleSize)
  myReplicationCount=8
  myLag = 1

  myLagCount = computeLagCount(lag = myLag,sampleSize = mySampleSize)
  myKernel = normalDifferenceKernel
  myBandwidth = 0.5
  mySuperReplicationCount <- 3
  myNonCoverageProbability <- 0.05


  bandsBrick=createBandsBrick(tParArray=mockTParArray,
                              lag=myLag,
                              lagCount=myLagCount,
                              bandwidth= myBandwidth,
                              kernel = normalDifferenceKernel,
                              sampleSize=mySampleSize,
                              nonCoverageProbability = myNonCoverageProbability,
                              replicationCount=myReplicationCount)
  mockCorArray <- computeCor(lag = myLag,tParArray = mockTParArray)


Start=Sys.time()
      isCoveredArray <-
        computeIsCoveredArray(bandsBrick = bandsBrick,
                              corArray = mockCorArray,
                              sampleSize = mySampleSize,
                              bandwidth = myBandwidth,
                              lag = myLag,
                              replicationCount = myReplicationCount,
                              superReplicationCount = mySuperReplicationCount,
                              nonCoverageProbability = myNonCoverageProbability,
                              fileName = "tests_62_computeIsCoveredArray")
End=Sys.time()
Duration=End-Start

      # expect(5 == 5)
      cat("isCoveredArray: ", isCoveredArray)
      cat("\nDuration= ",Duration,"\n")




}

test_that("Testing \'isCoveredArray\'", {
  computeIsCoveredArrayFunction()
  cat("End of test isCoveredArray","\n")
  cat("=====================")
})

