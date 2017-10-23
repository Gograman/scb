#'@export
testUtilSaveBetaLRVToLag2<-function(sampleSize,
                                    tParCount,
                                    nBetaLrvHat)
{
  path <- doPath()

  fileName <- "bettaLRVAndBettaLRVHat"
  fileName <- timestampGenerator(fileName = fileName)

  subTitle <- paste("sampleSize = ", sampleSize,
                    ", tParCount= ", tParCount,
                    ", lag =", lag,
                    sep = "")

  lag = 2

  tParArray <- createTParArray(tParCount)

  psi <- customCoefFunction(tParArray)
  betaLrv <- 1 + 2 * psi^2 / (1 + psi^2)^2

  betaLrvHatArray <- matrix(NA,nrow = tParCount,ncol = nBetaLrvHat)
  for(index in 1:nBetaLrvHat)
  {
    cat("\nindex BetaLRVHat",index)
    sample <- createSample(sampleSize)
    lagCount <- computeLagCount(sampleSize = sampleSize, lag = lag)
    allCorHat <- computeAllCorHats(tParArray,lagCount,sample)
    betaLrvHatArray[,index]<-computeBetaLRVHat(tParArray = tParArray,lag = lag,
                                  sample = sample,allCorHats =  allCorHat)

    df <- data.frame(betaLrv,betaLrvHatArray)
    max <- max(df, na.rm = T)
    min <- min(df, na.rm = T)

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




}
