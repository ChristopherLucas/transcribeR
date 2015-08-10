retrieveText <- function(job.file, api.key) {
    # Function to retrieve asynchronous 
    #    
    # Args:
    #   job.file: job.file created from sendAudio()
    #   api.key: api key for HP IDOL API
    #    
    # Returns:
    #    
    jobs <- read.csv(job.file)
    # If jobs csv has already been through retrieveText,
    # it will have a 'transcribed.text' column. Get all
    # jobs since there is no significant additional API Key usage
    
    # try to transcribe all job.IDs 
    for(i in 1:nrow(jobs)){
        ID <- jobs$JOBID[i]
        text <- getRequestResults(ID, api.key = api.key)        
        jobs$TRANSCRIPT[i] <- text
    }
    write.csv(jobs, file = job.file, row.names = FALSE)
    return(jobs)
}
