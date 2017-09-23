errorIfNotInputCompatible = function (sampleSize, lag)
{

  isCompatible = isInputCompatible (sampleSize, lag)
  if (! isCompatible)
  {

    stop ("\n Stop execution. SampleSize is not compatible with lag: \n sampleSize = ",
          sampleSize, "\n lag = ", lag)
  }
}
