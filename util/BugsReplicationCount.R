myTParCount  <-10
mySuperReplicationCount <- 4
myNonCoverageProbability <- 0.05
mySampleSize <- computeMinSampleSize(myNonCoverageProbability)
myLag <- 1

myReplicationCount <- 4:10
errorIfNotInputCompatible(myNonCoverageProbability,myLag,mySampleSize)
testUtilReplicationCountBenchmark(sampleSize = mySampleSize,
                                  superReplicationCount = mySuperReplicationCount,
                                  tParCount = myTParCount,
                                  nonCoverageProbability = myNonCoverageProbability,
                                  replicationCountArray = myReplicationCount,
                                  lag = myLag)

