# parse method
roxy_tag_parse.roxy_tag_cheers <- function(x) {

  parsed <- x$raw

  x$val <- list(
    text = parsed
  )
  x
}


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
