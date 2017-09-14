saveBand <- function(band, corArray,
                     sampleSize, bandwidth,
                     replicationCount,
                     lag, superReplicationCount)
{
  fileName <- paste("ss", sampleSize, "l", lag, "bandW", bandwidth, sep = "_")
  fileName <- paste(fileName, "repC", replicationCount,"SrepC", superReplicationCount, sep = "_")

  subTitle <- paste("sample Size = ",sampleSize,", lag= ",lag,", bandwidth = ", bandwidth,
                    ", replicationCount= ", replicationCount, ", SuperRep = ",
                    superReplicationCount,sep = "")

  path <- doPath()

  saveJpg(fileName = fileName, path = path)

  minBand <- min(band)
  maxBand <- max(band)
  yMin = -1
  yMax = 1
  while(T)
  {
    if(yMin < minBand)
    {
      if(yMax > maxBand)
      {
         break();
      }
      else
      {
        yMax = yMax + 0.01
      }
    }
    else
    {
     yMin = yMin - 0.01
    }
  }
  middle = (band[,1] + band[,2])/2

  saveData <- data.frame(band,middle,corArray)

  saveCVS(fileName = fileName, path = path, dataToSave = saveData)

  tParCount=length(corArray)
  mockTParArray=createTParArray(tParCount)
  plot(x=c(yMax:yMin),y=c(yMax:yMin),type = "n", xlim=c(0:1),
       xlab = "TPar Array", ylab = "Correlation")

  title(main="Non Coverage Freq Array",sub =subTitle)

  lines(x=mockTParArray,y = band[,1], type = "l", col="green")
  lines(x=mockTParArray,y = band[,2], type = "l", col="blue")
  lines(x=mockTParArray,y = middle, type = "l", col = "brown")
  lines(x=mockTParArray,y = corArray, type = "l", col="red")
  lineArray <- c("Upper", "Middle", "Lower", "Correlation")
  legend("bottom", title ="Correlation", lineArray, fill =c("blue", "brown", "green", "red"))
  dev.off()
}
