createTParArrayFunction <- function () {
  cat ("\n Testing \'createTParArray\' for for length and being numeric \n")
  tParCount = 10
  start=Sys.time()
  mockTParArray <- createTParArray(tParCount = tParCount)
  end=Sys.time()
  duration=end-start

  cat ("mockTParArray[1:5] =", mockTParArray[1:5], "\n",
       "length(mockTParArray) =", length(mockTParArray), "\n")
  cat("Duration= ",duration,"\n")
  # The actual testing
  expect_that(mockTParArray, is_a("numeric"))
}



test_that("Testing \'createTParArray\' for being an array", {
  mockTParArray <- createTParArrayFunction()

cat(" End of test createTParArray","\n")
cat("=====================")
  }
)
