if (!require("MASS")) install.packages("MASS")
library(MASS)

source("project/empirical_research_data/WCQ_data.R")
source("project/empirical_research_data/Wasserman_data.R")

call_porl_with_all_predictors <- function() {
  # Преобразуем зависимую переменную в упорядоченный фактор
  frustration_ord <- ordered(data_Wasserman$Integral_level_of_social_frustration)
  
  result <- polr(
    frustration_ord ~ 
      data_WCQ$Confrontation + 
      data_WCQ$Distancing + 
      data_WCQ$Self_control + 
      data_WCQ$Seeking_social_support + 
      data_WCQ$Taking_responsibility + 
      data_WCQ$Escape_avoidance + 
      data_WCQ$Problem_solving_planning + 
      data_WCQ$Positive_reassessment,
    Hess = TRUE,
    method = "logistic"  # явно указываем метод
  )
  return(result)
}

call_porl_significant_predictor <- function() {
  # Преобразуем зависимую переменную в упорядоченный фактор
  frustration_ord <- ordered(data_Wasserman$Integral_level_of_social_frustration)
  
  result <- polr(
    frustration_ord ~ 
      data_WCQ$Problem_solving_planning,
    Hess = TRUE,
    method = "logistic"  # явно указываем метод
  )
  return(result)
}

porl_origin_predictor_as_factor_frustration <- function() {
  result <- polr(
    as.factor(data_Wasserman$Integral_level_of_social_frustration) ~ 
      data_WCQ$Confrontation 
    + data_WCQ$Distancing 
    + data_WCQ$Self_control 
    + data_WCQ$Seeking_social_support 
    + data_WCQ$Taking_responsibility 
    + data_WCQ$Escape_avoidance 
    + data_WCQ$Problem_solving_planning 
    + data_WCQ$Positive_reassessment,
    
    Hess = TRUE
  )
  return(result)
}

porl_factor_predictor <- function() {
  result <- polr(
    as.factor(data_Wasserman$Integral_level_of_social_frustration) ~ 
      as.factor(data_WCQ$Confrontation) +
      as.factor(data_WCQ$Distancing) +
      as.factor(data_WCQ$Self_control) +
      as.factor(data_WCQ$Seeking_social_support) +
      as.factor(data_WCQ$Taking_responsibility) +
      as.factor(data_WCQ$Escape_avoidance) +
      as.factor(data_WCQ$Problem_solving_planning) +
      as.factor(data_WCQ$Positive_reassessment),
    
    Hess = TRUE
  )
  return(result)
}

source("project/tools/cutter.R")
porl_origin_predictor_cutted_frustr <- function() {
  result <- polr(
    cut_ordinal_by_Wasserman(data_Wasserman$Integral_level_of_social_frustration) ~ 
      data_WCQ$Confrontation 
    + data_WCQ$Distancing 
    + data_WCQ$Self_control 
    + data_WCQ$Seeking_social_support 
    + data_WCQ$Taking_responsibility 
    + data_WCQ$Escape_avoidance 
    + data_WCQ$Problem_solving_planning 
    + data_WCQ$Positive_reassessment,
    
    Hess = TRUE
  )
  return(result)
}
