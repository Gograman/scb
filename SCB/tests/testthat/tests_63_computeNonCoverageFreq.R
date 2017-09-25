  computeNonCoverageFreqFunction <- function()

  {
    cat ("\n Testing \'tests_63_computeNonCoverageFreq\' \n")

    myTParCount  <- 10
    mockTParArray  <- createTParArray(tParCount = myTParCount)
    myReplicationCount <- 5
    mySampleSize <-100
    mySuperReplicationCount <- 10
    myLag <- 1
    myLagCount <- computeLagCount(lag = myLag,sampleSize = mySampleSize)

    trueCorArray <- computeCor(lag = myLag,tParArray = mockTParArray)


    myKernel <- normalDifferenceKernel
    myNonCoverageProbability <- 0.05
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

    Start=Sys.time()

   nonCoverageFreq <- computeNonCoverageFreq(replicationCount = myReplicationCount,
                                            sampleSize = mySampleSize,
                                            lagCount = myLagCount,
                                            lag = myLag,
                                            tParArray = mockTParArray,
                                            corArray = trueCorArray,
                                            kernel = myKernel,
                                            nonCoverageProbability = myNonCoverageProbability,
                                            superReplicationCount = mySuperReplicationCount,
                                            fileName = "tests_63_computeNonCoverageFreq")
End=Sys.time()
Duration=End-Start

   cat("NonCoverageFreq:", nonCoverageFreq)
   cat("\nDuration= ",Duration,"\n")
   cat("=====================")
   cat("\nTest parameters :","\n")
   cat("SampleSize= ",mySampleSize,"\n")
   cat("TParCount= ",myTParCount,"\n")
   cat("Lag= ",myLag,"\n")
   cat("LagCount= ",myLagCount,"\n")
   cat("ReplicationCount= ",myReplicationCount,"\n")
   cat("SuperReplicationCount= ",mySuperReplicationCount,"\n")
   cat("NonCoverageProbability= ",myNonCoverageProbability,"\n")
     cat("\nEnd of test of computeNonCoverageFreq","\n")
     cat("=====================")
  }

  test_that("computeNonCoverageFreq", {
    computeNonCoverageFreqFunction()
  })

