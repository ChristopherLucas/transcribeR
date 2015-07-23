library(devtools)
install_github('ChristopherLucas/transcribeR/package')

transcribeR::printLanguages()

transcribeR::sendAudioGetJobs(wav.dir = "/Users/shivsunil/Desktop/Harvard_Research/transcribeR_testing/",
                 api.key = "d7d3d57d-22f9-4c04-8dc1-daaea492d5ce", interval = "-1",
                 encode = "multipart", existing.csv = NULL,
                 csv.location = "/Users/shivsunil/Desktop/Harvard_Research/transcribeR_testing/test_jobs.csv",
                 language = "en-US", verbose = FALSE)

Sys.sleep(10)

transcribeR::retrieveText.R(job.file = "/Users/shivsunil/Desktop/Harvard_Research/transcribeR_testing/test_jobs.csv",
               api.key = "d7d3d57d-22f9-4c04-8dc1-daaea492d5ce")

print("Done!")