#' Import and validate new DOI to DOI list.
#'
#' Imports and validates new entries for a DOI list
#'
#' @param DOI character vector of DOI to import
#' @param bib character path to master .bib file, default is `inSilecoRef.bib`
#'
#' @keywords DOI
#'
#' @importFrom rcrossref cr_cn
#' @importFrom RefManageR ReadBib
#' @importFrom stringr str_locate
#' @importFrom stringr str_detect
#' @export
#'
#' @examples
#' # Example 1:
#' newDOI(DOI = c('10.1016/j.tree.2016.10.011','10.1890/130230','10.1515/9781400881376'))

newDOI <- function(DOI, bib = './inSilecoRef.bib') {
  # Steps
    # 1. import inSilecoRef.bib
    # 2. Export list of inSilecoDOI from inSilecoRef.bib & year & family name of 1st author & key
    # 3. check DOI against inSilecoDOI
    # 4. if !DOI %in% inSilecoRef.bib
    #   4.1 import new references
    #   4.2 check and change keywords if duplicated
    # 5. Prompt user for confirmation of reference additions
    # 6. Reload and update inSilecoRef.bib as raw file

  # Function
  # 1. Import .bib file
    inSilecoRef <- RefManageR::ReadBib(bib)

  # 2. Export relevant info on bibliography
    nRef <- length(inSilecoRef)
    bibTab <- data.frame(DOI = character(nRef),
                         key = character(nRef),
                         family = character(nRef),
                         year = character(nRef),
                         stringsAsFactors = F)

    for(i in 1:nRef) {
      bibTab$DOI[i] <- inSilecoRef[i]$doi # DOI
      bibTab$key[i] <- names(inSilecoRef[i]) # key
      bibTab$family[i] <- inSilecoRef[i]$author[1]$family # family name of 1st author
      bibTab$year[i] <- inSilecoRef[i]$year # year of publication
    }

  # 3. Check DOI against bibTab$DOI
    checkDOI <- DOI %in% bibTab$DOI

  # 4. if !DOI %in% inSilecoRef.bib
    if (sum(!checkDOI) > 0) {
      # 4.1 Import reference using rcrossref
      newRef <- rcrossref::cr_cn(dois = DOI[!checkDOI], format = "bibtex")
      newRef <- unlist(newRef)

      # 4.2 Check key
      nNewRef <- length(newRef)
      for(i in 1:nNewRef) {
        begChar <- stringr::str_locate(newRef[i], '(.*?)\\{')[2] + 1
        endChar <- stringr::str_locate(newRef[i], '(.*?),')[2] - 1
        key <- substr(newRef[i], begChar, endChar)

        # If key already exists, give a new key by adding a letter at the end
        if (key %in% bibTab$key) {
          nKey <- sum(str_detect(bibTab$key, key)) # Number of references with same key + letter
          newKey <- paste0(key, letters[nKey + 1])
          newRef[i] <- gsub(key, newKey, newRef[i])
        }
      }
    }

  # 5. Report of changes made
    if (sum(checkDOI) > 0) {
      cat('The following DOI were not imported as they are already in the master .bib file: \n',
          paste0(DOI[checkDOI], '\n'))
      cat('\n')
    }

    if (sum(!checkDOI) > 0) {
      cat('The following references were added to the master .bib file: \n')
      cat(newRef)
    }

  # 6. Reload and update inSilecoRef.bib as raw file
    # Thanks to https://stackoverflow.com/questions/9068397/import-text-file-as-single-character-string
    if (sum(!checkDOI) > 0) {
      bibRaw <- readChar(bib, file.info(bib)$size)
      updateRef <- c(bibRaw, newRef)
      write(updateRef, file = bib)
    }
}
