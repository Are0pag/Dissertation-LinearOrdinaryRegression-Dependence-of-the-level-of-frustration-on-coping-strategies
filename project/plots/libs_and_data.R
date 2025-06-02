source("project/empirical_research_data/Rosenzweig_data.R")
source("project/empirical_research_data/Wasserman_data.R")
source("project/empirical_research_data/WCQ_data.R")
source("project/empirical_research_data/MDICS_data_сoping_strategies.R")
source("project/empirical_research_data/MDICS_data_coping_characteristics.R")

if(!require("plotly")) install.packages("plotly")
library(plotly)

if(!require("dplyr")) install.packages("dplyr")
library(dplyr)

if(!require("ggplot2")) install.packages("ggplot2")
library(ggplot2)

if(!require("lattice")) install.packages("lattice")
library(lattice)

if(!require("tidyr")) install.packages("tidyr")
library(tidyr)

if(!require("reshape2")) install.packages("reshape2")
library(reshape2)

