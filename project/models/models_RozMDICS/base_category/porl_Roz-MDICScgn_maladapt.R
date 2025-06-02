source("project/models/models_RozMDICS/dependencies.R")
source("project/tools/data_adapters/lump_min.R")

source("project/empirical_research_data/Wasserman_data.R")

y_ordered <- ordered(data_Wasserman$Integral_level_of_social_frustration)

# # Объединение редких дезадаптивных стратегий
# data_MDICS_coping_strategies$Cognitive_grouped <- fct_collapse(
#   as.factor(data_MDICS_coping_strategies$Cognitive_sphere),
#   Maladaptive = c("Acceptance","Ignoring", "Dissimulation", "Confusion"),
#   "Problem analysis" = "Problem analysis",
#   "Maintaining composure" = "Maintaining composure",
#   "Finding meaning" = "Finding meaning",
#   "Relativity" = "Relativity",
#   "Religiosity" = "Religiosity"
# )

data_MDICS_coping_strategies$Cognitive_grouped <- lump_min (
  column = data_MDICS_coping_strategies$Cognitive_sphere,
  min_value = 3
)

# Установка "Maladaptive" как референтной категории
data_MDICS_coping_strategies$Cognitive_grouped_ref <- relevel(
  data_MDICS_coping_strategies$Cognitive_grouped,
  ref = "Problem analysis"
)

#print(table(data_MDICS_coping_strategies$Cognitive_grouped_ref))

# Model building
model <- polr (
  y_ordered ~ 
    as.factor(data_MDICS_coping_strategies$Cognitive_grouped_ref)
  ,
  
  Hess = TRUE,
  method = "logistic"  # явно указываем метод
)

# 2. Сводка модели
summary(model)

# 3. Тесты на значимость предикторов
Anova(model)

# 4. Псевдо-R² для оценки качества модели
pR2(model)

# 5. Экспоненцированные коэффициенты (отношения шансов)
#exp(cbind(OR = coef(model), confint(model)))

# 6. Сравнение с нулевой моделью
null_model <- polr(y_ordered ~ 1, Hess = TRUE) 
anova(null_model, model)
