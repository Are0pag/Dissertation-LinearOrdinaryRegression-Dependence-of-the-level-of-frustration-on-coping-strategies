if (!require("forcats")) install.packages("forcats")
library(forcats)

lump_min <- function(column, min_value) {
  
  if (!is.factor(column)) {
    column <- as.factor(column)
  }
  
  # Удаляем редко встречающиеся стратегии или объединяем категории
  result <- 
    fct_lump_min(column, min = min_value) # оставляем только частые (>min_value случаев)
  return(result)
}
