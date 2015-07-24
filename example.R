library(devtools)
install_github('ChristopherLucas/transcribeR/package')
library(transcribeR)

printLanguages()

sendAudioGetJobs(wav.dir = "/Users/shivsunil/Desktop/Harvard_Research/transcribeR_testing/",
                 api.key = API_KEY, interval = "-1",
                 encode = "multipart", existing.csv = "/Users/shivsunil/Desktop/Harvard_Research/transcribeR_testing/test_jobs.csv",
                 csv.location = "/Users/shivsunil/Desktop/Harvard_Research/transcribeR_testing/test_jobs.csv",
                 language = "en-US", verbose = FALSE)


retrieveText(job.file = "/Users/shivsunil/Desktop/Harvard_Research/transcribeR_testing/test_jobs.csv",
               api.key = API_KEY)

print("Done!")