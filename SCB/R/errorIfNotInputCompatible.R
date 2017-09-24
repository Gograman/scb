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
      alphaErrorMessage <- "\nsampleSize is not compatible with alpha: \n"
      alphaErrorMessage<- paste(alphaErrorMessage, "alpha = " ,alpha,sep = " ")
    }
    lagErrorMessage <- ""
    if(!isLagCompatible)
    {
      lagErrorMessage <- "\nSampleSize is not compatible with lag: \n"
      lagErrorMessage <- paste(lagErrorMessage, "lag =",lag,sep = " ")
    }
    stop ("\n Stop execution", lagErrorMessage,"\n",alphaErrorMessage,"\n",
          "sampleSize = ",sampleSize)
  }

}
