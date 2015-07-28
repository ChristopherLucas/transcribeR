fnames <- c('boxer.wav', 'merkley.wav', 'warren.wav')
urls <- paste("http://christopherlucas.org/transcribeR/", fnames, sep = '')
lapply(urls, function(x) download.file(x, destfile = basename(x)))

library(devtools)
install_github('ChristopherLucas/transcribeR/package')

wav.dir <- getwd()

library(transcribeR)

print("First, printing language codes.")

printLanguages()

print("Now posting requests to HP IDOL OnDemand's Speech Recognition API.")

num.files.uploaded <- sendAudioGetJobs(wav.dir = wav.dir,
                                       api.key = API_KEY,
                                       interval = "-1",             # Transcript will not be segmented
                                       encode = "multipart",
                                       existing.csv = NULL,         # Intended to create a new CSV
                                       csv.location = CSV_LOCATION,
                                       language = "en-US",          # As printed above, one of the language codes
                                       verbose = TRUE)              # Prints out uploading progress to the user

print(paste("The number of files uploaded was",num.files.uploaded))

Sys.sleep(1)

print("Waiting before requesting transcriptions.")

Sys.sleep(20) # Adequate delay to allow the Speech Recognition API to compute the most probable transcription.

retrieveText(job.file = CSV_LOCATION,
             api.key = API_KEY)

num.files.uploaded = sendAudioGetJobs(wav.dir = wav.dir,
                                      api.key = API_KEY,
                                      interval = "-1",             # Transcript will not be segmented
                                      encode = "multipart",
                                      existing.csv = CSV_LOCATION,         # Intended to create a new CSV
                                      csv.location = CSV_LOCATION,
                                      language = "en-US",          # As printed above, one of the language codes
                                      verbose = TRUE)              # Prints out uploading progress to the user

print(paste("The number of files uploaded this time was",num.files.uploaded))

print("Waiting again before requesting transcriptions.")

Sys.sleep(20) # Adequate delay to allow the Speech Recognition API to compute the most probable transcription.

retrieveText(job.file = CSV_LOCATION,
             api.key = API_KEY)

print("Done!")
