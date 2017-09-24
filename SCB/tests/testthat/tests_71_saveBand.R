saveBandFuction <- function()
{
  cat ("\n Testing \'SaveBand\'\n")

  mySampleSize = 100
  myTParCount = 10
  mockTParArray <- createTParArray(tParCount = myTParCount)
  myLag = 2
  myLagCount = computeLagCount(lag = myLag,sampleSize = mySampleSize)
  myKernel = normalDifferenceKernel
  myBandwidth = 0.5
  myNonCoverageProbability = 0.05
  mySuperReplicationCount <- 7
  myReplicationCount <- 6

  corArray <-
    computeCor(lag = myLag,
               tParArray = mockTParArray)
  #samplesize,lag,bandwitdth,nonCoverageProbability - params for file name
  band <- createBand(
    tParArray = mockTParArray,
    lag = myLag,
    lagCount = myLagCount,
    bandwidth = myBandwidth,
    kernel = myKernel,
    sampleSize = mySampleSize,
    nonCoverageProbability = myNonCoverageProbability
  )



  Start = Sys.time()
  saveBand(band = band,
           corArray = corArray, sampleSize = mySampleSize, lag = myLag,
           replicationCount = myReplicationCount, bandwidth = myBandwidth,
           superReplicationCount = mySuperReplicationCount,
           nonCoverageProbability = myNonCoverageProbability,
           fileName="test_71_saveBand")
  End = Sys.time()
  Duration = End - Start
  cat("\nDuration= ",Duration, "\n")
  cat("=====================")
  cat("\nTest parameters :","\n")
  cat("SampleSize= ",mySampleSize,"\n")
  cat("TParCount= ",myTParCount,"\n")
  cat("Lag= ",myLag,"\n")
  cat("LagCount= ",myLagCount,"\n")
  cat("NonCoverageProbability= ",myNonCoverageProbability,"\n")
  cat("ReplicationCount= ",myReplicationCount,"\n")
  cat("SuperReplicationCount= ",mySuperReplicationCount,"\n")
  cat("Bandwidth= ",myBandwidth,"\n")


}

test_that("Testing saveBand",
          {
            saveBandFuction()
            cat(" End of test saveBand", "\n")
            cat("=====================")
          })
