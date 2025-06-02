if (!require("MASS")) install.packages("MASS")
library(MASS)
if (!require("car")) install.packages("car")
library(car)
if(!require("pscl")) install.packages("pscl")
library(pscl)
if(!require("brant")) install.packages("brant")
library(brant)

source("project/empirical_research_data/Rosenzweig_data.R")
source("project/empirical_research_data/MDICS_data_сoping_strategies.R")
source("project/empirical_research_data/MDICS_data_coping_characteristics.R")

source("project/tools/data_adapters/lump_min.R")