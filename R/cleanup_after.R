#' Cleanup after unzipping kmz
#'
#' This function is used internally and shouldn't normally be called on it's own.
#'
#' @param files a character vector of files to delete
#'
#' @return nothing
#' @export
#'
#' @examples
cleanup_after <- function (files) {
  for (x in files) fs::file_delete(x)
}
