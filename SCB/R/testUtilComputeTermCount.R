#'@export
testUtilComputeTermCount<- function(maxGraph=1000,step=1)
{


  cat("\n Testing \'tests_21_computeTermCount\' \n")
  sampleSizes <- seq(0,maxGraph,by=step)

  termCounts <-numeric(length = length(sampleSizes))

  for(i in 1:length(sampleSizes))
  {
    termCounts[i] <- computeTermCount(i)
  }

  fileName <- "TermCount&SS"
  fileName <- timestampGenerator(fileName = fileName)

  df <- data.frame(sampleSizes,termCounts)

  saveJpg(fileName = fileName, doPath())

  saveCVS(fileName = fileName, doPath(), df)

  plot(sampleSizes,termCounts,type = "l")

  title("TermCount and sampleSize")
  dev.off()
  cat("\n End of test computeTermCount", "\n")
  cat("=====================")
}
