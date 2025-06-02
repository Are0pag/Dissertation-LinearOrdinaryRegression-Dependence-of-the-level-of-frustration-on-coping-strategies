source("project/models/models_RozMDICS/dependencies.R")

source("project/empirical_research_data/Wasserman_data.R")

#y_ordered <- ordered(data_Wasserman$Integral_level_of_social_frustration)
y_ordered <- ordered(data_Rosenzweig$Intropunitive)

data_MDICS_coping_strategies$Emotional_sphere_lumped <- lump_min (
  column = data_MDICS_coping_strategies$Emotional_sphere,
  min_value = 3
)
#print(table(data_MDICS_coping_strategies$Emotional_sphere_lumped))

data_MDICS_coping_strategies$Emotional_sphere_lumped_ref <- relevel(
  data_MDICS_coping_strategies$Emotional_sphere_lumped, 
  ref = "Suppression of emotions"
)
model <- polr (
  y_ordered ~ 
    as.factor(data_MDICS_coping_strategies$Emotional_sphere_lumped_ref)
  ,
  
  Hess = TRUE,
  method = "logistic"  # явно указываем метод
)

#brant(model)

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
