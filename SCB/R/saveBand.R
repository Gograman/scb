saveBand <- function(band, corArray,
                     sampleSize, bandwidth,
                     replicationCount,
                     lag, superReplicationCount)
{
  fileName <- "BandAndCorrelation"

  fileName <- paste(fileName, "ss", sampleSize, "l", lag, "bandW", round(bandwidth,digits = 1 ), sep = "_")
  fileName <- paste(fileName, "repC", replicationCount,"SrepC", superReplicationCount, sep = "_")

  xLab <- "TparArray"

  subTitle <- paste(xLab,"\nsampleSize = ",sampleSize,", lag= ",lag,", bandwidth = ",
                    round(bandwidth,digits = 1 ),
                    ",\n replicationCount= ", replicationCount, ", 'SuperRep = ",
                    superReplicationCount,sep = "")

  path <- doPath()

  saveJpg(fileName = fileName, path = path)
  df <- cbind(band,corArray)
  minBand <- min(df)
  maxBand <- max(df)
  yMin = 0
  yMax = 0
  repeat
  {
    if(yMin <= minBand)
    {
      if(yMax >= maxBand)
      {
         break();
      }
      else
      {
        yMax = yMax + 0.5
      }
    }
    else
    {
     yMin = yMin - 0.5
    }
  }

  #if(abs(yMin) > yMax)
  #{
  #  yMax <- -yMin
  #}
  #else
  #{
  #  yMin <- -yMax
  #}
  xMinMargin <- 0
  xMaxMargin <- 1
  middle = (band[,1] + band[,2])/2

  saveData <- data.frame(band,middle,corArray)

  saveCVS(fileName = fileName, path = path, dataToSave = saveData)

  tParCount=length(corArray)
  mockTParArray=createTParArray(tParCount-1)


  plot(x=c(yMin:yMax),y=c(yMin:yMax), type = "n", xlim=c(xMinMargin:xMaxMargin),
       xlab = "", ylab = "Correlation",yaxs="i")


  title(main = "Band and Correlation",sub = subTitle)


  lines(x=mockTParArray,y = band[,1], type = "l", col="green")
  lines(x=mockTParArray,y = band[,2], type = "l", col="blue")
  lines(x=mockTParArray,y = middle, type = "l", col = "brown")
  lines(x=mockTParArray,y = corArray, type = "l", col="red")
  lineArray <- c("Upper", "Middle", "Lower", "Correlation")
  legend("bottom", title ="Correlation", lineArray, fill =c("blue", "brown", "green", "red"))
  dev.off()
}
