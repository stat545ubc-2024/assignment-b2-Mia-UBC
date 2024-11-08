#' Create a Detailed Summary Table for a Variable
#'
#' @description
#'Creates a table of summary statistics for a variable. These summary statistics are the mean, range, minimum, first quartile, median, third quartile, and maximum values of the variable.
#'
#' @param data The dataframe to be used.
#' @param ... The variable(s) to group the summary variable by. It is not necessary to group the summary variable.
#' @param summ_var The variable for which a summary table will be created.
#' @param na.rm Set to TRUE to remove NA values from data processed by the function.
#'
#' @return A table
#' @export
#'
#' @examples
#' data <- data.frame(
#'   colour = rep(c("Red", "Blue", "Yellow"), each = 5),
#'   number = rnorm(15))
#' total_summary(data, colour, summ_var = number)

total_summary <- function(data, ..., summ_var, na.rm = FALSE) {
  if(!is.numeric(data[[deparse(substitute(summ_var))]])) {
    stop("Sorry, this function only works for numeric variables.")
  }
  data |>
    dplyr::group_by(...) |>
    dplyr::summarize(mean = mean({{summ_var}}, na.rm = na.rm),
              range = max({{summ_var}}, na.rm = na.rm) - min({{summ_var}}, na.rm = na.rm),
              min = min({{summ_var}}, na.rm = na.rm),
              first_quartile = stats::quantile({{summ_var}}, 0.25, na.rm = na.rm),
              median = stats::median({{summ_var}}, na.rm = na.rm),
              third_quartile = stats::quantile({{summ_var}}, 0.75, na.rm = na.rm),
              max = max({{summ_var}}, na.rm = na.rm))
}
