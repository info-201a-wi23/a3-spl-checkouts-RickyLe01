library("ggplot2")
library("dplyr")
library("stringr")

df_books <- read.csv("~/Desktop/Main", stringsAsFactors = FALSE)

#shows the trend of eBooks checked out throughout the years.
ebooks_data <- df_books %>%
  filter(UsageClass %in% c("Digital")) %>%
  filter(str_detect(MaterialType, "EBOOK")) %>%
  group_by(CheckoutYear, UsageClass) %>%
  summarize(Checkouts = sum(Checkouts))

  ggplot(ebooks_data) +
    geom_line(aes(x = CheckoutYear, 
                   y = Checkouts,
                   color = UsageClass)) +
    labs(title = "eBooks throughout the years",
        x = "Checkout Year",
        y = "eBooks Checked Out",
        color = "Ussage Class") +
    scale_y_continuous(breaks = seq(0, 100000, by = 200000))