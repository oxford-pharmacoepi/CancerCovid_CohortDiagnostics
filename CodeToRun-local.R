
#install.packages("renv") # if not already installed, install renv from CRAN
renv::restore() # this should prompt you to install the various packages required for the study
renv::activate()

# packages -----
# load the below packages 
# you should have them all available, with the required version, after
# having run renv::restore above
library(DatabaseConnector)
library(CohortDiagnostics)
library(CirceR)
library(CohortGenerator)
library(here)
library(stringr)
library(tibble)
library(dplyr)

# database metadata and connection details -----
# The name/ acronym for the database
db.name<-"CPRDGold"

# database connection details
user        <-  Sys.getenv("DB_USER")
password    <-  Sys.getenv("DB_PASSWORD")
port        <-  Sys.getenv("DB_PORT") 
host        <-  Sys.getenv("DB_HOST") 
server_dbi  <-  Sys.getenv("DB_SERVER_DBI_cdmgold202007")
server      <-  Sys.getenv("DB_SERVER_cdmgold202007")

# driver for DatabaseConnector
downloadJdbcDrivers("postgresql", here()) # if you already have this you can omit and change pathToDriver below
connectionDetails <- createConnectionDetails(dbms = "postgresql",
                                             server =server,
                                             user = user,
                                             password = password,
                                             port = port ,
                                             pathToDriver = here())

# sql dialect used with the OHDSI SqlRender package
targetDialect <-"postgresql" 
# schema that contains the OMOP CDM with patient-level data
cdm_database_schema<-"public"
# schema that contains the vocabularie
vocabulary_database_schema<-cdm_database_schema
# schema where a results table will be created 
results_database_schema<-"results"

# stem for tables to be created in your results schema for this analysis
# You can keep the above names or change them
# Note, any existing tables in your results schema with the same name will be overwritten
cohortTableStem<-"CancerCovid"

# Run analysis ----
source(here("RunAnalysis.R"))

# Review results -----
CohortDiagnostics::preMergeDiagnosticsFiles(dataFolder = here("Results"))
CohortDiagnostics::launchDiagnosticsExplorer(dataFolder = here("Results"))
