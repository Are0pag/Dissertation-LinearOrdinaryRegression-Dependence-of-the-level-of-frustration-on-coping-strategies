if(!require("dplyr")) install.packages("dplyr")
library(dplyr)

source("project/empirical_research_data/practical_data/pd_WS_MDICS.R")



data_stats <- data %>%
  group_by(Group) %>%
  summarise(
    n = n(),
    Mean = mean(EI),
    Median = median(EI),
    SD = sd(EI),
    Min = min(EI),
    Max = max(EI),
    Q1 = quantile(EI, 0.25),
    Q3 = quantile(EI, 0.75)
  )

print(data_stats, n = Inf)



fgerjn <- function() {
  data_MDICS_coping_strategies %>%
    count(Cognitive_sphere) %>%
    arrange(desc(n))
  
  
  if(!require("ggplot2")) install.packages("ggplot2")
  library(ggplot2)
  ggplot(
    data_MDICS_coping_strategies, 
    aes(
      x=Behavioral_sphere_lumped, 
      y=data_Wasserman$Integral_level_of_social_frustration
    )
  ) +
    geom_boxplot()   +
    labs(title="Уровень фрустрации по поведенческим стратегиям")
}


