% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/add_doi_reference.R
\name{add_doi_reference}
\alias{add_doi_reference}
\title{Add DOI-based references to a bib file}
\usage{
add_doi_reference(doi, bib = "./inSilecoRef.bib")
}
\arguments{
\item{doi}{character vector of DOI to import.}

\item{bib}{character path to master .bib file, default is \code{inSilecoRef.bib},
if the file does not exist it will be created.}
}
\description{
Check if DOIs are present in a bib file passed as an argument, if one or more
DOI are missing the associated references are imported and added to the
bib file.
}
\examples{
# Example 1:
\dontrun{
add_doi_reference(doi = c(
  "10.1016/j.tree.2016.10.011", "10.1890/130230",
  "10.1515/9781400881376"
))
}
}
\keyword{DOI}
