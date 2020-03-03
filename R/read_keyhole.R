#' Read simple features from kml or kmz files
#'
#' @param file a file path to a valid .kml or .kmz file
#'
#' @return an sf object when the layer is successfully read.
#' @export
#'
#' @examples
read_keyhole <- function (file) {
  # parse filename
  filename <- strsplit(basename(file), split = '\\.')

  # initiate conditions
  is_kml <- filename[[1]][-1] == 'kml'
  is_kmz <- filename[[1]][-1] == 'kmz'

  # check that input is kml or kmz, throw error otherwise
  if(!(any(is_kml, is_kmz))) stop('file must be a kml or kmz file')

  if (is_kml) {
    return(handle_kml(file))
  }

  if (is_kmz) {
    return(handle_kmz(file))
  }
}
