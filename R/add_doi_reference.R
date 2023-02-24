#' Add DOI-based references to a bib file
#'
#' Check if DOIs are present in a bib file passed as an argument, if one or more
#' DOI are missing the associated references are imported and added to the
#' bib file.
#'
#' @param doi character vector of DOI to import.
#' @param bib character path to master .bib file, default is `inSilecoRef.bib`,
#' if the file does not exist it will be created.
#' @keywords DOI
#'
#' @export
#'
#' @examples
#' # Example 1:
#' \dontrun{
#' add_doi_reference(doi = c(
#'   "10.1016/j.tree.2016.10.011", "10.1890/130230",
#'   "10.1515/9781400881376"
#' ))
#' }
add_doi_reference <- function(doi, bib = "./inSilecoRef.bib") {
  # 1. Import .bib file
  if (!file.exists(bib)) {
    stopifnot(path_ext(bib) == "bib")
    cli_alert_info("Creating {bib}")
    file.create(bib)
    ref <- utils::bibentry()
  } else {
    cli_alert_info("Reading bib file {bib}")
    ref <- read.bib(bib)
  }

  # 2. Check wheteher dois are already in the bib file
  if (length(ref)) {
    doi <- doi[!doi %in% unlist(ref$doi)]
  }

  # 4. if !DOI %in% inSilecoRef.bib
  if (length(doi)) {
    cli_alert_info("Importing {length(doi)} DOI{?s}")
    new_ref <- rcrossref::cr_cn(dois = doi, format = "bibtex")
    tf <- tempfile()
    on.exit(unlink(tf))
    new_ref <- rcrossref::cr_cn(dois = doi, format = "bibtex") |>
      unlist() |>
      write(tf)
    new_ref <- read.bib(tf)
    id <- names(new_ref) %in% names(ref)
    if (length(id)) {
      names(new_ref)[id] <- rename_key(names(new_ref)[id])
    }
    cli_alert_info("Writing bib file {bib}")
    updated_ref <- c(ref, new_ref)
    write.bib(c(ref, new_ref), bib)
  } else {
    cli_alert_info("No reference to be added")
    updated_ref <- ref
  }

  invisible(return(updated_ref))
}


is_reference_empty <- function(x) {
  return(x == "" | is.null(x))
}

get_keys <- function(x) {
  out <- lapply(x, \(x) x$key)
  return(unlist(out))
}

get_dois <- function(x) {
  out <- lapply(x, \(x) x$doi)
  return(unlist(out))
}

rename_key <- function(x) {
  ukey <- unique(x)
  for (i in ukey) {
    x[x == i] <- paste0(x[x == i], ":", seq(x[x == i]))
  }
  return(x)
}