if(!require("rpart")) install.packages("rpart")
library(rpart)

source("project/empirical_research_data/practical_data/pd_WS_MDICS.R")

tree_model <- rpart(Frustration ~ Behavioral + Cognitive + Emotional,
                    data = model_data, method = "class")