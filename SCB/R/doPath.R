#'
#'@export

doPath <- function(directory = "")
{
  #workingDirectory<-getwd()
  #splitDirectory <- data.frame(strsplit(workingDirectory,"/"))
  #tailDirectory <- tail(splitDirectory,1)

  #myPath <- "../../../output"

  #if(tailDirectory=="SCB")
  #{
  #  myPath <-"../output"
  #}
  myPath <- "output"
  if(directory != "")
  {
    myPath<-paste(myPath,directory,sep = "/")
  }

  return(myPath)
}
