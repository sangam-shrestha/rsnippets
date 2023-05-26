#small and compact way to load and install packages
#all you have to do is tell it in the list what packages you want to load
#it will check if they are installed 
#it will install any missing packages
#it will then load the packages
#it is recommended to put this code in the beginning of your programs instead of putting multiple library or require functions so any new user can pick up your code and run it
#written by Sangam Shrestha

#define what packages you would like to load
#for this example, we are saying tidyverse, haven, and readr
pkgs <- c("tidyverse", "haven", "readr")

#check and install any missing packages
install.packages(setdiff(pkgs, rownames(installed.packages())))  

#load the packages
lapply(pkgs, library, character.only = T)

#clean up the environment
rm(pkgs)
