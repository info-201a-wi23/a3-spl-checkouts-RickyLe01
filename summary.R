data_df <- read.csv("~/Desktop/Main", stringsAsFactors = TRUE)
View(data_df)

library("dplyr")
library("ggplot2")
library("leaflet")

most_checkouts <- data_df %>%
  filter(Checkouts == max(Checkouts, na.rm = TRUE)) %>%
  pull(CheckoutYear)
most_checkouts

highest_checkout_2017 <- data_df %>%
  filter(CheckoutYear == 2017) %>%
  summarize(amount = max(Checkouts, na.rm = TRUE))
highest_checkout_2017

highest_ebook_checkout <- data_df %>%
  filter(CheckoutYear == 2019 ,MaterialType == "EBOOK") %>%
  summarize(max = max(Checkouts, na.rm = TRUE))
highest_ebook_checkout

least_checked_out_jan <- data_df %>%
  filter(CheckoutMonth == 1) %>%
  summarize(min = min(Checkouts, na.rm = TRUE))
least_checked_out_jan

most_checked_out_jan <- data_df %>%
  filter(CheckoutMonth == 1) %>%
  summarize(max = max(Checkouts, na.rm = TRUE))
most_checked_out_jan