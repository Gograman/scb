
sampleSizes <- 1:1000

termCounts <-numeric(length = length(sampleSizes))

for(i in sampleSizes)
{
  termCounts[i] <- computeTermCount(i)
}

fileName <- "TermCount_SampleSize"

df <- data.frame(sampleSizes,termCounts)

saveJpg(fileName = fileName, doPath())

saveCVS(fileName = fileName, doPath(), df)

plot(sampleSizes,termCounts,type = "l")

title("TermCount and sampleSize")
dev.off()
