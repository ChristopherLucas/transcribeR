retrieveAsync <- function(job.file, api.key) {
    # Function to retrieve asynchronous 
    #    
    # Args:
    #   job.file:
    #   api.key
    #    
    # Returns:
    #   Nothing
    job.IDs <- read.csv(job.file)$Ids
    transcribed.text <- c()
    for(ID in job.IDS){
        result <- getRequestResults(ID, callkey = api.key)
        transcribed.text <- c(transcribed.text, result)
    }
    return(list(job.IDs = job.IDs, transcribed.text))
}
