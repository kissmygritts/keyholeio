#' Read .kmz file into R
#'
#' Use sf to read .kmz files. Handles multi-layer files. This function is
#' used internally and shouldn't normally be called
#'
#' @param kmz a file path to a valid .kmz file
#'
#' @return an sf object of the input .kmz file
#' @export
#'
#' @examples
handle_kmz <- function (kmz) {
  # copy, zip, unzip kmz hack
  fs::file_copy(kmz, '.temp.kml.zip', overwrite = T)
  utils::unzip('.temp.kml.zip', overwrite = T)

  # generate output
  sf_out <- handle_kml('doc.kml')

  # cleanup temp files
  cleanup_after(c('.temp.kml.zip', 'doc.kml'))

  return(sf_out)
}
