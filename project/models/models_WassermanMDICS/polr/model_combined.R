source("project/empirical_research_data/practical_data/pd_WS_MDICS.R")

df$combined_part <- paste(
  data_MDICS_coping_strategies$Behavioral_sphere,
  data_MDICS_coping_strategies$Cognitive_sphere,
  sep = "_"
)
# 
# View(df) 

# Создаём комбинированный фактор (например, "Behavioral_Distraction_Cognitive_ProblemAnalysis")
df <- data.frame(
  combined_strategy = c(
    paste(
      data_MDICS_coping_strategies$Behavioral_sphere,
      data_MDICS_coping_strategies$Cognitive_sphere,
      data_MDICS_coping_strategies$Emotional_sphere,
      sep = "_"
    )
  )
)

# Упрощаем, оставляя только частые комбинации
df$combined_strategy <- fct_lump_min(
  df$combined_strategy, 
  min = 3
)



model_combined <- polr(
  frustration_ord ~ combined_strategy,
  data = data_MDICS_coping_strategies,
  method = "logistic"
)