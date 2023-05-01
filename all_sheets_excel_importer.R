#creates a function that can be called to imports all sheets in an excel file
#written by Sangam Shrestha
#May 1st, 2023

#get the packages loaded
library(readxl)
library(dplyr)
library(purrr)

allsheets <- function(file) {
  sheets <- readxl::excel_sheets(file) #read the excel sheet names
  x <- lapply(sheets, function(X) readxl::read_excel(file, sheet = X) #pull the data from the individual sheets into a list, x
  x <- lapply(x, as.data.frame) #convert the list into a data frame list
  names(x) <- sheets #name each data.frame within the list with the sheet names
  return(x) #output final data.frame list
}
