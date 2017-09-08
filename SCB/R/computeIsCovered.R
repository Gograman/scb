#' @title computeIsCovered
#'
#' @name computeIsCovered
#'
#' @aliases For a given band it checks whether for all t or sleeper values true rho is between upper and lower values. If it is true for all t, it returns 1 or true. If it is not true for at least one t, it returns false or 0.
#'
#' @description
#'
#' @param band band
#' @param corArray corArray
#' @param fileName fileName
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
#' isCovered <- computeIsCovered(band = band, corArray = corArray,fileName=fileName)


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
  saveBand(corArray = corArray,band = band,fileName = fileName )
  upper <- band[, 2]
  lower <- band[, 1]
  for (tParIndex in 1:tParCount)
  {
    if (corArray[tParIndex] <= upper[tParIndex])
    {
      if (corArray[tParIndex] >= lower[tParIndex])
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
  for (tParIndex in 1:tParCount)
  {
    if (isCoveredArrayByT[tParIndex] == 1)
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
