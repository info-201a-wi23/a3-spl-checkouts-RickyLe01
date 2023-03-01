library("ggplot2")
library("dplyr")
library("stringr")


df_books <- read.csv("~/Desktop/Main", stringsAsFactors = FALSE)

fantasy_data <- df_books %>%
  filter(UsageClass %in% c("Digital")) %>%
  filter(str_detect(Subjects, "Fantasy")) %>%
  group_by(CheckoutYear, UsageClass) %>%
  summarize(Checkouts = sum(Checkouts))

ggplot(fantasy_data) +
  geom_line(aes(x = CheckoutYear,
                y = Checkouts,
                color = UsageClass)) +
  labs(title = "Fantasy Checkouts in 17-23",
       x = "Checkout Year",
       y = "Checkouts",
       color = "Usage Class") +
  scale_y_continuous(breaks = seq(0, 1000000, by = 200000))


