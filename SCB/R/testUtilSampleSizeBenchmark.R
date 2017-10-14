#'@export
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

userSelfArray<-numeric(length = length(sampleSizeArray))

sysSelfArray<-numeric(length = length(sampleSizeArray))

elapsedArray<-numeric(length = length(sampleSizeArray))

for(i in 1: length(sampleSizeArray))
{
  lagCount <- computeLagCount(sampleSizeArray[i],lag)

  cat("\nSample Size = ",sampleSizeArray[i],"\n")
  time<-system.time(computeNonCoverageFreqArray(
    superReplicationCount = superReplicationCount,
    replicationCount = replicationCount,
    sampleSize = sampleSizeArray[i],
    lag = lag,
    tParArray = tParArray,
    nonCoverageProbability = nonCoverageProbability,
    fileName = "BenchMarkTestSampleSize")
  )
  unclassedTime<-unclass(time)
  userSelfArray[i] <- unclassedTime[1]
  sysSelfArray[i] <- unclassedTime[2]
  elapsedArray[i] <- unclassedTime[3]

}
maxElapsed <- max(elapsedArray)
saveJpg(fileName = fileName,path = path)
plot(x=sampleSizeArray,y=elapsedArray,main = "Benchmark for sampleSize",ylim = c(0,maxElapsed),
     type = "l")
lines(x=sampleSizeArray,y=sysSelfArray,col="red")
lines(x=sampleSizeArray,y=userSelfArray,col="blue")
legend(x="topleft",legend = c("Elapsed time","user time","sys time"),
       fill = c("black","blue","red"))
graphics.off()
myDF <- data.frame(sampleSizeArray,duration)

saveCVS(fileName,path,dataToSave = myDF)
}
