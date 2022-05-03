library(dplyr)
library(intendo)
library(ggplot2)

# open SQL connection
con <- sql_connection()

tbl(con, "sj_all_revenue_small") %>%
  filter(item_type == "iap" & item_name == "gold4") %>%
  mutate(start_day = substr(as.character(start_day), 1, 7)) %>%
  filter(start_day > "2015-09") %>%
  group_by(start_day) %>%
  summarise(item_revenue = sum(item_revenue, na.rm = T)) %>%
  ggplot() +
  geom_col(aes(x = start_day, y = item_revenue, fill =  start_day)) +
  scale_fill_manual(values = official_palettes())

tbl(con, "sj_all_revenue_small") %>%
  filter(item_type == "iap" & item_name == "gold4") %>%
  mutate(start_day = substr(as.character(start_day), 1, 7)) %>%
  filter(start_day > "2015-09") %>%
  group_by(start_day) %>%
  summarise(item_revenue = sum(item_revenue, na.rm = T)) %>%
  ggplot() +
  geom_col(aes(x = start_day, y = item_revenue, fill =  start_day)) +
  scale_fill_manual(values = official_palettes("finance")) +
  theme_minimal()
