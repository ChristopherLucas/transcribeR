writeTranscribedText <- function(retrieved.text, file.name){
    # This function shouldn't exist. It exists because the
    # output needs to be able to go back into retrieveText
    # if some of the files are still in the queue, however
    # it's unnecessarily redundant. 
    #    
    # Args:
    #   retrieved.text: a data frame from retrieveText()
    #   file.name: filename for the output csv
    #    
    # Returns:
    #   original string with tags removed
    write.csv(retrieved.text, file.name, row.names = FALSE)
}
