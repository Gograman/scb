#' @title computeIsCovered
#'
#' @name computeIsCovered
#'
#' @aliases
#'
#' @description
#'
#' @param band band
#' @param corArray corArray
#'
#' @return Vector of {0, 1 values}.
#'
#' @examples
#' tParCount = 10
#' tParArray <- createTParArray(tParCount = tParCount)
#' noise <- createNoise(sampleSize = tParCount, mean = 0, sd = 1)
#' tvMA1CoefArray <- createTVMA1CoefArray(coefFunction = sin, tParArray = tParArray)
#' mockTVMA1 <- createTVMA1(sampleSize = tParCount,tvMA1CoefArray = mockTVMA1CoeffArray,noise = mockNoise)
#' corArray <- computeCor(lag = lag, tvMa1CoefArray = tvMA1CoefArray)
#' lag  <- 2
#' band <- createBand(X = rnorm(n = 10, mean = 0, sd = 1), alpha = 0.05)
#' isCovered <- computeIsCovered(band = band, corArray = corArray)


computeIsCovered <- function(band,
                             corArray,
                             fileName)
{
  # Array rho_h(i),
  # counter i corresponds to t_i = 0, 1/n, …., 1 - 1/n,
  # horizontal ACF of a sleepers process
  # saveBand(band = band, corArray = corArray, fileName)
  tParCount <- length (corArray)
  isCoveredArrayByT <- array (0, dim = tParCount)
  ZeroCount=0
  #saveBand(corArray = corArray,band = band,fileName = fileName )
  upper <- band[, 2]
  lower <- band[, 1]
  for (tParIndex in 1 : tParCount)
  {


    if(corArray[tParIndex] <= upper[tParIndex])
    {
      if(corArray[tParIndex] >= lower[tParIndex])
      {
        isCoveredArrayByT[tParIndex] <- 1
      }
      else
      {
        isCoveredArrayByT[tParIndex] <- 0
      }
    }
    # else
    # {
    #   isCoveredArrayByT[tParIndex] <- 0
    # }
  }
  for(tParIndex in 1:tParCount)
  {
   if(isCoveredArrayByT[tParIndex]==1)
   {
    return(1)
     break()


   }
    else
    {
      return(0)
      break()
    }
  }





}

