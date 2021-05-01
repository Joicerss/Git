library (devtools)
library(usethis)
library(pkgdown)
library(testthat)
library(roxygen2)
library(knitr)

install.packages("path")


library(path)

usethis::use_git()

usethis::use_git_config(user.name = "Joicerss",
                        user.email = "joicerodrigues.adv@gmail.com")

usethis::use_git_config()

usethis::edit_r_environ()

gitcreds::gitcreds_set()

gitcreds::gitcreds_get()

usethis::use_git()

usethis::use_github()

devtools::has_devel()

available::available("chess", browse = FALSE)

usethis::create_package()

