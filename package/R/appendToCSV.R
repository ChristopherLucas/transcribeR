appendToCSV <- function(existing.csv, row.frame, append = TRUE, sep=",", row.names=FALSE, col.names=FALSE) {
  if (existing.csv == NULL || file.exists(existing.csv) == FALSE) {
    warning("The file was not found or path was wrong, \"file.name=" + file.name + "\"")
    return(FALSE)
  }
  write.table(row.frame, 
              file = existing.csv,
              append=append,
              sep=sep, row.names=row.names, 
              col.names = col.names)
  return(TRUE)
}