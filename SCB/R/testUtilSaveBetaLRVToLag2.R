testUtilSaveBetaLRVToLag2<-function(sampleSize,
                                    tParCount,
                                    nBetaLrvHat)
{
  lag = 2

  tParArray <- createTParArray(tParCount)

  psi <- customCoefFunction(tParArray)
  betaLrv <- 1 + 2 * psi^2 / (1 + psi^2)^2

  betaLrvHatArray <- matrix(0,nrow = tParCount,ncol = nBetaLrvHat)
  for(index in 1:nBetaLrvHat)
  {
    cat("\nindex BetaLRVHat",index)
    sample <- createSample(sampleSize)
    lagCount <- computeLagCount(sampleSize = sampleSize, lag = lag)
    allCorHat <- computeAllCorHats(tParArray,lagCount,sample)
    betaLrvHatArray[,index]<-computeBetaLRVHat(tParArray = tParArray,lag = lag,
                                  sample = sample,allCorHats =  allCorHat)
  }


  fileName <- "bettaLRVAndBettaLRVHat"
  subTitle <- paste("sampleSize = ", sampleSize,
                    ", tParCount= ", tParCount,
                    ", lag =", lag,
                    sep = "")
  df <- data.frame(betaLrv,betaLrvHatArray)
  max <- max(df)
  min <- min(df)
  path <- doPath()
  saveCVS(fileName = fileName,path = path,dataToSave = df)
  saveJpg(fileName = fileName,path = path)
  plot(betaLrv ~ tParArray, type = "l",col = "red",ylim = c(min,max))
  lineArray <- c("BetaLRV","BetaLRVHat")
  legend("bottomright",
         title = "LRV",
         lineArray,
         fill = c("red","blue"))
  for(index in 1:nBetaLrvHat)
  {
    lines( betaLrvHatArray[,index]~tParArray,col="blue")
  }
  title("True BetaLRV And BetaLRVHat to lag=2",sub = subTitle)
  graphics.off()
}
