\name{retrieveText}
\alias{retrieveText}
\title{
Gets Text From Returned JSON Object
}
\description{
Gets asynchronous call results from jobs previously posted to HP IDOL OnDemand's Speech Recognition API. Calls \code{getRequestResults} to extract the transcription from the JSON object. Returns a dataframe which was used to update a \code{transcribeR} CSV file.
}
\usage{
retrieveText(job.file, api.key)
}
\arguments{
  \item{job.file}{
  	the CSV file that \code{retrieveText} checks to determine the indices that need transcriptions and then updates
  }
  \item{api.key}{
     	the API Key used to authenticate requests to HP IDOL OnDemand; one can be obtained from making an account on HP IDOL OnDemand's website https://www.idolondemand.com/
  }
}
\examples{
\dontrun{
## Adds transcripts to a transcribeR CSV


retrieveText(CSV_LOCATION, API_KEY)
}
}
