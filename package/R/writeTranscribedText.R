writeTranscribedText <- function(retrieved.text, file.name){
    write.csv(retrieved.text, file.name, row.names = FALSE)
}
