saveDoubleAplhaHatArray <- function(nonCoverageProbabilities, alphaHats, fileName)
{
  path <- doPath()

  saveJpg(fileName = fileName, path = path)

  arrayOfXAplphaHats <- matrix(0, nrow =length(alphaHats[,1]),
                               ncol = length(alphaHats[1,]))

  for(i in 1:length(nonCoverageProbabilities))
  {
   arrayOfXAplphaHats[,i] <- array(nonCoverageProbabilities[i], dim = length(alphaHats[,1]))
  }

  plot(x=c(0,1),y=c(0,1),type ="n",main="Alphas and AlphaHats",
       xlab = "Non Coverage Probability", ylab = "Non coverage Frequency")
  abline(a = 0 ,b =1)

  saveData <- rbind(nonCoverageProbabilities,alphaHats)

  saveCVS(fileName = fileName, path = path, dataToSave = saveData)

  for(i in 1:length(nonCoverageProbabilities))
  {
    points(x=nonCoverageProbabilities[i], y=0,col="blue")
    points(x=arrayOfXAplphaHats[,i],y=jitter(alphaHats[,i]),col="red")
  }
  dev.off()
  }
