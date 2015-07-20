appendToCSV <- function(file.name, row.frame, append = TRUE, sep=",", row.names=FALSE, col.names=FALSE) {
  if (file.exists(file.name) == FALSE) {
    warning("The file was not found or path was wrong, \"file.name=" + file.name + "\"")
    return(FALSE)
  }
  write.table(row.frame, 
              file = file.name,
              append=append,
              sep=sep, row.names=row.names, 
              col.names = col.names)
  return(TRUE)
}