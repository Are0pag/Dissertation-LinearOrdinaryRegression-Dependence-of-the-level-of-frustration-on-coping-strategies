source("project/models/libs.R")
source("project/models/models_RozWCQ/data/dataRozWCQ.R")
source("project/empirical_research_data/Wasserman_data.R")

View(data_Wasserman)
# 1. Построение модели
#data_ordered <- ordered(data_Rosenzweig$Extrapunitive)
data_ordered <- ordered(data_Wasserman$Integral_level_of_social_frustration)
print(data_ordered)


#Pr(Chi) = 0.01128418
model <- polr (
  data_ordered ~ 
    data_WCQ$Confrontation + 
    data_WCQ$Distancing + 
    data_WCQ$Self_control + 
    data_WCQ$Seeking_social_support + 
    data_WCQ$Taking_responsibility + 
    data_WCQ$Escape_avoidance + 
    data_WCQ$Problem_solving_planning + 
    data_WCQ$Positive_reassessment # t = -3.1656 (значимость на уровне 0.01)
  ,
  
  Hess = TRUE,
  method = "logistic"  # явно указываем метод
)

# Проверка на мультиколлинеарность
vif_values <- vif(model)
print(vif_values)

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