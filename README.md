<!--

setwd('/users/davidbeauchesne/dropbox/phd/inSilecoRef/')
rmarkdown::render('./inSilecoRef.Rmd', 'md_document')

-->
Description
===========

This package contains the tools used to manage bibliographic data for
the [*inSileco* blog](https://insileco.github.io/).

Managing bibliographies in a group can be hard considering that
individuals use different types of reference management tools such as
[Zotero](https://www.zotero.org/) and
[Mendeley](https://www.mendeley.com/). To simplify reference management
on our blog and still allow blog members to use their own preferred
reference management tools, we decided to build a centralized repo with
a common `.bib` file and tools to update and validate this file.

Status
------

[![Build
Status](https://travis-ci.org/inSileco/inSileco.github.io.svg?branch=dev)](https://travis-ci.org/inSileco/inSileco.github.io)

Installation
============

The easiest way to install `inSilecoRef` is to use the
[*devtools*](http://cran.r-project.org/web/packages/devtools/index.html)
package:

    install.packages("devtools")
    devtools::install_github("inSileco/inSilecoRef")

Main features
=============

The package offers two main functions. The main function, `newDOI()`
uses digital object identifier (DOI) and takes advantage of
functionalities offered by the
[`rcrossref`](https://ropensci.org/tutorials/rcrossref_tutorial/)
package. The second function, `newManual()` allows the user to create a
manual entry in cases where DOIs are not available.

`newDOI()`
----------

### To do

-   
     `insileco.bib` blog complete bibtex file
-   
     `manual.bib` manual entries bibtex file
-   
     `doi.RDS` data.frame, doi = character, keyword = character
-   
     `newDOI()` function to insert new DOI in `doi.RDS` and
    `insileco.bib`
-   
     `newManual()` function to crete new manual entry for `manual.bib`

### Example

    # Example of code to use
    ref <- rcrossref::cr_cn(dois = c('10.1515/9781400881376','10.1086/414572'), format = "bibtex")
    ref <- unlist(ref)
    cat(ref)
    write(ref, file = 'ref.bib')

### Material

<http://www.pauloldham.net/creating-a-bibliography-with-rcrossref/>

    create_package("/users/davidbeauchesne/dropbox/phd/cisl")
    devtools::install_github('david-beauchesne/cisl')
