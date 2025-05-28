source("project/empirical_research_data/MDICS_data_сoping_strategies.R")

# Создаем дата-фрейм с факторами
data_factors_MDICS_coping_strategies <- data.frame(
  Behavioral_sphere = as.factor(data_MDICS_coping_strategies$Behavioral_sphere),
  Cognitive_sphere = as.factor(data_MDICS_coping_strategies$Cognitive_sphere),
  Emotional_sphere = as.factor(data_MDICS_coping_strategies$Emotional_sphere)
)

View(data_factors_MDICS_coping_strategies)

# Преобразуем факторы в матрицу "dummy" переменных
dummy_matrix <- model.matrix(~ . - 1, data = data_factors_MDICS_coping_strategies)

# Рассчитываем корреляцию между "dummy" переменными
correlation_matrix <- cor(dummy_matrix)

# Выводим корреляционную матрицу
print(correlation_matrix)
View(correlation_matrix)
