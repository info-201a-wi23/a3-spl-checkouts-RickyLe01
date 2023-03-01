library("ggplot2")
library("dplyr")
library("stringr")

df_books <- read.csv("~/Desktop/Main", stringsAsFactors = FALSE)

pop_songs <- df_books %>%
  filter(str_detect(Subjects, "Pop"))

pop_checkout_year <- pop_songs %>%
  group_by(CheckoutYear) %>%
  summarize(number_of_checkouts = sum(Checkouts))


ggplot(pop_checkout_year) +
  geom_line(aes(x = CheckoutYear, y = number_of_checkouts)) +
  labs(title = "Pop Songs Checkout Trend", 
       subtitle = "From 2017-2023",
       x = "Year",
       y = "Total Checkouts")