tParCount <- 10

nonCoverageProbability <- 0.2

sampleSize <- seq(6,50,by=1)
lag <- 1
nMe <- 5


Start=Sys.time()
testUtilSaveMeForSampleSize(sampleSize = sampleSize,
                            tParCount = tParCount,
                            nonCoverageProbability = nonCoverageProbability,
                            lag = lag,
                            nMe = nMe)
#need degree = -0.12 scaleConstant = 0.5
# fix testUtilSaveMeForSampleSize tParArray index = i
