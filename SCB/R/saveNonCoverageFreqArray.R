saveNonCoverageFreqArray <- function(nonCoverageProbability,
                                     alphaHatArray, fileName)
{
  workingDirectory<-getwd()
  splitDirectory <- data.frame(strsplit(workingDirectory,"/"))
  tailDirectory <- tail(splitDirectory,1)

  myPath <- "../../out"

  if(tailDirectory=="SCB")
  {
    myPath <-"out"
  }
  if(!dir.exists(myPath))
  {
    dir.create(myPath)
  }
  fileName <- gsub("\\.","",fileName)
  myFileName <- gsub(" ","_",paste(fileName, Sys.time(), ".jpg",sep = ""))
  myFileName <- gsub(":","_",myFileName)
  jpeg(paste(myPath,"/",myFileName,sep=""))

  arrayOfXAplphaHat <- array(nonCoverageProbability,dim = (length(alphaHatArray)))

  plot(x=c(0,1),y=c(0,1),type ="n",main="Non Coverage Freq Array",
       xlab = "Non Coverage Probability", ylab = "Non coverage Frequency")
  abline(a = 0 , b =1)

  points(x=nonCoverageProbability, y=0,col="blue")
  points(x=arrayOfXAplphaHat,y=jitter(alphaHatArray),col="red")

  legend("topleft",c("Non Coverage Probability","Non Coverage Frequency"),fill = c("blue","red"))

  dev.off()

}
