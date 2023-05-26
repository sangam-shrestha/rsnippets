#create

library(haven)

zipcoder <- function(selected_state){

  #download the temp zip
  temp <- tempfile()
  download.file("http://download.geonames.org/export/zip/US.zip",temp)
  con <- unz(temp, "US.txt") #unzip the file
  
  #read the data in
  US <- read.delim(con, header=FALSE)
  unlink(temp) #unlink and remove the temp zip
  
  #rename the columns in the data
  colnames(US)[c(2,3,5,6,7)] <- c("zip","city","state","county_name","county")
  US$city <- toupper(US$city)
  US$state <- toupper(US$state)
  US$county_name <- toupper(US$county_name)
  
  #select only states with the same state
  zipcodes <- subset(US, state == selected_state)
  
}

#example of how to use the function
#set the state we are interested in
zipcodes2 <- zipcoder("NM")
