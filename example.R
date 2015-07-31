fnames <- c('boxer.wav', 'merkley.wav') # Example with 2 files
urls <- paste("http://christopherlucas.org/transcribeR/", fnames, sep = '')
lapply(urls, function(x) download.file(x, destfile = basename(x), mode = "wb"))

WAV_DIR <- getwd()

library(transcribeR)

print("First, printing language codes.")

printLanguages()

Sys.sleep(3)

print("Now posting requests to HP IDOL OnDemand's Speech Recognition API.")

sendAudioGetJobs(wav.dir = WAV_DIR,
                 api.key = API_KEY,
                 interval = "-1",             # Transcript will not be segmented
                 encode = "multipart",
                 existing.csv = NULL,         # Intended to create a new CSV
                 csv.location = CSV_LOCATION,
                 language = "en-US",          # As printed above, one of the language codes
                 verbose = TRUE)              # Prints out uploading progress to the user

Sys.sleep(3)

print("Waiting before requesting transcriptions.")

Sys.sleep(20) # Adequate delay to allow the Speech Recognition API to compute the most probable transcription.

retrieveText(job.file = CSV_LOCATION,
             api.key = API_KEY)

print("Transcripts were requested.")

print("What if another file is added to the directory?") # Runs again with a newly added file

Sys.sleep(3)

url <- "http://christopherlucas.org/transcribeR/warren.wav"
download.file(url, destfile = basename(url))
WAV_DIR <- getwd()

sendAudioGetJobs(wav.dir = WAV_DIR,
                 api.key = API_KEY,
                 interval = "-1",             # Transcript will not be segmented
                 encode = "multipart",
                 existing.csv = CSV_LOCATION,         # Intended to create a new CSV
                 csv.location = CSV_LOCATION,
                 language = "en-US",          # As printed above, one of the language codes
                 verbose = TRUE)              # Prints out uploading progress to the user

Sys.sleep(3)

print("Waiting before requesting transcriptions.")

Sys.sleep(10) # Adequate delay to allow the Speech Recognition API to compute the most probable transcription.

retrieveText(job.file = CSV_LOCATION,
             api.key = API_KEY)

print("Transcripts were requested.")

print("Done!")
