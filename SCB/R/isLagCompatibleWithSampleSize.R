isLagCompatibleWithSampleSize <- function (sampleSize, lag)
{

  isCompatible = sampleSize - computeTermCount (sampleSize)  >= lag + 1
  return (isCompatible)
}
