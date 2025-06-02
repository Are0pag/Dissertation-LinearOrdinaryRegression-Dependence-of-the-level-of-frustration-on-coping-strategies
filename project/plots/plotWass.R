source("project/plots/libs_and_data.R")

library(dplyr)
library(tidyr)
library(ggplot2)

# Подготовка данных (без NA)
result_Wasserman <- data_Wasserman %>%
  mutate(Level = case_when(
    Integral_level_of_social_frustration >= 3 ~ "high",
    Integral_level_of_social_frustration <= 1.4 ~ "low",
    TRUE ~ "moderate"
  )) %>%
  group_by(Level) %>%
  summarise(Count = n(), .groups = "drop") %>%
  mutate(Percentage = round(Count / sum(Count) * 100, 1)) %>%
  filter(Level %in% c("high", "low")) %>%
  pivot_wider(names_from = Level, values_from = Percentage, values_fill = 0) %>%
  ungroup()

# Создаем график
ggplot(result_Wasserman) +
  # Столбцы для высокого уровня
  geom_col(
    aes(x = "Уровень социальной фрустрации", y = high, fill = "Высокий уровень"),
    position = position_nudge(x = -0.2),
    width = 0.4,
    show.legend = TRUE
  ) +
  # Столбцы для низкого уровня
  geom_col(
    aes(x = "Уровень социальной фрустрации", y = low, fill = "Низкий уровень"),
    position = position_nudge(x = 0.2),
    width = 0.4,
    show.legend = TRUE
  ) +
  # Подписи для высокого уровня
  geom_text(
    aes(x = "Уровень социальной фрустрации", y = high, label = ifelse(high > 0, paste0(high, "%"), NA)),
    position = position_nudge(x = -0.2),
    vjust = -0.5,
    size = 3
  ) +
  # Подписи для низкого уровня
  geom_text(
    aes(x = "Уровень социальной фрустрации", y = low, label = ifelse(low > 0, paste0(low, "%"), NA)),
    position = position_nudge(x = 0.2),
    vjust = -0.5,
    size = 3
  ) +
  # Настройки визуализации
  scale_fill_manual(
    values = c("Высокий уровень" = "#1b9e77", "Низкий уровень" = "#d95f02"),
    name = "Уровень"
  ) +
  scale_y_continuous(
    limits = c(0, max(c(result_Wasserman$high, result_Wasserman$low), na.rm = TRUE) * 1.1),
    breaks = seq(0, 100, by = 10),
    expand = expansion(mult = c(0, 0.1))
  ) +
  labs(
    title = "Распределение уровней социальной фрустрации",
    x = "Уровень",
    y = "Процент респондентов"
  ) +
  theme_minimal() +
  theme(
    axis.text.x = element_text(angle = 0, hjust = 0.5, size = 10),
    plot.title = element_text(hjust = 0.5, face = "bold", size = 14),
    legend.position = "top",
    panel.grid.major.x = element_blank()
  )
