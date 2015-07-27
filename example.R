library(devtools)
install_github('ChristopherLucas/transcribeR/package')
library(transcribeR)


printLanguages()

sendAudioGetJobs(wav.dir = WAV_DIR,
                 api.key = API_KEY, interval = "-1",
                 encode = "multipart", existing.csv = NULL,
                 csv.location = CSV_LOCATION,
                 language = "en-US", verbose = TRUE)

Sys.sleep(20)

retrieveText(job.file = CSV_LOCATION,
               api.key = API_KEY)

print("Now done!")