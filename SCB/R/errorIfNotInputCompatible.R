errorIfNotInputCompatible = function (alpha, lag, sampleSize)
{
  isAlphaCompatible = isAlphaCompatibleWithSampleSize (
    alpha = alpha, sampleSize = sampleSize)
  isLagCompatible = isLagCompatibleWithSampleSize (
    lag = lag, sampleSize = sampleSize)
  isCompatible = isAlphaCompatible || isLagCompatible


  if (! isCompatible)
  {
    alphaErrorMessage = ""
    if(!isAlphaCompatible)
    {

    }
    stop ("\n Stop execution. SampleSize is not compatible with lag: \n sampleSize = ",
          sampleSize, "\n lag = ", lag)
  }
  else
  {
    cat("\n Sample size and lag is compatible")

  }
}
