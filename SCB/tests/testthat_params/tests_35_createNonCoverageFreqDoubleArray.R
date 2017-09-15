  createNonCoverageFreqDoubleArrayFunction <- function (sampleSize = 5,
                                                        lag = 1,
                                                        alphaCount=2,
                                                        tParCount = 10,
                                                        bandwidth = 0.5,
                                                        nonCoverageProbability = 0.05,
                                                        replicationCount = 3,
                                                        superReplicationCount = 4) {
    cat("\n Testing \'createNonCoverageFreqDoubleArray\' \n")
    myAlphaCount = alphaCount
    myTParCount  <- tParCount
    myTParArray  <- createTParArray(tParCount = myTParCount)
    mySuperReplicationCount <-superReplicationCount
    myReplicationCount <- replicationCount
    mySampleSize <- sampleSize
    myLag <- lag
    myLagCount <- computeLagCount(lag = myLag,sampleSize = mySampleSize)
    myKernel <- normalDifferenceKernel
    myAlphaArray <- seq(from = 0.05,
                      to   = 1 - 1 / myAlphaCount,
                      by   = 1 / myAlphaCount)

  nonCoverageProbabilities <- c(0.2,0.4,0.6,0.8)
    myBandwidth <- bandwidth
    Start=Sys.time()
    doubleAlphaArray = createDoubleAlphaArray(
      superReplicationCount = mySuperReplicationCount,
      replicationCount = myReplicationCount,
      sampleSize = mySampleSize,
      alphaArray =myAlphaArray,
      lag = myLag,
      lagCount = myLagCount,
      tParArray = myTParArray,
      kernel = myKernel,
      bandwidth = myBandwidth)
    End=Sys.time()
    duration=End-Start
    cat("\nDoubleAlphaHatArray= ",doubleAlphaArray)
    cat("\nAlphaArray: ",nonCoverageProbabilities)
    cat("\n size of double array= ",length(doubleAlphaArray))
    cat("\n Duration= ",duration)
    # expect_that(mockBand, is_a("matrix"))
    # expect_that(dim(mockBand)[1], equals(2))  # the number of rows
    # expect_that(dim(mockBand)[2], equals(10)) # the number of cols

  }

  test_that("Testing \' createNonCoverageFreqDoubleArray\'", {
    createNonCoverageFreqDoubleArrayFunction()
  })
