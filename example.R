library(devtools)
install_github('ChristopherLucas/transcribeR/package')
library(transcribeR)
install.packages("BBmisc")
library(BBmisc)

printLanguages()

sendAudioGetJobs(wav.dir = WAV_DIR,
                 api.key = API_KEY, interval = "-1",
                 encode = "multipart", existing.csv = NULL,
                 csv.location = CSV_LOCATION,
                 language = "en-US", verbose = FALSE)


retrieveText(job.file = CSV_LOCATION,
               api.key = API_KEY)

print("Done!")
Sys.sleep(1)
print("But wait! There's more!")

# existing.csv changes
sendAudioGetJobs(wav.dir = WAV_DIR,
                 api.key = API_KEY, interval = "-1",
                 encode = "multipart", existing.csv = CSV_LOCATION,
                 csv.location = CSV_LOCATION,
                 language = "en-US", verbose = FALSE)


retrieveText(job.file = CSV_LOCATION,
             api.key = API_KEY)

print("Now done!")