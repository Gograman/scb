saveDoubleAplhaHatArray <- function(nonCoverageProbabilities, alphaHats, fileName)
{
  myPath <- "out"
  if(!dir.exists(myPath))
  {
    dir.create(myPath)
  }
  fileName <- gsub("\\.","", fileName)
  myFileName <- gsub(" ","_",paste(fileName,Sys.time(),".jpg", sep = ""))
  myFileName <- gsub(":","_",myFileName)
  jpeg(paste(myPath,"/",myFileName,sep=""))

  arrayOfXAplphaHats <- matrix(0, nrow =length(alphaHats[,1]),
                               ncol = length(alphaHats[1,]))

  for(i in 1:length(nonCoverageProbabilities))
  {
   arrayOfXAplphaHats[,i] <- array(nonCoverageProbabilities[i], dim = length(alphaHats[,1]))
  }

  plot(x=c(0,1),y=c(0,1),type ="n",main="Alphas and AlphaHats")
  abline(a = 0 ,b =1)

  for(i in 1:length(nonCoverageProbabilities))
  {
    points(x=nonCoverageProbabilities[i], y=0,col="blue")
    points(x=arrayOfXAplphaHats[,i],y=alphaHats[,i],col="red")
  }
  dev.off()
  }
