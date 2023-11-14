
#
remder_report <- function(ext = "pdf",
                          echo = FALSE,
                          ...) {

  # check if knitr installed (and if not, asks for it)
  if(!isTRUE(requireNamespace("knitr", quietly = TRUE))) {
    stop("You need to install the R package 'knitr'. Please run in your R terminal:\n install.packages('knitr')", call. = FALSE)
  }
  knitr::opts_knit$set(progress = FALSE, verbose = FALSE)

  # check if rmarkdown installed (and if not, asks for it)
  if(!isTRUE(requireNamespace("rmarkdown", quietly = TRUE))) {
    stop("You need to install the R package 'rmarkdown'. Please run in your R terminal:\n install.packages('rmarkdown')", call. = FALSE)
  }

  extra_args <- list(...)

  filename <-
    if (exists("filename", extra_args)) {
      extra_args$filename
    } else {
      paste0("report.", ext)}

  rmd_params <-
    list(filename = filename)

  # remove all warnings
  withr::with_options(list(warn = -1), {

    # get current directory, move to relevant path, go back to current directory
    file <- file.path(tempdir(), filename)

    file_location <-
      normalizePath(
        file.path(system.file("report", package = "rocletCHEERS"), "report.Rmd"))

    rmd_format <-
      switch(ext,
             pdf = rmarkdown::pdf_document(),
             docx = rmarkdown::word_document())
    out <-
      quiet(
        rmarkdown::render(input = file_location,
                          output_format = rmd_format,
                          params = rmd_params))

    file.copy(from = out, to = file, overwrite = TRUE)
  })
}
