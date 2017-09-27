saveBettaLRVFunction <- function()
{
  tParCount <- 10
  tParArray <- createTParArray(tParCount)
  sampleSize <- 1000
  psi <- myCoefFunction(tParArray)
  bettaLrv <-1 + psi^2 / (1 + psi^2)^2
  sample <- createSample(sampleSize)
  lag <- 2
  lagCount <- computeLagCount(sampleSize = sampleSize, lag = lag)
  allCorHat <- computeAllCorHats(tParArray,lagCount,sample)
  bettaLrvHat<-computeBetaLRVHat(tParArray = tParArray,lag = lag,
                                 sample = sample,allCorHats =  allCorHat)
  fileName <- "bettaLRVAndBettaLRVHat"
  subTitle <- paste("sampleSize = ", sampleSize,
                    ", tParCount= ", tParCount,
                    ", lag =", lag,
                    sep = "")
  df <- data.frame(bettaLrv,bettaLrvHat)
  max <- max(df)
  min <- min(df)
  path <- doPath()
  saveCVS(fileName = fileName,path = path,dataToSave = df)
  saveJpg(fileName = fileName,path = path)
  plot(bettaLrv ~ tParArray, type = "l",col = "red",ylim = c(min,max))
  lines(bettaLrvHat~tParArray,col="blue")
  title("True BettaLRV And BettaLRVHat",sub = subTitle)
  graphics.off
}
test_that("testing saveBettaLRVFunction",
          {
            saveBettaLRVFunction()
            cat(" End of test saveBettaLRVFunction", "\n")
            cat("=========================================")
          })
