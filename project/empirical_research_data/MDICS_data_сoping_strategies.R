
data_MDICS_coping_strategies <- data.frame(
  Behavioral_sphere = c(
    "Distraction", "Collaboration", "Retreat", "Retreat",  
    "Collaboration", "Distraction", "Retreat", "Collaboration",  
    "Retreat", "Distraction", "Compensation", "Altruism",  
    "Appeal", "Distraction", "Retreat", "Retreat",  
    "Distraction", "Appeal", "Constructive activity", "Altruism",  
    "Retreat", "Collaboration", "Distraction", "Altruism",  
    "Retreat", "Compensation", "Retreat", "Altruism",  
    "Distraction", "Retreat", "Collaboration", "Distraction")
)

data_MDICS_coping_strategies$Cognitive_sphere <- c(
  "Maintaining composure", "Problem analysis", "Finding meaning", 
  "Acceptance", "Dissimulation", "Finding meaning", "Relativity", 
  "Problem analysis", "Finding meaning", "Problem analysis", 
  "Problem analysis", "Ignoring", "Dissimulation", 
  "Ignoring", "Finding meaning", "Problem analysis", 
  "Problem analysis", "Problem analysis", "Problem analysis", 
  "Relativity", "Confusion", "Problem analysis", 
  "Problem analysis", "Problem analysis", "Problem analysis", 
  "Maintaining composure", "Maintaining composure", "Dissimulation", 
  "Maintaining composure", "Finding meaning", "Religiosity", "Ignoring"
)

data_MDICS_coping_strategies$Emotional_sphere <- c(
  "Suppression of emotions", "Emotional release", "Submission", 
  "Suppression of emotions", "Emotional release", "Emotional release", 
  "Optimism", "Optimism", "Self-blame", "Passive cooperation", 
  "Protest", "Suppression of emotions", "Optimism", "Optimism", 
  "Optimism", "Self-blame", "Optimism", "Emotional release", 
  "Optimism", "Suppression of emotions", "Suppression of emotions", "Aggressiveness", 
  "Protest", "Protest", "Optimism", "Protest", "Suppression of emotions", 
  "Optimism", "Optimism", "Optimism", "Optimism", "Emotional release"
)

#View(data_MDICS_coping_strategies)

create_rus <- function() {
  data_MDICS_coping_strategies_rus <- data.frame(
    Behavioral_sphere = c(
      "Отвлечение", "Сотрудничество", "Отступление", "Отступление", 
      "Сотрудничество", "Отвлечение", "Отступление", "Сотрудничество", 
      "Отступление", "Отвлечение", "Компенсация", "Альтруизм", 
      "Обращение", "Отвлечение", "Отступление", "Отступление", 
      "Отвлечение", "Обращение", "Конструктивная активность", "Альтруизм", 
      "Отступление", "Сотрудничество", "Отвлечение", "Альтруизм", 
      "Отступление", "Компенсация", "Отступление", "Альтруизм", 
      "Отвлечение", "Отступление")
  )
  
  data_MDICS_coping_strategies_rus$Cognitive_sphere <- c(
    "Сохранение апломба", "Проблемный анализ", "Придание смысла", 
    "Смирение", "Диссимиляция", "Придание смысла", "Относительность", 
    "Проблемный анализ", "Придание смысла", "Проблемный анализ", 
    "Проблемный анализ", "Игнорирование", "Диссимиляция", 
    "Игнорирование", "Придание смысла", "Проблемный анализ", 
    "Проблемный анализ", "Проблемный анализ", "Проблемный анализ", 
    "Относительность", "Растерянность", "Проблемный анализ", 
    "Проблемный анализ", "Проблемный анализ", "Проблемный анализ", 
    "Сохранение апломба", "Сохранение апломба", "Диссимиляция", 
    "Сохранение апломба", "Придание смысла"
  )
  
  data_MDICS_coping_strategies_rus$Emotional_sphere <- c(
    "Подавление эмоций", "Эмоциональная разгрузка", "Покорность", 
    "Подавление эмоций", "Эмоциональная разгрузка", "Эмоциональная разгрузка", 
    "Оптимизм", "Оптимизм", "Самообвинение", "Пассивная кооперация", 
    "Протест", "Подавление эмоций", "Оптимизм", "Оптимизм", 
    "Оптимизм", "Самообвинение", "Оптимизм", "Эмоциональная разгрузка", 
    "Оптимизм", "Подавление эмоций", "Подавление эмоций", "Агрессивность", 
    "Протест", "Протест", "Оптимизм", "Протест", "Подавление эмоций", 
    "Оптимизм", "Оптимизм", "Оптимизм"
  )
}




