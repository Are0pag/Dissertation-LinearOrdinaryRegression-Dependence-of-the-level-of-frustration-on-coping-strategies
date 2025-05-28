# Practical Data

if (!require("MASS")) install.packages("MASS")
library(MASS)
if (!require("car")) install.packages("car")
library(car)
if(!require("pscl")) install.packages("pscl")
library(pscl)

source("project/empirical_research_data/Wasserman_data.R")
source("project/empirical_research_data/MDICS_data_сoping_strategies.R")
source("project/empirical_research_data/MDICS_data_coping_characteristics.R")

source("project/tools/data_adapters/lump_min.R")
source("project/tools/cutter.R")

get_all_pd_WS_MDICS <- function() {
  result <- data.frame(
    fr = data_Wasserman$Integral_level_of_social_frustration,
    fr_ord = frustration_ord,
    fr_cut = frustration_cut,
    
    b = data_MDICS_coping_strategies$Behavioral_sphere,
    c = data_MDICS_coping_strategies$Cognitive_sphere,
    e = data_MDICS_coping_strategies$Emotional_sphere,
    
    b_lump = data_MDICS_coping_strategies$Behavioral_sphere_lumped,
    c_lump = data_MDICS_coping_strategies$Cognitive_sphere_lumped,
    e_lump = data_MDICS_coping_strategies$Emotional_sphere_lumped
  )
  return(result)
}

# Преобразуем зависимую переменную в упорядоченный фактор
frustration_ord <- ordered(data_Wasserman$Integral_level_of_social_frustration)
frustration_cut <- cut_ordinal_by_Wasserman(data_Wasserman$Integral_level_of_social_frustration)

# Убираем редкие вариации
data_MDICS_coping_strategies$Behavioral_sphere_lumped <-
  lump_min(
    data_MDICS_coping_strategies$Behavioral_sphere,
    min_value = 5
  )

data_MDICS_coping_strategies$Cognitive_sphere_lumped <-
  lump_min(
    data_MDICS_coping_strategies$Cognitive_sphere,
    min_value = 3    
    #4 for removed_model Pr(Chi)
    #3 for removed_model Pr(Chi) + Maintaining composure
  )

data_MDICS_coping_strategies$Emotional_sphere_lumped <- 
  lump_min(
    data_MDICS_coping_strategies$Emotional_sphere,
    min_value = 5   
    #3-5 for removed_model Pr(Chi)
    #5 5 for removed_model Pr(Chi) + Maintaining composure
  )

#View(data_MDICS_coping_strategies)