noppa = function(sivuja, lkm = 1, takaisinpalautus = TRUE){
  heitot = sample(seq(sivuja), lkm, replace = takaisinpalautus)
  cat("Heitit:", heitot, ". Summa:", sum(heitot))
}
