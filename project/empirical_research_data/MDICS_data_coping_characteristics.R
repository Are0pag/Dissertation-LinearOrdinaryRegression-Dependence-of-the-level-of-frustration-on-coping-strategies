
data_MDICS_coping_characteristics <- data.frame(
  Behavioral_sphere = c(
    "Relatively constructive", "Constructive", "Unconstructive", 
    "Unconstructive", "Constructive", "Relatively constructive", 
    "Unconstructive", "Constructive", "Unconstructive", 
    "Relatively constructive", "Relatively constructive", 
    "Constructive", "Constructive", "Relatively constructive", 
    "Unconstructive", "Unconstructive", "Relatively constructive", 
    "Constructive", "Relatively constructive", "Constructive", 
    "Unconstructive", "Constructive", "Relatively constructive", 
    "Constructive", "Unconstructive", "Relatively constructive", 
    "Unconstructive", "Constructive", "Relatively constructive", 
    "Unconstructive", "Constructive", "Relatively constructive"
  )
)

data_MDICS_coping_characteristics$Cognitive_sphere = c(
  "Constructive", "Constructive", "Relatively constructive", 
  "Unconstructive", "Unconstructive", "Relatively constructive", 
  "Relatively constructive", "Constructive", "Relatively constructive", 
  "Constructive", "Constructive", "Unconstructive", 
  "Unconstructive", "Unconstructive", "Relatively constructive", 
  "Constructive", "Constructive", "Constructive", 
  "Constructive", "Relatively constructive", "Unconstructive", 
  "Constructive", "Constructive", "Constructive", 
  "Constructive", "Constructive", "Constructive", 
  "Unconstructive", "Constructive", "Relatively constructive",
  "Relatively constructive", "Unconstructive"
)

data_MDICS_coping_characteristics$Emotional_sphere = c(
  "Unconstructive", "Relatively constructive", "Unconstructive", 
  "Unconstructive", "Relatively constructive", "Relatively constructive", 
  "Constructive", "Constructive", "Unconstructive", 
  "Relatively constructive", "Constructive", "Unconstructive", 
  "Constructive", "Constructive", "Constructive", 
  "Unconstructive", "Constructive", "Relatively constructive", 
  "Constructive", "Unconstructive", "Unconstructive", 
  "Unconstructive", "Unconstructive", "Constructive", 
  "Constructive", "Constructive", "Constructive", 
  "Unconstructive", "Constructive", "Constructive",
  "Constructive", "Relatively constructive"
)

#View(data_MDICS_coping_characteristics)

create_rus <- function() {
  
  data_MDICS_coping_characteristics_rus <- data.frame(
    Behavioral_sphere = c(
      "Относительно конструктивный", "Конструктивный", "Неконструктивный", 
      "Неконструктивный", "Конструктивный", "Относительно конструктивный", 
      "Неконструктивный", "Конструктивный", "Неконструктивный", 
      "Относительно конструктивный", "Относительно конструктивный", 
      "Конструктивный", "Конструктивный", "Относительно конструктивный", 
      "Неконструктивный", "Неконструктивный", "Относительно конструктивный", 
      "Конструктивный", "Относительно конструктивный", "Конструктивный", 
      "Неконструктивный", "Конструктивный", "Относительно конструктивный", 
      "Конструктивный", "Неконструктивный", "Относительно конструктивный", 
      "Неконструктивный", "Конструктивный", "Относительно конструктивный", 
      "Неконструктивный", "Конструктивный", "Относительно конструктивный"
    )
  )
  
  data_MDICS_coping_characteristics$Cognitive_sphere_rus = c(
    "Конструктивный", "Конструктивный", "Относительно конструктивный", 
    "Неконструктивный", "Неконструктивный", "Относительно конструктивный", 
    "Относительно конструктивный", "Конструктивный", "Относительно конструктивный", 
    "Конструктивный", "Конструктивный", "Неконструктивный", 
    "Неконструктивный", "Неконструктивный", "Относительно конструктивный", 
    "Конструктивный", "Конструктивный", "Конструктивный", 
    "Конструктивный", "Относительно конструктивный", "Неконструктивный", 
    "Конструктивный", "Конструктивный", "Конструктивный", 
    "Конструктивный", "Конструктивный", "Конструктивный", 
    "Неконструктивный", "Конструктивный", "Относительно конструктивный",
    "Относительно конструктивный", "Неконструктивный"
  )
  
  data_MDICS_coping_characteristics$Emotional_sphere_rus = c(
    "Неконструктивный", "Относительно конструктивный", "Неконструктивный", 
    "Неконструктивный", "Относительно конструктивный", "Относительно конструктивный", 
    "Конструктивный", "Конструктивный", "Неконструктивный", 
    "Относительно конструктивный", "Конструктивный", "Неконструктивный", 
    "Конструктивный", "Конструктивный", "Конструктивный", 
    "Неконструктивный", "Конструктивный", "Относительно конструктивный", 
    "Конструктивный", "Неконструктивный", "Неконструктивный", 
    "Неконструктивный", "Неконструктивный", "Конструктивный", 
    "Конструктивный", "Конструктивный", "Конструктивный", 
    "Неконструктивный", "Конструктивный", "Конструктивный",
    "Конструктивный", "Относительно конструктивный"
  )
}


