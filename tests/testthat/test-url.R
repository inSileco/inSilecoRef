test_that("CRAN URLs", {
    expect_identical(url_cran(""), "[CRAN](https://CRAN.R-project.org)")
    expect_identical(
        url_cran("fs"),
        "[`fs`](https://CRAN.R-project.org/package=fs)"
    )
    expect_error(url_cran("f!s"))
})

test_that("Bioconductor URLs", {
    expect_identical(
        url_bioc(""),
        "[Bioconductor](https://www.bioconductor.org/)"
    )
    expect_identical(
        url_bioc("ggtree"),
        "[`ggtree`](https://bioconductor.org/packages/ggtree/)"
    )
    expect_error(url_bioc("gg!"))
})

test_that("Bioconductor URLs", {
    expect_identical(
        url_bioc(""),
        "[Bioconductor](https://www.bioconductor.org/)"
    )
    expect_identical(
        url_bioc("ggtree"),
        "[`ggtree`](https://bioconductor.org/packages/ggtree/)"
    )
    expect_error(url_bioc("gg!"))
})

test_that("GitHub URLs", {
    expect_identical(
        url_gh(""),
        "[cran](https://github.com/cran)"
    )
    expect_identical(
        url_gh(user = ""),
        "[GitHub](https://github.com)"
    )
    expect_identical(
        url_gh("rcites"),
        "[`rcites`](https://github.com/cran/rcites)"
    )
    expect_identical(
        url_gh(user = "inSileco"),
        "[inSileco](https://github.com/inSileco)"
    )
    expect_identical(
        url_gh("rowlbot", "inSileco"),
        "[`rowlbot`](https://github.com/inSileco/rowlbot)"
    )
})
