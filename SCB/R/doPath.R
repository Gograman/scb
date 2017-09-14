doPath <- function()
{
  workingDirectory<-getwd()
  splitDirectory <- data.frame(strsplit(workingDirectory,"/"))
  tailDirectory <- tail(splitDirectory,1)

  myPath <- "../../../output"

  if(tailDirectory=="SCB")
  {
    myPath <-"../output"
  }

  return(myPath)
}
