sendAudio <- function(wav.dir, api.key, interval = "-1",
                      encode = "multipart", job.file,
                      language = "en-US"){
    # Main user function to POST to HP IDOL Speech Recognition
    # API and write jobs to job.file (a filename)
    #    
    # Args:
    #   wav.dir: Directory that contains wav files. Will
    #            only try to upload wav files in dir.
    #   api.key: API key for the HP IDOL API.
    #   interval: HP API arg.
    #   encode: HP API arg.
    #   job.file: CSV file where jobs.csv will be written.
    #   language: HP API arg.
    #    
    # Returns:
    #   Message indicating success, automatically writes jobs
    #   csv to file.
    # Improve this - error messages should collect and return
    # errors in an R-readable way
    error.messages <- NULL
    url <- "https://api.idolondemand.com/1/api/async/recognizespeech/v1"
    # get all files in wav directory
    wav.dir <- gsub('/?$', '/', wav.dir) # add trailing '/' if missing
    wav.filenames <- Sys.glob(paste(wav.dir,'*.wav', sep = ''))
    # holder for content
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
    if(file.exists(job.file)){ # if the file has already been through, append new rows
        existing.job.csv <- read.csv(job.file)
        if(any(colnames(existing.job.csv) != c("NAMES","jobIDs","lang"))){
            stop("This doesn't appear to be a transcribeR jobs.csv, please provide another filename")
        }
        NAMES <- names(out.list)
        jobIDs <- unname(unlist(lapply(out.list, function(x) x[['jobID']])))
        lang <- rep(language, length(out.list))
        df <- data.frame(NAMES, jobIDs, lang, stringsAsFactors=FALSE)
        df <- rbind(existing.job.csv, df)
        write.csv(df, job.file, row.names = FALSE)
    } else { # else create a new file
        NAMES <- names(out.list)
        jobIDs <- unname(unlist(lapply(out.list, function(x) x[['jobID']])))
        lang <- rep(language, length(out.list))
        df <- data.frame(NAMES, jobIDs, lang, stringsAsFactors=FALSE)
        write.csv(df, job.file, row.names = FALSE)
    }
    if(is.null(error.messages)){ #this needs to be WAY better
        print(paste("Jobs successfully uploaded,", "'job.file' written to", job.file))
    }
}
