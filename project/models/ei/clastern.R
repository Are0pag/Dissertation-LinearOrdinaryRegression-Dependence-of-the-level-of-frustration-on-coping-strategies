if(!require("stats")) install.packages("stats")
library(stats)

if(!require("ggplot2")) install.packages("ggplot2")
library(ggplot2)

if(!require("dplyr")) install.packages("dplyr")
library(dplyr)

# Загрузка данных (пример)
group1 <- data.frame(андрогинности = c(0.2322, 0.9288, -0.5805, 1.5093),
                     EI = c(10, 7, 4, 5),
                     group = "Group1")
group2 <- data.frame(андрогинности = c(0.322, 0.288, -0.805, 1.093),
                     EI = c(1, 7, 6, 1),
                     group = "Group2")

all_data <- rbind(group1, group2)
scaled_data <- scale(all_data[, c("андрогинность", "EI")])
#View(scaled_data)

# Иерархическая кластеризация
dist_matrix <- dist(scaled_data)
hclust_result <- hclust(dist_matrix, method = "ward.D2")
plot(hclust_result, labels = all_data$group)  # смотрим дендрограмму

# K-means (если хотим задать 3 кластера)
set.seed(123)
kmeans_result <- kmeans(scaled_data, centers = 3)
all_data$cluster <- kmeans_result$cluster

# Проверка соответствия исходных групп и кластеров
table(all_data$group, all_data$cluster)

ggplot(all_data, aes(x = андрогинности, y = EI, color = group)) + 
  geom_point() + 
  theme_minimal()
