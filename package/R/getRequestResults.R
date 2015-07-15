getRequestResults <- function(jobId, api.key){
    # Internal function to get results based on single job IDs
    #    
    # Args:
    #   jobID:
    #    
    #    
    # Returns:
    #   Nothing
    url <- "http://api.idolondemand.com/1/job/result/"
    get.url <- paste(url, jobId, "?apikey=", api.key, sep = "")
    call.results = content(GET(get.url))
    out.text <- call.results$actions[[1]]$result[[1]][[1]][[1]]
    return(out.text)
}
