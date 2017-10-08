isBandwidthCompatibleWithSampleSize <- function(sampleSize)
{
  minSampleSize <- computeMinSampleSizeForBandwidth()
  isCompatible <- sampleSize >= minSampleSize
  return(isCompatible)
}
