saveNonCoverageFreqArray <- function(nonCoverageProbability,
                                     alphaHatArray, fileName)
{
  path <- doPath()

  saveJpg(fileName = fileName, path = path)

  arrayOfXAplphaHat <- array(nonCoverageProbability,dim = (length(alphaHatArray)))

  plot(x=c(0,1),y=c(0,1),type ="n",main="Non Coverage Freq Array",
       xlab = "Non Coverage Probability", ylab = "Non coverage Frequency")
  abline(a = 0 , b =1)

  points(x=nonCoverageProbability, y=0,col="blue")
  points(x=arrayOfXAplphaHat,y=jitter(alphaHatArray),col="red")

  legend("topleft",c("Non Coverage Probability","Non Coverage Frequency"),fill = c("blue","red"))

  dev.off()

}
