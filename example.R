fnames <- c('boxer.wav', 'merkley.wav', 'warren.wav')
urls <- paste("http://christopherlucas.org/transcribeR/", fnames, sep = '')
lapply(urls, function(x) download.file(x, destfile = basename(x)))

wav.dir <- getwd()

library(transcribeR)

print("First, printing language codes.")

printLanguages()

print("Now posting requests to HP IDOL OnDemand's Speech Recognition API.")

sendAudioGetJobs(wav.dir = WAV_DIR,
                 api.key = API_KEY, interval = "-1",
                 encode = "multipart", existing.csv = NULL,
                 csv.location = CSV_LOCATION,
                 language = "en-US", verbose = TRUE)

print("Waiting before requesting transcriptions.")

Sys.sleep(20) # Adequate delay to allow the Speech Recognition API to compute the most probable transcription.

retrieveText(job.file = CSV_LOCATION,
               api.key = API_KEY)

print("Done!")