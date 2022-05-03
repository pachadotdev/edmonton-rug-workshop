#' Official Intendo Branches' Palettes
#'
#' Add description
#'
#' @param theme marketing or finance
#' @return a vector with hex codes
#' @export
official_palettes <- function(theme = "marketing") {
  switch (theme,
    marketing = c("#7b59b1", "#ee6a5e", "#fcb064", "#4dafb2", "#aaaaaa"),
    finance = c("#a024d6", "#283758", "#e3e5db", "#7e9f3d", "#7b8279")
  )
}
