#' Noppaheitto
#'
#' Simuloi nopanheiton.
#'
#' @param sivuja Nopan sivujen lukumäärä (oletuksena 6).
#' @param lkm Heittojen lukumäärä (oletuksena 1).
#' @param takaisinpalautus Onko nopanheitot takaisinpalautuvia, eli toisistaan riippumattomia (oletuksena TRUE).
#'
#' @return Tulostaa nopanheitot ja niiden summan.
#'
#' @examples
#' # Heitä noppaa 5 kertaa
#' noppa(6, 5)
#'
#' @export
noppa = function(sivuja = 6, lkm = 1, takaisinpalautus = TRUE){
  heitot = sample(seq(sivuja), lkm, replace = takaisinpalautus)
  cat("Heitit:", heitot)
  if(lkm > 1) cat("\nSumma:", sum(heitot),"\n")

  if(lkm > 1){
    # Calculate the pdf of the sum
    pdf = rep(1/sivuja, sivuja)
    for(i in 2:lkm){
      pdf = convolve(pdf, rep(1/sivuja, sivuja), type = "open")
    }
    # plot the pmf
    plot(seq(lkm, lkm*sivuja), pdf, type = "b", main = "Nopanheiton summan jakauma", xlab = "Summa", ylab = "Todennäköisyys")
    # plot the obtained result as well as a vertical line at the obtained result
    points(sum(heitot), pdf[sum(heitot)-(lkm-1)], col = "red", pch = 19)
    # add a legend and the probability of P(sum <= ) the obtained result in a box
    legend("topleft", legend = paste0("P(summa ", lkm, "d", sivuja,  " <= ", sum(heitot), ") = ", round(sum(pdf[1:(sum(heitot)-(lkm-1))]), 3)), bty = "n")
  }
}
