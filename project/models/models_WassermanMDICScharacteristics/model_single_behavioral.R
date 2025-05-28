
source("project/empirical_research_data/practical_data/pd_WS_MDICS.R")

model <- polr (
  frustration_ord ~
    as.factor(data_MDICS_coping_characteristics$Behavioral_sphere)
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
frustration_ord <- ordered(data_Wasserman$Integral_level_of_social_frustration)
null_model <- polr(frustration_ord ~ 1, Hess = TRUE) 
anova(null_model, model)
