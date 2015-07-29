fnames <- c('boxer.wav', 'merkley.wav')
urls <- paste("http://christopherlucas.org/transcribeR/", fnames, sep = '')
lapply(urls, function(x) download.file(x, destfile = basename(x)))

WAV_DIR <- getwd()

library(transcribeR)

print("First, printing language codes.")

printLanguages()

print("Now posting requests to HP IDOL OnDemand's Speech Recognition API.")

sendAudioGetJobs(wav.dir = WAV_DIR,
                 api.key = API_KEY,
                 interval = "-1",             # Transcript will not be segmented
                 encode = "multipart",
                 existing.csv = NULL,         # Intended to create a new CSV
                 csv.location = CSV_LOCATION,
                 language = "en-US",          # As printed above, one of the language codes
                 verbose = TRUE)              # Prints out uploading progress to the user

Sys.sleep(1)

print("Waiting before requesting transcriptions.")

Sys.sleep(20) # Adequate delay to allow the Speech Recognition API to compute the most probable transcription.

retrieveText(job.file = CSV_LOCATION,
             api.key = API_KEY)

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

Sys.sleep(20) # Adequate delay to allow the Speech Recognition API to compute the most probable transcription.

retrieveText(job.file = CSV_LOCATION,
             api.key = API_KEY)

print("Done!")
