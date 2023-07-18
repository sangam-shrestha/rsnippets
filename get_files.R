#this function will return the files with the extension provided as a data frame
#input will be the file path and the pattern to follow
#output is a data frame with 2 columns
#written by Sangam Shrestha on 7-18-2023 - v1 - initial version

#example of this running would be:
#result <- getfiles("C:/Users/user.name/Documents/", ".xlsx")

getfiles <- function(file_path, pat){
  tmp1 <- as.data.frame(list.files(path = file_path, pattern = pat, full.names = T, all.files = T))
  tmp1 = as.data.frame(tmp1[-1,])
  colnames(tmp1)[1] = "file_with_path"
  
  tmp2 <- as.data.frame(list.files(path = file_path, pattern = pat, full.names = F, all.files = T))
  tmp2 <- as.data.frame(tmp2[-1,])
  colnames(tmp2)[1] = "file_with_extension"
  
  tmp3 <- cbind(tmp1, tmp2)
  
  return(tmp3)
}
