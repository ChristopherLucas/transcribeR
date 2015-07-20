retrieveText <- function(job.file, api.key) {
    # Function to retrieve asynchronous 
    #    
    # Args:
    #   job.file: job.file created from sendAudio()
    #   api.key: api key for HP IDOL API
    #    
    # Returns:
    #   Nothing    
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
        result <- getRequestResults(ID, api.key = api.key)
        transcribed.text <- c(transcribed.text, result)
    }
    # add to original dataframe. if dataframe has been
    # through retrieveText(), replace appropriate cells.
    # Else, create new column.

    jobs$TRANSCRIPT<- transcribed.text
    
    return(jobs)
}
