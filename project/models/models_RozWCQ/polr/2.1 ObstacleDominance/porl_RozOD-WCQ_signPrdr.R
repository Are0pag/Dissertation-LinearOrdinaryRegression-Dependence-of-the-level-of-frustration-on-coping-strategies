source("project/models/libs.R")
source("project/models/models_RozWCQ/data/dataRozWCQ.R")


# 1. Построение модели
data_ordered <- ordered(data_Rosenzweig$ObstacleDominance)

#Pr(Chi) = 0.001389068
model <- polr (
  data_ordered ~ 
    data_WCQ$Seeking_social_support # -2.887
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
null_model <- polr(data_ordered ~ 1, Hess = TRUE) 
anova(null_model, model)