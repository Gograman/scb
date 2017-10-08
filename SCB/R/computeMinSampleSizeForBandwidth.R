computeMinSampleSizeForBandwidth<-function()
{
  degree <- getDegree()
  scaleConstant <- getScaleConstant()
  minSampleSize <- (0.5/scaleConstant)^(1/degree)
  return(ceiling(minSampleSize))
}
