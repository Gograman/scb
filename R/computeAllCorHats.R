#' @title computeAllCorHats
#'
#' @name computeAllCorHats
#'
#' @aliases computeAllRhoHats
#'
#' @description Computing correlations hat, that is, all \eqn{\rho} hats.
#'
#' @param tParArray a T parameter array, a.k.a. a sleeper parameter, a sequence of numbers {0, 1}.
#' @param sample sample.
#' @param kernel kernel.
#' @param bandwidth bandwidth.
#'
#' @return
#'
#' @examples
#' tParCount = 10
#' tParArray <- createTParArray(tParCount = tParCount)
#' tvMA1CoefArray <- createTVMA1CoefArray(coefFunction = sin, tParArray = tParArray)
#' noise <- createNoise(sampleSize = tParCount, mean = 0, sd = 1)
#' mockTVMA1Array <- createTVMA1CoefArray(coefFunction = sin, tParArray = tParArray)
#' sample <- createSample(model = createTVMA1, tvMA1CoefArray = tvMA1Array, noise = noise)
#' lagCount = tParCount - 1
#' kernel = normalDifferenceKernel
#' allCorHats = computeAllCorHats(tParArray = tParArray, lagCount = lagCount, sample = sample, kernel = kernel,  bandwidth = 1)

computeAllCorHats <- function(tParArray,
                              sample,
                              kernel,
                              bandwidth)

{
  # Double array of sizes sleeperCount and lagCount
  # Inner counter -  tPar
  # Outer counter - lag
  sampleSize = length(sample)
  #cat("\nSampleSize",sampleSize)
  termCount = floor(2 * sampleSize ^ (4/15)) # aka L
  #cat("\ntermCount",termCount)
  # check sizes
  if ( lag > (sampleSize - 1 - termCount) ) {
    cat ("after if with stop \n")
    cat ("sampleSize = ",sampleSize, "\n")
    cat ("termCount = ",termCount, "\n")
    cat ("lag = ",lag, "\n")
    cat("wrong relation between sampleSize, termCount, lag! \n")
    # stop("wrong relation between sampleSize, termCount, lag!")
  }

  lagCount <- termCount + lag + 1

  tParCount <- length(tParArray)
  allCorHats <- array(0, dim = c(tParCount, lagCount + 1))
  # colNamesForAllCorHats <- as.character(c(0, seq_len(lagCount)))
  # colnames(allCorHats) <- colNamesForAllCorHats
  # allCorHats <- as.data.frame(allCorHats)
  # allCorHats$`0` <- 1 # replicating 1
  # each tPar element is being called by its index,
  # each lag element is being called as it is
  # (index of each lag is the lag itself)
  for (lagIndex in 0:lagCount) {
    for (tParIndex in seq_len(tParCount)) {
      tParPoint = tParArray[tParIndex]

      # lagIndexToRefer <- eval(parse(text = paste0("allCorHats$`", lagIndex + 1, "`")))
      allCorHats[tParIndex, lagIndex + 1] <- computeCorHat(tParArray = tParPoint,
                                                           lag = lagIndex,
                                                           sample = sample,
                                                           kernel = kernel,
                                                           bandwidth = bandwidth)
    }
  }

  allCorHats
  # computeAllCorHats returns one-dimensional array, whereas it should return two-dimensional
}
