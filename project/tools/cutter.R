
breaks_default <- c(-Inf, 0.5, 1.4, 1.9, 2.4, 2.9, 3.4, Inf)
labels_default <- c("absence", "very_low", "low", "uncertain", "moderate", "elevated", "very_high")

cut_ordinal_by_Wasserman <- function(data, breaks = default_breaks, labels = default_labels) {
  # Проверяем, существует ли указанный столбец в датафрейме

  result<- cut(data,
               breaks = breaks_default,
               labels = labels_default,
               ordered_result = TRUE)

  return(result)
}
