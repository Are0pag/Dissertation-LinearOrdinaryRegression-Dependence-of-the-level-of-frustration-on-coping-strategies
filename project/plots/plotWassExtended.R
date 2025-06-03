source("project/plots/libs_and_data.R")

# Создание данных
dfW <- data.frame(
  Integral_level_of_social_frustration = c(1.2, 0.7, 1.4, 1.8, 1.7, 0.7, 1.6, 0.1, 3.1, 0.9,
                                           1.1, 1.0, 1.0, 1.1, 2.3, 1.0, 1.4, 1.2, 1.8, 2.4,
                                           1.6, 0.8, 1.4, 0.9, 2.1, 0.4, 1.2, 1.1, 0.7, 1.2,
                                           0.9, 1.3),
  id = 1:32  # Добавляем id для каждого наблюдения
)

# Определение уровней фрустрированности
dfW <- dfW %>%
  mutate(level = case_when(
    Integral_level_of_social_frustration >= 3.5 ~ "Очень высокий",
    Integral_level_of_social_frustration >= 3.0 ~ "Повышенный",
    Integral_level_of_social_frustration >= 2.5 ~ "Умеренный",
    Integral_level_of_social_frustration >= 2.0 ~ "Неопределенный",
    Integral_level_of_social_frustration >= 1.5 ~ "Пониженный",
    Integral_level_of_social_frustration >= 0.5 ~ "Очень низкий",
    TRUE ~ "Отсутствие"
  )) %>%
  mutate(level = factor(level, 
                        levels = c("Отсутствие", "Очень низкий", "Пониженный", 
                                   "Неопределенный", "Умеренный", "Повышенный", 
                                   "Очень высокий")))

# Цветовая палитра для уровней
colors <- c("Отсутствие" = "gray90",
            "Очень низкий" = "green3",
            "Пониженный" = "greenyellow",
            "Неопределенный" = "yellow",
            "Умеренный" = "orange",
            "Повышенный" = "red",
            "Очень высокий" = "darkred")

# Построение графика
ggplot(dfW, 
       aes(x = id, y = Integral_level_of_social_frustration, fill = level)) +
  geom_col(width = 0.7, color = "black", linewidth = 0.3) +
  scale_fill_manual(values = colors, name = "Уровень фрустрированности") +
  geom_hline(yintercept = c(0.5, 1.5, 2.0, 2.5, 3.0, 3.5), 
             linetype = "dashed", color = "gray50", alpha = 0.7) +
  labs(
    #title = "Диагностика уровня социальной фрустрированности",
    title = " ",
       x = "Идентификатор респондента",
       y = "Интегральный уровень социальной фрустрированности") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1),
        panel.grid.major.x = element_blank(),
        legend.position = "bottom") +
  scale_x_continuous(breaks = 1:32)