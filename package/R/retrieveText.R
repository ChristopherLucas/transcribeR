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
    if('transcribed.text' %in% colnames(jobs)){        
        untranscribed.inds <- which(jobs$transcribed.text == 'queued')
        job.IDs <- jobs$jobIDs[untranscribed.inds]
    } else {
        job.IDs <- jobs$jobIDs
    }
    transcribed.text <- c()
    for(ID in job.IDs){
        result <- getRequestResults(ID, api.key = api.key)
        transcribed.text <- c(transcribed.text, result)        
    }
    if('transcribed.text' %in% colnames(jobs)){
        jobs$transcribed.text[untranscribed.inds] <- transcribed.text
    } else {
        jobs$transcribed.text <- transcribed.text
    }    
    return(jobs)
}
