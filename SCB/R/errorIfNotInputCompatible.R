errorIfNotInputCompatible <- function (alpha, lag, sampleSize)
{
  isAlphaCompatible = isAlphaCompatibleWithSampleSize (
    alpha = alpha, sampleSize = sampleSize)
  isLagCompatible = isLagCompatibleWithSampleSize (
    lag = lag, sampleSize = sampleSize)
  isCompatible = isAlphaCompatible & isLagCompatible


  if (! isCompatible)
  {
    alphaErrorMessage = ""
    if(!isAlphaCompatible)
    {
      minRequireSamplasize <- paste("\nMin sampleSize you can use with that alpha is=",
                                    computeMinSampleSizeForAlpha(alpha), sep = " ")
      alphaErrorMessage <- "\nsampleSize is not compatible with alpha: \n"
      alphaErrorMessage<- paste(alphaErrorMessage, "alpha = " ,alpha,
                                minRequireSamplasize,sep = "")
    }
    lagErrorMessage <- ""
    if(!isLagCompatible)
    {
      maxRequiredLag <-paste("\nMax lag you can use with this sampleSize is = ",
                             computeMaxLagForSampleSize(sampleSize = sampleSize),
                             sep = " ")
      lagErrorMessage <- "\nSampleSize is not compatible with lag:\n"
      lagErrorMessage <- paste(lagErrorMessage, "lag = ",lag,maxRequiredLag,sep = "")
    }
    stop ("\n Stop execution", lagErrorMessage,"\n",alphaErrorMessage,"\n",
          "sampleSize = ",sampleSize)
  }

}
