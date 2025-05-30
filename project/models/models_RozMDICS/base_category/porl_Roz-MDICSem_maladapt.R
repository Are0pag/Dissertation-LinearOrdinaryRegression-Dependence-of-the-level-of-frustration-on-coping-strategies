source("project/models/models_RozMDICS/dependencies.R")

y_ordered <- ordered(data_Rosenzweig$NeedPersistence)

# # Объединение редких дезадаптивных стратегий
# data_MDICS_coping_strategies$Emotional_groped <- fct_collapse(
#   as.factor(data_MDICS_coping_strategies$Emotional_sphere),
#   Maladaptive = c("Suppression of emotions","Self-blame", "Submission", "Aggressiveness"),
#   "Optimism" = "Optimism",
#   "Protest" = "Protest",
#   "Emotional release" = "Emotional release",
#   "Passive cooperation" = "Passive cooperation"
# )

data_MDICS_coping_strategies$Emotional_sphere_lumped <- lump_min (
  column = data_MDICS_coping_strategies$Emotional_sphere,
  min_value = 3
)

print(table(data_MDICS_coping_strategies$Emotional_sphere_lumped))

data_MDICS_coping_strategies$Emotional_sphere_lumped <- relevel(
  data_MDICS_coping_strategies$Emotional_sphere_lumped, 
  ref = "Emotional release"
)

# Model building
model <- polr (
  y_ordered ~ 
    as.factor(data_MDICS_coping_strategies$Emotional_sphere_lumped)
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
exp(cbind(OR = coef(model), confint(model)))

# 6. Сравнение с нулевой моделью
null_model <- polr(y_ordered ~ 1, Hess = TRUE) 
anova(null_model, model)
