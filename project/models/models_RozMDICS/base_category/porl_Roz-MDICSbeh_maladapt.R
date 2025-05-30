source("project/models/models_RozMDICS/dependencies.R")

y_ordered <- ordered(data_Rosenzweig$NeedPersistence)

# Объединение редких дезадаптивных стратегий
# data_MDICS_coping_strategies$Behavioral_grouped <- fct_collapse(
#   as.factor(data_MDICS_coping_strategies$Behavioral_sphere),
#   Maladaptive = c("Retreat"),
#   "Altruism" = "Altruism",
#   "Appeal" = "Appeal",
#   "Collaboration" = "Collaboration",
#   "Compensation" = "Compensation",
#   "Constructive activity" = "Constructive activity",
#   "Distraction" = "Distraction"
# )

data_MDICS_coping_strategies$Behavioral_sphere_lumped <- lump_min (
  column = data_MDICS_coping_strategies$Behavioral_sphere,
  min_value = 3
)

data_MDICS_coping_strategies$Behavioral_sphere_lumped <- relevel(
  data_MDICS_coping_strategies$Behavioral_sphere_lumped, 
  ref = "Retreat"
)

# Model building
model <- polr (
  y_ordered ~ 
    as.factor(data_MDICS_coping_strategies$Behavioral_sphere_lumped)
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
