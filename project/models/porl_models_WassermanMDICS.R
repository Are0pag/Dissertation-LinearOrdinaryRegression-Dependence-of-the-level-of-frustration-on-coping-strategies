if (!require("MASS")) install.packages("MASS")
library(MASS)

source("project/empirical_research_data/Wasserman_data.R")
source("project/empirical_research_data/MDICS_data_сoping_strategies.R")

source("project/tools/data_adapters/lump_min_MDICS_strat.R")


porl_strategies <- function() {
  # Преобразуем зависимую переменную в упорядоченный фактор
  frustration_ord <- ordered(data_Wasserman$Integral_level_of_social_frustration)
  data_MDICS_coping_strategies$Behavioral_sphere_lumped <-
    lump_min_MDICS_strategies(data_MDICS_coping_strategies$Behavioral_sphere)
  #View(data_MDICS_coping_strategies)
  
  result <- polr (
    frustration_ord ~ 
      as.factor(data_MDICS_coping_strategies$Behavioral_sphere_lumped)
      +
      as.factor(data_MDICS_coping_strategies$Cognitive_sphere)
      + 
      as.factor(data_MDICS_coping_strategies$Emotional_sphere)
    ,
    
    Hess = TRUE,
    method = "logistic"  # явно указываем метод
  )
  return(result)
}
  

  
