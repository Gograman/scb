isAlphaCompatibleWithSampleSize <- function (sampleSize, alpha)
{
  minSampleSize = ceiling (exp (1/2 * (getC_K() - log(log(1 / sqrt(1 - alpha)))))^(-5))
  isCompatible = sampleSize >= minSampleSize
  return (isCompatible)
}
