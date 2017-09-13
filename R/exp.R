system.time({
  # Do something that takes time
  x <- 1:100000
  for (i in seq_along(x))  x[i] <- x[i]+1
})
