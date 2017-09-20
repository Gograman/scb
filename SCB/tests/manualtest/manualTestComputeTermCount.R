doPath()
sampleSizes <- 1:1000

termCounts <-numeric(length = length(sampleSizes))

for(i in sampleSizes)
{
  termCounts[i] <- computeTermCount(i)
}
d <- density(termCounts)

plot(sampleSizes,termCounts,type = "l")
