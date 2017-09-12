saveBand <- function(band, corArray, fileName)
{
  workingDirectory<-getwd()
  splitDirectory <- data.frame(strsplit(workingDirectory,"/"))
  tailDirectory <- tail(splitDirectory,1)

  myPath <- "../../out"

  if(tailDirectory=="SCB")
  {
    myPath <-"out"
  }
  if(!dir.exists(myPath))
  {
    dir.create(myPath)
  }
  fileName <- gsub("\\.","", fileName)
  myFileName <- gsub(" ","_",paste(fileName ,Sys.time(),".jpg",sep = ""))
  myFileName <- gsub(":","_", myFileName)

  jpeg(paste(myPath,"/",myFileName,sep=""))


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
  myFileName <- gsub(" ","_",paste(fileName, Sys.time(),".csv",sep = ""))
  myFileName <- gsub(":","_",myFileName)
  write.csv(saveData, paste(myPath,"/",myFileName,sep=""))
  tParCount=length(corArray)
  mockTParArray=createTParArray(tParCount)
  plot(x=c(yMax:yMin),y=c(yMax:yMin),type = "n", xlim=c(0:1),main= "Band and Correlation",
       xlab = "TPar Array", ylab = "Correlation")
  lines(x=mockTParArray,y = band[,1], type = "l", col="green")
  lines(x=mockTParArray,y = band[,2], type = "l", col="blue")
  lines(x=mockTParArray,y = middle, type = "l", col = "brown")
  lines(x=mockTParArray,y = corArray, type = "l", col="red")
  lineArray <- c("Upper", "Middle", "Lower", "Correlation")
  legend("bottom", title ="Correlation", lineArray, fill =c("blue", "brown", "green", "red"))
  dev.off()
}
