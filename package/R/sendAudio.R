sendAudio <- function(wav.file, api.key, interval = "-1",
                      encode = "multipart", asynchronous = TRUE) {
    # Main user function to POST to HP IDOL Speech Recognition
    # API.
    #    
    # Args:
    #   wav.file:
    #   api.key: 
    #   interval:
    #   encode:
    #    
    # Returns:
    #   Nothing
    if(asynchronous){
        url <- "https://api.idolondemand.com/1/api/async/recognizespeech/v1"
    }else{
        url <- "https://api.idolondemand.com/1/api/sync/recognizespeech/v1"
    }
    attempt <- POST(
        url,
        body = list(
            file = upload_file(wav.file),
            apikey = api.key
            ),
        encode = encode,
        verbose())
    stop_for_status(attempt)
    out <- content(attempt)
    return(out)
