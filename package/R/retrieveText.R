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
    # it will have a 'transcribed.text' column. Only get the
    # jobs that were in queue when last called.
    jobs$TRANSCRIPT <- as.character(jobs$TRANSCRIPT)
    untranscribed.inds <- which(jobs$TRANSCRIPT == 'queued' || jobs$TRANSCRIPT == '')
    job.IDs <- jobs$JOBID[untranscribed.inds] # IDs in queue at last call

    # holder vec for new transcriptions
    transcribed.text <- c()
    # try to transcribe all job.IDs
    for(ID in job.IDs){
        text <- getRequestResults(ID, api.key = api.key)
        jobs$TRANSCRIPT[ID] <- text
    }
    write.csv(jobs, file = job.file)
    return(jobs)
}
