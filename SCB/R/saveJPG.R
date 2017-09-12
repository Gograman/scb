saveJpg <- function(fileName, path)
{
  if(!dir.exists(path))
  {
    dir.create(path)
  }

  fileName <- gsub("\\.","", fileName)
  myFileName <- gsub(" ","_",paste(fileName, "_", Sys.time(),".jpg", sep = ""))
  myFileName <- gsub(":","_",myFileName)
  jpeg(paste(path,"/",myFileName,sep=""))
}
