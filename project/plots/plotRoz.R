source("project/plots/libs_and_data.R")

# Исходные данные
data <- data.frame(
  E = c(58, 62, 25, 75, 50, 64, 20, 29, 33, 22, 45, 29, 33, 45, 43, 66, 43, 33, 33, 29, 29, 62, 25, 27, 37, 33, 62, 29, 25, 50, 58, 58),
  I = c(8, 4, 25, 12, 8, 18, 29, 22, 8, 20, 12, 12, 29, 22, 8, 12, 18, 20, 16, 16, 8, 12, 29, 25, 16, 8, 16, 25, 25, 8, 29, 8),
  M = c(33, 33, 50, 12, 41, 16, 50, 47, 58, 56, 41, 58, 37, 31, 47, 20, 37, 45, 50, 54, 62, 25, 45, 47, 45, 58, 20, 45, 50, 41, 12, 33),
  OD = c(58, 41, 45, 45, 54, 37, 64, 39, 58, 45, 41, 58, 54, 45, 52, 33, 58, 45, 58, 54, 62, 29, 41, 50, 62, 58, 35, 58, 58, 58, 41, 41),
  ED = c(37, 45, 25, 14, 33, 50, 27, 52, 37, 33, 37, 29, 33, 45, 39, 50, 18, 41, 29, 39, 33, 58, 33, 22, 20, 37, 56, 37, 25, 20, 29, 41),
  NP = c(4, 12, 29, 0, 12, 12, 8, 8, 4, 20, 20, 12, 12, 8, 8, 16, 22, 12, 12, 6, 4, 12, 25, 27, 16, 4, 8, 4, 16, 20, 29, 16),
  GCR = c(35, 28, 28, 14, 42, 42, 42, 35, 28, 35, 50, 35, 28, 42, 35, 57, 42, 42, 28, 21, 35, 35, 50, 14, 28, 28, 50, 50, 42, 50, 28, 28)
)

# Нормативы Ясюковой
norms <- data.frame(
  Scale = c("E",  "I",  "M",   "OD",  "ED",  "NP",  "GCR"),
  Norm = c( 43.4, 26.1, 30.5,  28.8,  36.3,  34.9,  56.1)
)
# Преобразуем данные с сохранением порядка шкал
plot_data <- data %>%
  pivot_longer(everything(), names_to = "Scale", values_to = "Score") %>%
  left_join(norms, by = "Scale") %>%
  mutate(Direction = ifelse(Score > Norm, "Выше нормы", "Ниже нормы"),
         Scale = factor(Scale, levels = c("E", "I", "M", "OD", "ED", "NP", "GCR")))

# Русские названия шкал с переносами строк (в нужном порядке)
russian_labels <- c(
  "E" = "Экстрапунитивные\nреакции (E)", 
  "I" = "Интропунитивные\nреакции (I)", 
  "M" = "Импунитивные\nреакции (M)",
  "OD" = "Тип реакции\n«с фиксацией на препятствии»\n(OD)", 
  "ED" = "Тип реакции\n«с фиксацией на самозащите»\n(ED)", 
  "NP" = "Тип реакции\n«с фиксацией на\nудовлетворении потребности»\n(NP)",
  "GCR" = "Степень социальной\nадаптации (GCR)"
)

# Создаем график
ggplot(plot_data) +
  # Индивидуальные результаты (тонкие столбики)
  geom_segment(
    aes(x = Scale, xend = Scale, 
        y = Norm, yend = Score, 
        color = Direction),
    linewidth = 0.8,
    alpha = 0.9,
    position = position_jitter(width = 0.2, seed = 123)
  ) +
  # Нормативы (толстые черные линии)
  geom_segment(
    data = norms %>% mutate(Scale = factor(Scale, levels = c("E", "I", "M", "OD", "ED", "NP", "GCR"))),
    aes(x = as.numeric(Scale) - 0.4, 
        xend = as.numeric(Scale) + 0.4,
        y = Norm, yend = Norm),
    color = "black",
    linewidth = 1
  ) +
  # Подписи нормативов
  geom_text(
    data = norms %>% mutate(Scale = factor(Scale, levels = c("E", "I", "M", "OD", "ED", "NP", "GCR"))),
    aes(x = Scale, y = Norm, label = paste0(Norm, "%")),
    vjust = -0.5, # Этот параметр отвечает за вертикальное смещение подписей
    hjust = -1.26,   # Горизонтальное смещение (по центру)
    size = 3,
    color = "black",
    #fontface = "bold"
  ) +
  # Настройки осей
  scale_x_discrete(labels = russian_labels) +
  scale_y_continuous(labels = scales::percent_format(scale = 1)) +  # Добавляем проценты к оси y
  scale_color_manual(
    values = c("Выше нормы" = "deepskyblue", "Ниже нормы" = "orange"),
    name = NULL  # Убираем заголовок легенды
  ) +
  labs(
    title = "Отклонения от нормативов Ясюковой (методика Розенцвейга)",
    x = "Шкалы",
    y = "Процентные значения",
    caption = "Толстая черная линия показывает нормативное значение\nЗеленые линии - значения выше нормы, красные - ниже нормы"
  ) +
  theme_minimal() +
  theme(
    axis.text.x = element_text(size = 9, angle = 45, hjust = 1, lineheight = 0.8),
    panel.grid.major.x = element_blank(),
    legend.position = "bottom",  # Легенда внизу
    plot.caption = element_text(hjust = 0.5, size = 9, margin = margin(t = 10)),
    plot.title = element_text(hjust = 0.5)
  ) +
  guides(color = guide_legend(override.aes = list(linewidth = 2)))  # Утолщаем линии в легенде