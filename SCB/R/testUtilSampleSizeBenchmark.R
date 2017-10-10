testUtilSampleSizeBenchmark<-function(sampleSizeArray,
                                      tParCount,
                                      superReplicationCount,
                                      replicationCount,
                                      lag,
                                      nonCoverageProbability )
{
  fileName <- paste( "Benchmark_Samplesize","l", lag, "alpha"
                     , nonCoverageProbability, sep = "_")
  path <-doPath()


  tParArray <- createTParArray(tParCount)





  duration <- numeric(length = length(sampleSizeArray))

  for(i in 1: length(sampleSizeArray))
  {
    lagCount <- computeLagCount(sampleSizeArray[i],lag)
    Start=Sys.time()
    cat("\nSample Size = ",sampleSizeArray[i],"\n")
    nonCoverageFreqArray = computeNonCoverageFreqArray(
      superReplicationCount = superReplicationCount,
      replicationCount = replicationCount,
      sampleSize = sampleSizeArray[i],
      lag = lag,
      lagCount = lagCount,
      tParArray = tParArray,
      nonCoverageProbability = nonCoverageProbability)

    End=Sys.time()
    duration[i]=End-Start
  }
  saveJpg(fileName = fileName,path = path)
  plot(x=sampleSizeArray,y=duration,main = "Benchmark for sampleSize")
  graphics.off()
  myDF <- data.frame(sampleSizeArray,duration)

  saveCVS(fileName,path,dataToSave = myDF)
}
