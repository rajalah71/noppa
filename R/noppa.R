#' Noppaheitto
#'
#' Simuloi nopanheiton.
#'
#' @param sivuja Nopan sivujen lukumäärä (oletuksena 6).
#' @param lkm Heittojen lukumäärä (oletuksena 1).
#' @param takaisinpalautus Onko nopanheitot takaisinpalautuvia (oletuksena TRUE).
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
  if(length(heitot) > 1) cat("\nSumma:", sum(heitot),"\n")
}
