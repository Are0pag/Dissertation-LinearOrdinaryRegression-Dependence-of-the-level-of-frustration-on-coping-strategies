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


# Кастомная функция для вывода результатов в нужном формате
print_polr_results <- function(model) {
  # Получаем summary модели
  model_summary <- summary(model)
  
  # Извлекаем коэффициенты и p-значения
  coeffs <- coef(model_summary)
  p_values <- pnorm(abs(coeffs[, "t value"]), lower.tail = FALSE) * 2
  
  # Доверительные интервалы
  ci <- confint(model)
  
  # Отношения шансов
  or <- exp(coef(model))
  or_ci <- exp(ci)
  
  # Форматируем вывод для каждого предиктора
  for (i in seq_along(coef(model))) {
    cat(sprintf(
      "Predictor %d: p-value = %.4f, t-value (%.4f), OR = %.4f, 95%% CI [%.4f; %.4f]\n",
      i,
      p_values[i],
      coeffs[i, "t value"],
      or[i],
      or_ci[i, 1],
      or_ci[i, 2]
    ))
  }
  
  # Тест ANOVA для всей модели
  anova_test <- Anova(model)
  cat("\nModel ANOVA test:\n")
  for (i in 1:nrow(anova_test)) {
    cat(sprintf(
      "%s: p-value = %.4f, Chisq = %.4f\n",
      rownames(anova_test)[i],
      anova_test[i, "Pr(>Chisq)"],
      anova_test[i, "LR Chisq"]
    ))
  }
  
  # Сравнение с нулевой моделью
  null_model <- polr(y_ordered ~ 1, Hess = TRUE)
  comp_test <- anova(null_model, model)
  cat(sprintf(
    "\nComparison with null model: p-value = %.4f, Chisq = %.4f\n",
    comp_test[2, "Pr(Chi)"],
    comp_test[2, "Chi Sq"]
  ))
}

# Вызываем нашу функцию для вывода результатов
print_polr_results(model)