#' KPI for daily count of users
#'
#' Dplyr statements to obtain the metric
#'
#' @param con SQL connection
#' @param dates a vector (character) with YYYY-MM-DD
#' @param customer TRUE or FALSE (i.e. FALSE = free version of the game)
#'
#' @importFrom dplyr tbl filter select distinct group_by summarise collect n mutate
#' @importFrom rlang sym
#' @export
kpi_dcu <- function(con = intendo::sql_connection(), dates, customer = TRUE) {
  tbl(con, "sj_users_daily_small") %>%
    filter(!!sym("login_date") %in% dates & !!sym("is_customer") == customer) %>%
    select(!!sym("login_date"), !!sym("player_id")) %>%
    distinct() %>%
    group_by(!!sym("login_date")) %>%
    summarise(n = n()) %>%
    collect() %>%
    mutate(n = as.numeric(n))
}
