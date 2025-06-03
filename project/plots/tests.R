source("project/plots/plotMDICSextended.R")

df <- data.frame(
  parameter = c("A", "B", "A", "B", "A", "C", "B", "C", "A", "B"),
  value = c(5, 3, 6, 2, 4, 7, 1, 5, 8, 3)
)

ggplot(df, aes(x = value)) +
  geom_histogram(binwidth = 0.5, fill = "blue", color = "green") +
  facet_wrap(~ parameter) +
  labs(title = "Гистограмма значений по параметрам", x = "Значение", y = "Частота") +
  theme_minimal()


