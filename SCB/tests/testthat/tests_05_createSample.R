createSampleFunction <- function ()
{
  cat("\n Testing \'createSample\' for length and being numeric \n")
  mySampleSize = 100
  Start=Sys.time()
  mockSample <- createSample(sampleSize = mySampleSize)
  End=Sys.time()
  Duration=End-Start

  cat ("mockSample[1:5] =", mockSample[1:5], "\n")
  cat("Duration= ",Duration,"\n")
  expect_that(mockSample, is_a("array"))
}



test_that("Testing \'createSample\' for length and being numeric",
{
  createSampleFunction()
  cat(" End of test createSample","\n")
  cat("=====================")
}
)
