retrieveText <- function(job.file, api.key) {
    # Function to retrieve asynchronous 
    #    
    # Args:
    #   job.file:
    #   api.key
    #    
    # Returns:
    #   Nothing
    jobs <- read.csv(job.file)
    job.IDs <- jobs$jobIDs
    transcribed.text <- c()
    for(ID in job.IDs){
        result <- getRequestResults(ID, callkey = api.key)
        transcribed.text <- c(transcribed.text, result)
    }
    jobs$transcribed.text <- transcribed.text
    return(jobs)
}
