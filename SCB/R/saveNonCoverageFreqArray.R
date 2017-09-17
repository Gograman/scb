saveNonCoverageFreqArray <- function(nonCoverageProbability,
                                     alphaHatArray,
                                     sampleSize, bandwidth,
                                     replicationCount,
                                     lag, superReplicationCount)
{

  fileName <- paste("ss", sampleSize, "l", lag, "bandW", bandwidth, sep = "_")
  fileName <- paste(fileName, "repC", replicationCount,"SrepC", superReplicationCount, sep = "_")

  subTitle <- paste("sample Size = ",sampleSize,", lag= ",lag,", bandwidth = ",
                    round(bandwidth,digits = 1 ),
                    ",\n replicationCount= ", replicationCount, ", 'SuperRep = ",
                    superReplicationCount,sep = "")

  path <- doPath()

  saveJpg(fileName = fileName, path = path)

  arrayOfXAplphaHat <- array(nonCoverageProbability,dim = (length(alphaHatArray)))

  plot(x=c(0,1),y=c(0,1),type ="n",
       xlab = "", ylab = "Non coverage Frequency")

  title(main="Non Coverage Freq Array",sub =subTitle)

  abline(a = 0 , b =1)

  points(x=nonCoverageProbability, y=0,col="blue")
  points(x=arrayOfXAplphaHat,y=jitter(alphaHatArray),col="red")

  legend("topleft",c("Non Coverage Probability","Non Coverage Frequency"),fill = c("blue","red"))

  dev.off()

}
