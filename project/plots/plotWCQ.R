source("project/plots/libs_and_data.R")

# Подготовка данных (без NA)
result_WCQ <- data_WCQ %>%
  pivot_longer(everything(), names_to = "Scale", values_to = "Score") %>%
  mutate(Level = case_when(
    Score >= 61 ~ "high",
    Score <= 39 ~ "low",
    TRUE ~ "moderate"
  )) %>%
  group_by(Scale, Level) %>%
  summarise(Count = n(), .groups = "drop") %>%
  group_by(Scale) %>%
  mutate(Percentage = round(Count / sum(Count) * 100, 1)) %>%
  filter(Level %in% c("high", "low")) %>%
  pivot_wider(names_from = Level, values_from = Percentage, values_fill = 0) %>%
  ungroup()

#View(result_WCQ)

# Правильное преобразование названий (без NA)
russian_names <- c(
  "Confrontation" = "Конфронтация",
  "Distancing" = "Дистанцирование",
  "Self_control" = "Самоконтроль",
  "Seeking_social_support" = "Поиск социальной\nподдержки",
  "Taking_responsibility" = "Принятие ответственности",
  "Escape_avoidance" = "Бегство-Избегание",
  "Problem_solving_planning" = "Планирование решения\nпроблемы",
  "Positive_reassessment" = "Позитивная переоценка"
)

# Применяем преобразование названий
result_WCQ <- result_WCQ %>%
  mutate(Scale = factor(russian_names[Scale], levels = russian_names))

# Создаем график
ggplot(result_WCQ) +
  # Столбцы для высокого уровня
  geom_col(
    aes(x = Scale, y = high, fill = "Высокий уровень"),
    position = position_nudge(x = -0.2),
    width = 0.4,
    show.legend = TRUE
  ) +
  # Столбцы для низкого уровня
  geom_col(
    aes(x = Scale, y = low, fill = "Низкий уровень"),
    position = position_nudge(x = 0.2),
    width = 0.4,
    show.legend = TRUE
  ) +
  # Подписи для высокого уровня
  geom_text(
    aes(x = Scale, y = high, label = ifelse(high > 0, paste0(high, "%"), NA)),
    position = position_nudge(x = -0.2),
    vjust = -0.5,
    size = 3
  ) +
  # Подписи для низкого уровня
  geom_text(
    aes(x = Scale, y = low, label = ifelse(low > 0, paste0(low, "%"), NA)),
    position = position_nudge(x = 0.2),
    vjust = -0.5,
    size = 3
  ) +
  # Настройки визуализации
  scale_fill_manual(
    values = c("Высокий уровень" = "deepskyblue", "Низкий уровень" = "orange"),
    name = "Уровень"
  ) +
  scale_y_continuous(
    limits = c(0, max(c(result_WCQ$high, result_WCQ$low), na.rm = TRUE) * 1.1),
    breaks = seq(0, 100, by = 5),
    expand = expansion(mult = c(0, 0.1)),
    labels = scales::percent_format(scale = 1)
  ) +
  labs(
    title = "Распределение стратегий совладания (WCQ)",
    x = "Шкалы",
    y = "Процент"
  ) +
  theme_minimal() +
  theme(
    axis.text.x = element_text(angle = 45, hjust = 1, size = 10),
    plot.title = element_text(hjust = 0.5, face = "bold", size = 14),
    legend.position = "bottom",
    panel.grid.major.x = element_blank()
  )

# Создаем таблицу с процентными соотношениями
percentage_table <- result_WCQ %>%
  select(Scale, high, low) %>%
  group_by(Scale) %>%
  summarise(
    `Высокий уровень (%)` = sum(high),
    `Низкий уровень (%)` = sum(low),
    .groups = "drop"
  ) %>%
  rename("Шкала" = Scale)


#View(percentage_table)


