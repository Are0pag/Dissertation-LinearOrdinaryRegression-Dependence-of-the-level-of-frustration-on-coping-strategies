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
  
View(strategy_data)
table(strategy_data$Стратегия, strategy_data$Сфера)
unique(strategy_data)

# Определим цвета для уровней адаптивности
color_palette <- c(
  "Конструктивный" = "#1b9e77",  # зеленый
  "Относительно конструктивный" = "#FFD700",  # золотой/желтый
  "Неконструктивный" = "#d95f02"  # красный
)

strategy_data$Стратегия <- factor(strategy_data$Стратегия)

ggplot(strategy_data, aes(x = Стратегия, y = Процент, fill = Адаптивность)) +
  geom_bar(stat = "identity", color = "black") +
  facet_wrap(~Сфера, scales = "free_x") +
  scale_fill_manual(values = c(
    "Неконструктивный" = alpha("#FF9999", 0.7),  # Светло-красный
    "Относительно конструктивный" = "#FFCC99",  # Светло-оранжевый
    "Конструктивный" = "#99FF99"  # Светло-зеленый
  ), 
  labels = c(
    "Неконструктивный" = "Неадаптивный", 
    "Относительно конструктивный" = "Относительно адаптивный", 
    "Конструктивный" = "Адаптивный"
  ),
  name = "Тип адаптивности") +
  scale_y_continuous(labels = scales::percent_format(scale = 1)) +  # Форматируем ось y в процентах
  theme_minimal(base_size = 15) +  # Увеличиваем базовый размер шрифта
  labs(
    x = "Копинг-стратегия",
    y = "Процент"
  ) +
  theme(
    axis.text.x = element_text(angle = 45, hjust = 1),
    panel.grid.major = element_line(color = "lightgray"),  # Добавляем основную сетку
    panel.grid.minor = element_blank(),  # Убираем мелкую сетку
    legend.position = "bottom",            # Легенда внизу
    legend.title = element_text(size = 10) # Настройка заголовка легенды
  ) +
  geom_text(aes(label = paste0(round(Процент, 1), "%")),
            position = position_stack(vjust = 1.15),
            color = "black", size = 4) # Добавляем подписи к столбцам





  
  
