  computeNonCoverageFreqFunction <- function(sampleSize = 5,
                                             lag = 1,
                                             tParCount = 10,
                                             bandwidth = 0.5,
                                             nonCoverageProbability = 0.05,
                                             replicationCount = 3,
                                             superReplicationCount = 4)

  {
    cat ("\n Testing \'computeNonCoverageFreq\' \n")

    myTParCount  <-tParCount
    mockTParArray  <- createTParArray(tParCount = myTParCount)
    myReplicationCount <-replicationCount
    mySampleSize <-sampleSize
    myLag <- lag
    myLagCount <- computeLagCount(lag = myLag,sampleSize = mySampleSize)

    trueCorArray <- computeCor(lag = myLag,tParArray = mockTParArray)


    myKernel <- normalDifferenceKernel
    myBandwidth <- bandwidth
    myNonCoverageProbability <- nonCoverageProbability
  #   bandsBrick = createBandsBrick(sampleSize = mySampleSize,
  #                                 tParArray  = mockTParArray,
  #                                 lag        = myLag,
  #                                 lagCount   = myLagCount,
  #                                 bandwidth  = myBandwidth,
  #                                 kernel     = normalDifferenceKernel,
  #                                 nonCoverageProbability = myNonCoverageProbability,
  #                                 replicationCount       = myReplicationCount)
  #    isCoveredArray <- computeIsCoveredArray(bandsBrick,
  #                                       trueCorArray)
  #    cat("\ncompute is covered array",isCoveredArray)
  #   zeroCount = 0
  #   replicationCount = dim(bandsBrick)[1]
  #   cat("\nreplication Count",replicationCount)
  #   for (i in 1:length(isCoveredArray)) {
  #     if (isCoveredArray[i] == 0) {
  #       zeroCount <- zeroCount + 1
  #     }
  #   }
  # cat("\nzeroCount",zeroCount)
  #   nonCoverageFreq <- zeroCount / replicationCount
    fileName <- paste("ss", mySampleSize, "l", myLag, "bandW", myBandwidth, "alpha"
                      , myNonCoverageProbability, sep = "_")
    Start=Sys.time()

   nonCoverageFreq <- computeNonCoverageFreq(replicationCount = myReplicationCount,
                                            sampleSize = mySampleSize,
                                            lagCount = myLagCount,
                                            lag = myLag,
                                            tParArray = mockTParArray,
                                            corArray = trueCorArray,
                                            kernel = myKernel,
                                            bandwidth = myBandwidth,
                                            nonCoverageProbability = myNonCoverageProbability,
                                            superReplicationCount =superReplicationCount )
End=Sys.time()
Duration=End-Start

   cat("NonCoverageFreq:", nonCoverageFreq)
   cat("\nDuration= ",Duration)
     cat("\nEnd of test of computeNonCoverageFreq","\n")
     cat("=====================")
  }

  test_that("computeNonCoverageFreqDist", {
    computeNonCoverageFreqFunction()
  })

