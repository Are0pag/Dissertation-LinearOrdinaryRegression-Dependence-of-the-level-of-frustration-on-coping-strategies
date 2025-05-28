source("project/empirical_research_data/Wasserman_data.R")
source("project/empirical_research_data/MDICS_data_сoping_strategies.R")

# Проверка на NA
sum(is.na(data_Wasserman$Integral_level_of_social_frustration))
sum(is.na(data_MDICS_coping_strategies$Behavioral_sphere))
sum(is.na(data_MDICS_coping_strategies$Cognitive_sphere))
sum(is.na(data_MDICS_coping_strategies$Emotional_sphere))

# Проверка уровней факторов
table(data_MDICS_coping_strategies$Behavioral_sphere)
table(data_MDICS_coping_strategies$Cognitive_sphere)
table(data_MDICS_coping_strategies$Emotional_sphere)