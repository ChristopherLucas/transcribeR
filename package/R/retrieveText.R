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
    if('transcribed.text' %in% colnames(jobs)){
        jobs$transcribed.text <- as.character(jobs$transcribed.text)
        untranscribed.inds <- which(jobs$transcribed.text == 'queued')
        job.IDs <- jobs$jobIDs[untranscribed.inds] # IDs in queue at last call
    } else {
        job.IDs <- jobs$jobIDs
    }
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
    if('transcribed.text' %in% colnames(jobs)){
        jobs[untranscribed.inds,which(colnames(jobs) == 'transcribed.text')] <- transcribed.text
    } else {
        jobs$transcribed.text <- transcribed.text
    }    
    return(jobs)
}
