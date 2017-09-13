saveCVS <- function(fileName, path, dataToSave)
{
  if(!dir.exists(path))
  {
    dir.create(path)
  }

  myFileName <- gsub(" ","_",paste(fileName, "_", Sys.time(),".csv",sep = ""))
  myFileName <- gsub(":","_",myFileName)
  write.csv(dataToSave, paste(path,"/",myFileName,sep=""))
}
