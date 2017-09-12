saveNonCoverageFreqArray <- function(nonCoverageProbability,
                                     alphaHatArray, fileName)
{
  myPath <- "out"
  if(!dir.exists(myPath))
  {
    dir.create(myPath)
  }
  fileName <- gsub("\\.","",fileName)
  myFileName <- gsub(" ","_",paste(fileName, Sys.time(), ".jpg",sep = ""))
  myFileName <- gsub(":","_",myFileName)
  jpeg(paste(myPath,"/",myFileName,sep=""))

  arrayOfXAplphaHat <- array(nonCoverageProbability,dim = (length(alphaHatArray)))

  plot(x=c(0,1),y=c(0,1),type ="n",main="Non Coverage Freq Array")
  abline(a = 0 , b =1)

  points(x=nonCoverageProbability, y=0,col="blue")
  points(x=arrayOfXAplphaHat,y=alphaHatArray,col="red")

  legend("topleft",c("Non Coverage Probability","Non Coverage Frequency"),fill = c("blue","red"))

  dev.off()

}
