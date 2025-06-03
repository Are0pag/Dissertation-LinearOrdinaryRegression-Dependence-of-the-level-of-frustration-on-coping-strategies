source("project/plots/plotMDICSchar.R")

# Исследование копинг-поведения по Хайму (Method for the Determination of Individual Coping Strategies; **MDICS**)
# Создаем сводную таблицу с частотами стратегий
strategy_data <- bind_rows(
  # Создаем данные для поведенческой сферы
  data.frame(
    Сфера = rep("Поведенческая сфера", nrow(dfPl)),  # Повторяем название сферы
    Стратегия = dfPl$bs,  # Стратегии из поведенческой сферы
    Адаптивность = dfPl$bc  # Адаптивность для поведенческой сферы
  ),
  # Создаем данные для когнитивной сферы
  data.frame(
    Сфера = rep("Когнитивная сфера", nrow(dfPl)),  # Повторяем название сферы
    Стратегия = dfPl$cs,  # Стратегии из когнитивной сферы
    Адаптивность = dfPl$cc  # Адаптивность для когнитивной сферы
  ),
  # Создаем данные для эмоциональной сферы
  data.frame(
    Сфера = rep("Эмоциональная сфера", nrow(dfPl)),  # Повторяем название сферы
    Стратегия = dfPl$es,  # Стратегии из эмоциональной сферы
    Адаптивность = dfPl$ec  # Адаптивность для эмоциональной сферы
  )
) %>%
  # Группируем данные по сфере, стратегии и адаптивности
  group_by(Сфера, Стратегия, Адаптивность) %>%
  # Считаем количество вхождений каждой комбинации
  summarise(Количество = n(), .groups = "drop") %>%
  # Группируем данные по сфере для расчета процентов
  group_by(Сфера) %>%
  # Рассчитываем процент использования каждой стратегии
  mutate(Процент = round(Количество / sum(Количество) * 100, 1))
  
#View(strategy_data)
#table(strategy_data$Стратегия, strategy_data$Сфера)
#unique(strategy_data)

strategy_data$Стратегия <- factor(strategy_data$Стратегия)

ggplot(strategy_data, aes(x = Стратегия, y = Процент, fill = Адаптивность)) +
  geom_bar(stat = "identity", color = "black", linewidth = 0.1) +
  facet_wrap(~Сфера, scales = "free_x") +
  scale_fill_manual(
    values = c(
      "Неконструктивный" = alpha("tomato", 0.8),
      "Относительно конструктивный" = alpha("yellow", 0.8),
      "Конструктивный" = alpha("chartreuse", 0.8)
    ),
    labels = c(
      "Неконструктивный" = "Неадаптивный",
      "Относительно конструктивный" = "Относительно адаптивный",
      "Конструктивный" = "Адаптивный"
    ),
    name = "Тип адаптивности"
  ) +
  scale_y_continuous(labels = scales::percent_format(scale = 1)) +
  theme_minimal(base_size = 15) +
  labs(x = "Копинг-стратегия", y = "Процент") +
  theme(
    axis.text.x = element_text(angle = 45, hjust = 1),
    panel.grid.major = element_line(color = "lightgray"),
    panel.grid.minor = element_blank(),
    panel.grid.major.x = element_blank(),
    panel.grid.major.y = element_line(
      color = "grey90", # Очень светлые линии
      linewidth = 0.8 # Тонкие линии
    ),
    legend.position = "bottom",
    legend.title = element_text(size = 10)
  ) +
  # Исправленное позиционирование подписей:
  geom_text(
    aes(label = paste0(Процент, "%")),
    position = position_dodge(width = 0.9),  # Для групповых столбцов
    vjust = -0.5,  # Сдвигаем подписи ВВЕРХ на 0.5 единицы
    size = 4,
    color = "black"
  )
