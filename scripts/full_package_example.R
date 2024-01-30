#
#

library(roxygen2)
library(rocletCHEERS)

roxygenize(package.dir = ".", roclets = "cheers_roclet")
