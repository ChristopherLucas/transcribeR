getRequestResults <- function(jobId, api.key){
    # Internal function to get results based on single job IDs
    #    
    # Args:
    #   jobID:
    #    
    #    
    # Returns:
    #   Nothing
    hpidolurl.result <- "http://api.idolondemand.com/1/job/result/"
    get.url <- paste( hpidolurl.result, jobId, "?apikey=", api.key, sep = "")
    call.results = readLines(get.url, n = -1L, ok = TRUE, warn = FALSE)
    return(call.results)
}
