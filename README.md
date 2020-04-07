# inSilecoRef
[![R build status](https://github.com/inSileco/inSilecoRef/workflows/R-CMD-check/badge.svg)](https://github.com/inSileco/inSilecoRef/actions)
[![Lifecycle: experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)

# Description

This package contains the tools used to manage bibliographic data for the
[*inSileco* blog](https://insileco.github.io/).

Managing bibliographies in a group can be hard considering that individuals use
different types of reference management tools such as
[Zotero](https://www.zotero.org/) and [Mendeley](https://www.mendeley.com/). To
simplify reference management on our blog and still allow blog members to use
their own preferred reference management tools, we decided to build a
centralized repo with a master `.bib` file and tools to update and validate this
file.


# Installation

The easiest way to install `inSilecoRef` is to use the
[`remotes`](https://CRAN.R-project.org/package=remotes) package:

```R
install.packages("remotes")
remotes::install_github("inSileco/inSilecoRef")
```

# Main features

The package offers two main functions. The main function, `newDOI()` uses
digital object identifier (DOI) and takes advantage of functionalities offered
by the [`rcrossref`](https://github.com/ropensci/rcrossrefs) and
[`RefManageR`](https://github.com/ropensci/RefManageR) packages.
The second function, `newManual()` allows users to create a manual entry in
cases where DOIs are not available.

## Update bibliography with DOI

```R
library(inSilecoRef)
newDOI(DOI = c('10.1016/j.tree.2016.10.011','10.1890/130230','10.1515/9781400881376'))
```

<br/>

```
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
```

### To do list

- [ ] `manual.bib` manual entries bibtex file
- [ ] `newManual()` function to create new manual entry for `manual.bib`
- [ ] add status shields
- [ ] eventually add a function that updates bib file to identify which posts are citing which reference
