#' URL for a specific package
#'
#' Get an URL for a specific package (Markdown style).
#'
#' @param pkg a package name.
#' @param user a character string of the GitHub repository.
#'
#' @return
#' A link to the CRAN's canonical URL for a given formatted in Markdown.
#'
#' @export
#' @examples
#' url_pkg_cran("ps")
#' url_pkg_gh("inSilecoRef", "inSileco")

url_pkg_cran <- function(pkg) {
  glue("[{pkg}](https://CRAN.R-project.org/package={pkg})")
}

#' @describeIn url_pkg_cran A link to the GitHub repository for a given package.
#' @export

url_pkg_gh <- function(pkg, user = "cran") {
  glue("[{pkg}](https://github.com/{user}/{pkg})")
}