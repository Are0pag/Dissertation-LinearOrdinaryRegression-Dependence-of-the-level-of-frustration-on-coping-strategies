source("project/empirical_research_data/practical_data/pd_WS_MDICS.R")

# 1. Построение модели
model_beh <- polr (
  #frustration_cut ~ 
  frustration_ord ~ 
    as.factor(data_MDICS_coping_strategies$Behavioral_sphere_lumped)
    +
    as.factor(data_MDICS_coping_strategies$Cognitive_sphere_lumped)
    +
    as.factor(data_MDICS_coping_strategies$Emotional_sphere_lumped)
  ,
  
  Hess = TRUE,
  method = "logistic"  # явно указываем метод
)

# 2. Сводка модели
summary(model_beh)

# 3. Тесты на значимость предикторов
Anova(model_beh)

# 4. Псевдо-R² для оценки качества модели
pR2(model_beh)

# 5. Экспоненцированные коэффициенты (отношения шансов)
exp(cbind(OR = coef(model_beh), confint(model_beh)))

# 6. Сравнение с нулевой моделью
frustration_ord <- ordered(data_Wasserman$Integral_level_of_social_frustration)
null_model <- polr(frustration_ord ~ 1, Hess = TRUE)
anova(null_model, model_beh)