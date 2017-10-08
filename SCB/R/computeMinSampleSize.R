computeMinSampleSize <- function(alpha)
{
  minSampleSizeBandwidth <- computeMinSampleSizeForBandwidth()
  minSampleSizeAlpha <- computeMinSampleSizeForAlpha(alpha = alpha)
  return(max(minSampleSizeAlpha,minSampleSizeBandwidth))
}
