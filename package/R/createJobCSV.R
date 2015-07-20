createJobCSV <- function(file.name, overwrite=FALSE, append=FALSE, sep=",",row.names=FALSE, col.names=FALSE) {
  if (file.exists(file.name) == TRUE && overwrite == FALSE) {
    warning("The file already exists, and \"overwrite=FALSE\"")
    return(FALSE)
  }
  ex.df = data.frame()
  ex.v = c(1:6)
  ex.v[1] <- "DATE"
  ex.v[2] <- "APIKEY"
  ex.v[3] <- "FILENAME"
  ex.v[4] <- "LANGUAGE"
  ex.v[5] <- "JOBID"
  ex.v[6] <- "TRANSCRIPT"
  ex.df <- rbind(ex.df,ex.v)
  write.table(ex.df,
              file = file.name, 
              append=append, sep=sep, 
              row.names=row.names, 
              col.names = col.names)
  return(TRUE)
}