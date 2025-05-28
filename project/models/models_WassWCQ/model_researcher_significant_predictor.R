
if (!require("car")) install.packages("car")
if (!require("pscl")) install.packages("pscl") # для псевдо-R²
library(car)
library(pscl)

source("project/models/models_WassWCQ/porl_models_WassermanWCQ.R")

model_WassermanWCQ <- 
  call_porl_significant_predictor()

# 1. Сводка модели
summary(model_WassermanWCQ)

# 2. Тесты на значимость предикторов
Anova(model_WassermanWCQ)

# 3. Псевдо-R² для оценки качества модели
pR2(model_WassermanWCQ)

# 4. Экспоненцированные коэффициенты (отношения шансов)
exp(cbind(OR = coef(model_WassermanWCQ), confint(model_WassermanWCQ)))

# 5. Сравнение с нулевой моделью
frustration_ord <- ordered(data_Wasserman$Integral_level_of_social_frustration)
null_model <- polr(frustration_ord ~ 1, Hess = TRUE) 
anova(null_model, model_WassermanWCQ)
