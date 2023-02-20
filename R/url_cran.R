#' URL for R packages
#'
#' Get an URL for a specific package (Markdown style).
#'
#' @param pkg a package name.
#' @param user a GitHub user name or a GitHub organisation name.
#'
#' @return
#' A link to the CRAN's canonical URL for a given package formatted in Markdown.
#' Note that is `pkg = ""` a link to the CRAN is returned.
#'
#' @export
#' @examples
#' url_cran("")
#' url_cran("ps")
#' url_gh("inSilecoRef", "inSileco")
#' url_bioc("CRImage")
url_cran <- function(pkg = "") {
  if (pkg == "") {
    "[CRAN](https://CRAN.R-project.org)"
  } else {
    stopifnot(is_package_name_valid(pkg))
    glue("[`{pkg}`](https://CRAN.R-project.org/package={pkg})")
  }
}

#' @describeIn url_cran A link to the Bioconductor's short URL for a given
#' package formatted in Markdown. Note that is `pkg = ""` a link to Bioconductor
#' is returned.
#' @export

url_bioc <- function(pkg = "") {
  if (pkg == "") {
    "[Bioconductor](https://www.bioconductor.org/)"
  } else {
    stopifnot(is_package_name_valid(pkg))
    glue("[`{pkg}`](https://bioconductor.org/packages/{pkg}/)")
  }
}

#' @describeIn url_cran A link to the GitHub repository for a given package.
#' If `pkg = ""` a link to the user account in returned and if `pkg = ""` and
# `user = ""` then a link to GitHub is returned.
#' @export

url_gh <- function(pkg = "", user = "cran") {
  if (pkg == "") {
    if (user == "") {
      "[GitHub](https://github.com)"
    } else {
      glue("[{user}](https://github.com/{user})")
    }
  } else {
    glue("[`{pkg}`](https://github.com/{user}/{pkg})")
  }
}


is_package_name_valid <- function(x) {
  grepl("^[[:alnum:]][[:alnum:]\\.]*[[:alnum:]]$", x)
}
