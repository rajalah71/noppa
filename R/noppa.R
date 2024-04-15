#' @title Noppaheitto
#'
#' @description
#' Heittää k kertaa n sivuista noppaa, Heitot, niiden summa ja todennäköisyys tulostetaan.
#'
#'
#' @param lkm Heittojen lukumäärä (oletuksena 1).
#' @param sivuja Nopan sivujen lukumäärä (oletuksena 20).
#' @param plot Tehdäänkö kuvaaja vai ei (oletuksena FALSE).
#' @param takaisinpalautus Onko nopanheitot takaisinpalautuvia (oletuksena TRUE).
#'
#' @return Tulostaa nopanheitot ja niiden summan, sekä summan pistetodennäköisyysfunktion.
#'
#' @importFrom stats convolve
#' @importFrom graphics points legend
#'
#' @examples
#' # Heitä 2 kertaa perinteistä 6 sivuista noppaa.
#' noppa(2,6)
#'
#' @export
noppa = function(lkm = 1, sivuja = 20, plot = FALSE,  takaisinpalautus = TRUE){
  heitot = sample(seq(sivuja), lkm, replace = takaisinpalautus)
  # cat the results separated by commas
  cat("Heitit:", paste(heitot, collapse = ", "), "\n")
  if(lkm > 1) cat("Summa:", sum(heitot),"\n")

  if(lkm > 1){
    # Calculate the pmf of the sum
    pmf = rep(1/sivuja, sivuja)
    for(i in 2:lkm){
      pmf = convolve(pmf, rep(1/sivuja, sivuja), type = "open")
    }
    cat(paste0("P(", lkm, "d", sivuja,  " <= ", sum(heitot), ") = ", round(sum(pmf[1:(sum(heitot)-(lkm-1))]), 3)), "\n")

    if(plot == TRUE){
    # plot the pmf
    plot(seq(lkm, lkm*sivuja), pmf, type = "b", main = "Nopanheiton summan jakauma", xlab = "Summa", ylab = "Todennäköisyys")
    # plot the obtained result
    points(sum(heitot), pmf[sum(heitot)-(lkm-1)], col = "red", pch = 19)
    # add a legend and the probability of P(sum <= ) the obtained result in a box
    legend("topleft", legend = paste0("P(", lkm, "d", sivuja,  " <= ", sum(heitot), ") = ", round(sum(pmf[1:(sum(heitot)-(lkm-1))]), 3)), bty = "n")
    }
  } else {
    cat(paste0("P(", lkm, "d", sivuja,  " <= ", heitot, ") = ", round(heitot/sivuja, 3)), "\n")

    if(plot == TRUE){
      # plot the pmf
      plot(seq(1, sivuja), rep(1/sivuja, sivuja), type = "b", main = "Nopanheiton jakauma", xlab = "Tulos", ylab = "Todennäköisyys")
      # plot the obtained result
      points(heitot, 1/sivuja, col = "red", pch = 19)
      # add a legend and the probability of P(sum <= ) the obtained result in a box
      legend("topleft", legend = paste0("P(", lkm, "d", sivuja,  "  <= ", heitot, ") = ", round(heitot/sivuja, 3)), bty = "n")
    }
  }


}
