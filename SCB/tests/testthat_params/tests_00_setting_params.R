readkey <- function(txtMessage)
{
  cat (txtMessage)
  line <- readline()
}

asc <- function(x) {
  strtoi(charToRaw(x), 16L)
}

readInteger <- function(txtMessage = "Enter an integer: ") {
  n <- readline(prompt = txtMessage)
  if(!grepl("^[0-9]+$",n)) {
    readinteger()
  }
  as.integer(n)
}


settingParams <- function() {
scbParams <- list(
  tParCount = 10,
  sampleSize = 10,
  mean = 0,
  sd = 1,
  u = seq(-10, 10, 0.1),
  lag = 2,
  nonCoverageProbability = 0.05,
  c_k = -1.978325,
  phi_k_norm_diff = 0.4065,
  alphaCount = 10,
  replicationCount = 10,
  superReplicationCount = 10,
  bwidth = 1
)

# cat("Current parameters: ", scbParams)
# scbParams

readKeyValue <- readkey("Shall we change any parameters")

if (readKeyValue == "y") {
  cat("Current value of tParCount: ", scbParams$tParCount)
  scbParams$tParCount <- readInteger(txtMessage = "The new value of tParCount: ")
  cat("tParCount = ", scbParams$tParCount, "\n")

  cat("Current value of sampleSize: ", scbParams$sampleSize)
  scbParams$sampleSize <- readInteger(txtMessage = "The new value of sampleSize: ")
  cat("sampleSize = ", scbParams$sampleSize, "\n")

  cat("Current value of mean: ", scbParams$mean)
  scbParams$mean <- readInteger(txtMessage = "The new value of mean: ")
  cat("mean = ", scbParams$mean, "\n")

  cat("Current value of sd: ", scbParams$sd)
  scbParams$sd <- readInteger(txtMessage = "The new value of sd: ")
  cat("sd = ", scbParams$sd, "\n")

  cat("Current value of lag: ", scbParams$lag)
  scbParams$lag <- readInteger(txtMessage = "The new value of lag: ")
  cat("lag = ", scbParams$lag, "\n")

  cat("Current value of alphaCount: ", scbParams$alphaCount)
  scbParams$alphaCount <- readInteger(txtMessage = "The new value of alphaCount: ")
  cat("alphaCount = ", scbParams$alphaCount, "\n")

  cat("Current value of replicationCount: ", scbParams$replicationCount)
  scbParams$replicationCount <- readInteger(txtMessage = "The new value of replicationCount: ")
  cat("replicationCount = ", scbParams$replicationCount, "\n")

  cat("Current value of superReplicationCount: ", scbParams$superReplicationCount)
  scbParams$superReplicationCount <- readInteger(txtMessage = "The new value of superReplicationCount: ")
  cat("superReplicationCount = ", scbParams$superReplicationCount, "\n")

  cat("Current value of bwidth: ", scbParams$bwidth)
  scbParams$bwidth <- readInteger(txtMessage = "The new value of bwidth: ")
  cat("bwidth = ", scbParams$bwidth, "\n")
}
}

test_that("Setting Parameters", {
  settingParams()
  cat("End of setting parameters\n")
  cat("=====================")
}
)



