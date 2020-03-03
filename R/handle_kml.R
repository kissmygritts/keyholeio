#' Load .kml files into R
#'
#' Use sf to read .kml files. Handles multi-layer files. This function is
#' used internally and shouldn't normally be called
#'
#' @param kml a file path to a valid .kml file
#'
#' @return an sf object of the kml file from the input kml
#' @export
#'
#' @examples
handle_kml <- function (kml) {
  layers <- sf::st_layers(kml)$name

  if (length(layers) > 1) {
    return(Reduce('rbind', lapply(layers, sf::read_sf, dsn = kml)))
  }

  return(sf::read_sf(dsn = kml))
}
