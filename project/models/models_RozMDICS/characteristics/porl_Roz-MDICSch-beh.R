source("project/models/models_RozMDICS/dependencies.R")

source("project/empirical_research_data/Wasserman_data.R")

y_ordered <- ordered(data_Wasserman$Integral_level_of_social_frustration)
#y_ordered <- ordered(data_Rosenzweig$EgoDefense)
model <- polr (
  y_ordered ~ 
    as.factor(data_MDICS_coping_characteristics$Behavioral_sphere) 
  +
    as.factor(data_MDICS_coping_characteristics$Cognitive_sphere)
  +
    as.factor(data_MDICS_coping_characteristics$Emotional_sphere)
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