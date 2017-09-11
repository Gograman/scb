computeIsCoveredArrayFunction <- function()
{
  cat("\n Testing \'computeIsCoveredArray\'\n")

  mySampleSize=5
  myTParCount = 5
  mockTParArray <- createTParArray(tParCount = myTParCount)
  # may be different
  mockTVMA1Array <- createTVMA1CoefArray(coefFunction = sin,sampleSize = mySampleSize)
  myReplicationCount=8
  myLag = 1
  myLagCount = 3
  myKernel = normalDifferenceKernel
  myBandwidth = 0.5
  myNonCoverageProbability=0.05

  fileName <- paste("ss", mySampleSize, "l", myLag, "bandW", myBandwidth, "alpha"
                    , myNonCoverageProbability, sep = "_")
  bandsBrick=createBandsBrick(tParArray=mockTParArray,
                              lag=myLag,
                              lagCount=myLagCount,
                              bandwidth= myBandwidth,
                              kernel = normalDifferenceKernel,
                              sampleSize=mySampleSize,
                              nonCoverageProbability = myNonCoverageProbability,
                              replicationCount=myReplicationCount)
  mockCorArray <- computeCor(lag = myLag,coefFunction = sin,tParArray = mockTParArray)


Start=Sys.time()
      isCoveredArray <-
        computeIsCoveredArray(bandsBrick = bandsBrick,
                              corArray = mockCorArray,
                              fileName = fileName)
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

