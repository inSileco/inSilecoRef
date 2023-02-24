bib <- "test.bib"
dois <- c(
    "10.1016/j.tree.2016.10.011",
    "10.1890/130230",
    "10.1515/9781400881376"
)

suppressMessages({
    test_that("add first doi", {
        res <- add_doi_reference(dois[1], bib)
        expect_equal(length(res), 1)
        expect_true(file.exists(bib))
        expect_true(inherits(res, "bibentry"))
    })

    test_that("add new doi", {
        res2 <- add_doi_reference(dois, bib)
        expect_equal(length(res2), 3)
        res3 <- add_doi_reference(dois[1], bib)
        expect_identical(res2, res3)
    })

    test_that("bad file format", {
        expect_error(add_doi_reference("10.1515/9781400881376", "test.b"))
    })
})
unlink(bib)