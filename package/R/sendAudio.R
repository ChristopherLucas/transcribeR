sendAudio <- function(wav.dir, api.key, interval = "-1",
                      encode = "multipart", job.file,
                      language = "en-US"){
    # Main user function to POST to HP IDOL Speech Recognition
    # API and write jobs to job.file (a filename)
    #    
    # Args:
    #   wav.file:
    #   api.key: 
    #   interval:
    #   encode:
    #    
    # Returns:
    #   Nothing
    url <- "https://api.idolondemand.com/1/api/async/recognizespeech/v1"
    wav.dir <- gsub('/?$', '/', wav.dir) # add trailing '/' if missing
    wav.filenames <- Sys.glob(paste(wav.dir,'*.wav', sep = ''))
    out.list <- list()
    for(fn in wav.filenames){        
        attempt <- POST(
            url,
            body = list(
                file = upload_file(fn),
                apikey = api.key,
                language = language,
                interval = interval
                ),
            encode = encode)
        stop_for_status(attempt)
        name.in.list <- sub("(.*\\/)([^.]+)(\\.[[:alnum:]]+$)", "\\2", fn)
        out.list[[name.in.list]] <- content(attempt)
    }
    return(out.list)
}
