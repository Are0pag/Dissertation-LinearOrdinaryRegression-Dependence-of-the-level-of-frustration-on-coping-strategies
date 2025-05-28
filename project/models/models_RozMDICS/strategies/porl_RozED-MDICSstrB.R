source("project/models/models_RozMDICS/dependencies.R")

# Summary = false

y_ordered <- ordered(data_Rosenzweig$EgoDefense)

# незначимый Pr(>Chisq) при min_value = 5
predictor_single <- lump_min(
  column = data_MDICS_coping_strategies$Behavioral_sphere,
  min_value = 1
)

model <- polr (
  y_ordered ~ 
    as.factor(predictor_single)
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