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
  # temporary files
  target_file <- normalizePath(paste0(tempdir(), '/', 'temp.zip'))
  temp_kml_file <- normalizePath(paste0(tempdir(), '/', 'doc.kml'))

  # copy, zip, unzip kmz hack write to tempdir()
  # temp dir is cleaned automatically after the R session ends
  fs::file_copy(kmz, target_file, overwrite = T)
  utils::unzip(target_file, files = 'doc.kml', exdir = tempdir(), overwrite = T)

  # generate output
  sf_out <- handle_kml(temp_kml_file)

  return(sf_out)
}
