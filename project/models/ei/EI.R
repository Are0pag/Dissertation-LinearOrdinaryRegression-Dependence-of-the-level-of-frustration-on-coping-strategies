# Установка необходимых пакетов (если они ещё не установлены)
install.packages("car")
install.packages("ggplot2")
install.packages("psych")

# Подключение библиотек
library(car)
library(ggplot2)
library(psych)

# Предположим, что данные хранятся в data.frame с колонками:
# group - номер группы (1, 2, 3)
# androg - баллы по андрогинности
# ei - баллы по эмоциональному интеллекту

# Пример данных (замените на свои)
data <- data.frame(
  group = rep(1:3, times = c(33, 31, 30)),
  androg = c(rnorm(33, mean = 50, sd = 10),
             rnorm(31, mean = 52, sd = 9),
             rnorm(30, mean = 48, sd = 11)),
  ei = c(rnorm(33, mean = 25, sd = 5),
         rnorm(31, mean = 27, sd = 4),
         rnorm(30, mean = 23, sd = 6))
)
#View(data)

# 1. Описательные статистики по группам
describeBy(data$androg, group = data$group)
describeBy(data$ei, group = data$group)

# 2. Проверка нормальности распределения
# Для андрогинности
by(data$androg, data$group, shapiro.test)
# Для EI
by(data$ei, data$group, shapiro.test)

# 3. Проверка гомогенности дисперсий
leveneTest(androg ~ as.factor(group), data = data)
leveneTest(ei ~ as.factor(group), data = data)

# 4. Визуализация
# Boxplot для андрогинности
ggplot(data, aes(x = as.factor(group), y = androg)) +
  geom_boxplot() +
  labs(title = "Распределение баллов андрогинности по группам",
       x = "Группа", y = "Баллы андрогинности")

# Boxplot для EI
ggplot(data, aes(x = as.factor(group), y = ei)) +
  geom_boxplot() +
  labs(title = "Распределение баллов EI по группам",
       x = "Группа", y = "Баллы EI")

# Гистограммы с плотностью
ggplot(data, aes(x = androg, fill = as.factor(group))) +
  geom_histogram(aes(y = ..density..), alpha = 0.5, position = "identity") +
  geom_density(alpha = 0.2) +
  facet_wrap(~group) +
  labs(title = "Гистограммы распределения андрогинности по группам")

ggplot(data, aes(x = ei, fill = as.factor(group))) +
  geom_histogram(aes(y = ..density..), alpha = 0.5, position = "identity") +
  geom_density(alpha = 0.2) +
  facet_wrap(~group) +
  labs(title = "Гистограммы распределения EI по группам")