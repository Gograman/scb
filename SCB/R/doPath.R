doPath <- function()
{
  workingDirectory<-getwd()
  splitDirectory <- data.frame(strsplit(workingDirectory,"/"))
  tailDirectory <- tail(splitDirectory,1)

  myPath <- "../../out"

  if(tailDirectory=="SCB")
  {
    myPath <-"out"
  }

  return(myPath)
}
