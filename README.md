## inSileco bibliography

[![Build Status](https://travis-ci.org/inSileco/inSileco.github.io.svg?branch=dev)](https://travis-ci.org/inSileco/inSileco.github.io)

### Overview

This repo contains the tools and data used to generate bibliographies for the
[*inSileco* blog](https://insileco.github.io/).
In order to make group bibliography management easier and considering that
*inSileco* members use different tools (*e.g.* Zotero & Mendeley), we decided
to build the *inSileco* bibliographic library using a list of DOIs.


### Requirements

- `rcrossref`

### To do

[ ] `insileco.bib` blog complete bibtex file
[ ] `manual.bib` manual entries bibtex file
[ ] `doi.RDS` data.frame, doi = character, keyword = character
[ ] `newDOI()` function to insert new DOI in `doi.RDS` and `insileco.bib`
[ ] `newManual()` function to crete new manual entry for `manual.bib`

### Example

```r
# Example of code to use
ref <- rcrossref::cr_cn(dois = c("10.1126/science.169.3946.635", '10.1038/s41586-018-0151-x'), format = "bibtex")
ref <- unlist(ref)
cat(ref)
write(ref, file = 'ref.bib')
```

### Material

http://www.pauloldham.net/creating-a-bibliography-with-rcrossref/
