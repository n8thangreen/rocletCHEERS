#
# https://cran.r-project.org/web/packages/roxygen2/vignettes/extending.html
#

library(roxygen2)

#' @cheers checklist item

# parse method
roxy_tag_parse.roxy_tag_cheers <- function(x) {

  parsed <- x$raw

  x$val <- list(
    text = parsed
  )
  x
}

text <- "
  #' @cheers time horizon
  f <- function(x, y) {
    # ...
  }"


block <- parse_text(text)
block

str(block[[1]]$tags)

cheers_roclet <- function() {
  roclet("cheers")
}

#
roclet_process.roclet_cheers <- function(x, blocks, env, base_path) {
  results <- list()

  for (block in blocks) {
    tags <- block_get_tags(block, "cheers")

    for (tag in tags) {
      msg <- paste0("[", tag$file, ":", tag$line, "] ", tag$val$text)
      results[[tag$val$text]] <- msg
    }
  }

  results
}

#
roclet_output.roclet_cheers <- function(x, results, base_path, ...) {
  for (header in names(results)) {
    messages <- results[[header]]
    cat(paste0(header, ": ", "\n"))
    cat(paste0(" * ", messages, "\n", collapse = ""))
  }

  invisible(NULL)
}

results <- roc_proc_text(cheers_roclet(), "
#' @cheers time horizon
f <- function(x, y) {
  # ...
}

#' @cheers discounting
g <- function(x, y) {
  # ...
}
")

roclet_output(cheers_roclet(), results)

# roxygenize(roclets = "cheers_roclet")
