library(dplyr)
library(intendo)

# open SQL connection
con <- sql_connection()

# dplyr provides functions to get SQL data
table1 <- tbl(con, "sj_all_revenue_small")
class(table1)

# what if I want to plot
library(ggplot2)

table1 %>%
  filter(item_type == "iap" & item_name == "gold4") %>%
  show_query()

table1 %>%
  filter(item_type == "iap" & item_name == "gold4") %>%
  mutate(start_day = substr(as.character(start_day), 1, 7)) %>%
  group_by(start_day) %>%
  summarise(item_revenue = sum(item_revenue, na.rm = T)) %>%
  ggplot() +
  geom_col(aes(x = start_day, y = item_revenue))

table2 <- table1 %>%
  filter(item_type == "iap" & item_name == "gold4") %>%
  mutate(start_day = substr(as.character(start_day), 1, 7)) %>%
  group_by(start_day) %>%
  summarise(item_revenue = sum(item_revenue, na.rm = T)) %>%
  collect()

class(table2)

weighted.mean(table2$item_revenue, seq(1, nrow(table2)))

lm(item_revenue ~ start_day, data = table1)
