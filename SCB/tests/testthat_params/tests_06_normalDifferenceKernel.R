normalDifferenceKernelTestFunction = function () {
  cat("\n Testing \'normalDifferenceKernel\' properties \n")
  u = scbParams$u
  myK = normalDifferenceKernel (u)
  plot (myK ~ u)
}

# recollect the requirements to kernel
# like integration to 1
test_that("Testing normalDifferenceKernel properties",
          normalDifferenceKernelTestFunction())




