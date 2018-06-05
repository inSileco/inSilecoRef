<!--

setwd('/users/davidbeauchesne/dropbox/phd/inSilecoRef/')
rmarkdown::render('./README.Rmd', 'md_document')

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

    library(inSilecoRef)
    newDOI(DOI = c('10.1016/j.tree.2016.10.011','10.1890/130230','10.1515/9781400881376'))
    R>>  The following DOI were not imported as they are already in the master .bib file: 
    R>>   10.1515/9781400881376
    R>>  
    R>>  The following references were added to the master .bib file: 
    R>>  @article{Dee_2017,
    R>>     doi = {10.1016/j.tree.2016.10.011},
    R>>     url = {https://doi.org/10.1016%2Fj.tree.2016.10.011},
    R>>     year = 2017,
    R>>     month = {feb},
    R>>     publisher = {Elsevier {BV}},
    R>>     volume = {32},
    R>>     number = {2},
    R>>     pages = {118--130},
    R>>     author = {Laura E. Dee and Stefano Allesina and Aletta Bonn and Anna Eklöf and Steven D. Gaines and Jes Hines and Ute Jacob and Eve McDonald-Madden and Hugh Possingham and Matthias Schröter and Ross M. Thompson},
    R>>     title = {Operationalizing Network Theory for Ecosystem Service Assessments},
    R>>     journal = {Trends in Ecology {\&} Evolution}
    R>>  } @article{Low_D_carie_2014,
    R>>     doi = {10.1890/130230},
    R>>     url = {https://doi.org/10.1890%2F130230},
    R>>     year = 2014,
    R>>     month = {sep},
    R>>     publisher = {Wiley},
    R>>     volume = {12},
    R>>     number = {7},
    R>>     pages = {412--418},
    R>>     author = {Etienne Low-D{\'{e}}carie and Corey Chivers and Monica Granados},
    R>>     title = {Rising complexity and falling explanatory power in ecology},
    R>>     journal = {Frontiers in Ecology and the Environment}
    R>>  }

### To do list

-   
     `insileco.bib` blog complete bibtex file
-   
     `manual.bib` manual entries bibtex file
-   
     `newDOI()` function to insert new DOI in `doi.RDS` and
    `insileco.bib`
-   
     `newManual()` function to crete new manual entry for `manual.bib`

### Material

<http://www.pauloldham.net/creating-a-bibliography-with-rcrossref/>
