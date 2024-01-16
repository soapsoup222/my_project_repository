library(tidyverse)
library(readxl)

datafile_1 <- read_excel("datafiles/datafile_1.xlsx")
datafile_2 <- read_excel("datafiles/datafile_2.xlsx")
datafile_3 <- read_excel("datafiles/datafile_3.xlsx")
datafile_4 <- read_excel("datafiles/datafile_4.xlsx")
datafile_5 <- read_excel("datafiles/datafile_5.xlsx")
datafile_6<- read_excel("datafiles/datafile_6.xlsx")
datafile_7 <- read_excel("datafiles/datafile_7.xlsx")
datafile_8 <- read_excel("datafiles/datafile_8.xlsx")
datafile_9 <- read_excel("datafiles/datafile_9.xlsx")
datafile_10 <- read_excel("datafiles/datafile_10.xlsx")
datafile_11 <- read_excel("datafiles/datafile_11.xlsx")

data_combined <- datafile_1 |> 
  full_join(datafile_2, by="Individual ID") |> 
  full_join(datafile_3, by="Individual ID") |> 
  full_join(datafile_4, by="Individual ID") |> 
  full_join(datafile_5, by="Individual ID") |> 
  full_join(datafile_6, by="Individual ID") |> 
  full_join(datafile_7, by="Individual ID") |>
  full_join(datafile_8, by="Individual ID") |> 
  full_join(datafile_9, by="Individual ID") |> 
  full_join(datafile_10, by="Individual ID") |> 
  full_join(datafile_11, by="Individual ID")

transposed_data <- data_combined |> t()  


#Other way
get_observation <- function(filename) {
  datafile <- read_excel(filename)
  transformed <- as.data.frame((t(datafile)))
  observation <- transformed[2, ]
}

files <- list.files(path = "datafiles", full.names=TRUE)

cleaned <- data.frame()
for (file in files) {
  row <- get_observation(file)
  cleaned <- rbind(cleaned, row)
}

write.csv(cleaned, 
          "datafiles/clean.csv")



