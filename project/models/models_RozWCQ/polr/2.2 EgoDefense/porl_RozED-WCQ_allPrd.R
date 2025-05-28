source("project/models/libs.R")
source("project/models/models_RozWCQ/data/dataRozWCQ.R")


# 1. Построение модели
data_ordered <- ordered(data_Rosenzweig$EgoDefense)

#Pr(Chi) = 0.001479852
model <- polr (
  data_ordered ~ 
    data_WCQ$Confrontation + 
    data_WCQ$Distancing + 
    data_WCQ$Self_control + 
    data_WCQ$Seeking_social_support + 
    data_WCQ$Taking_responsibility + 
    data_WCQ$Escape_avoidance + 
    data_WCQ$Problem_solving_planning + 
    data_WCQ$Positive_reassessment 
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