\name{sendAudioGetJobs}
\alias{sendAudioGetJobs}
\title{
Posts to HP IDOL OnDemand Speech Recognition API and Store the Resulting Job ID
}
\description{
Main user function to POST to HP IDOL OnDemand Speech Recognition API and write Job ID to a transcribeR CSV, a filename. It posts all compatible files in the provided directory. It avoids posting any file that has already been posted according to the transcribeR CSV.
}
\usage{
sendAudioGetJobs(wav.dir, api.key, interval = "-1",
                 encode = "multipart", existing.csv = NULL, csv.location,
                 language = "en-US", verbose = FALSE)
}
\arguments{
  	\item{wav.dir}{
  		the directory in which the WAV files of interest are located
  }
    \item{api.key}{
    	the API Key used to authenticate requests to HP IDOL OnDemand; one can be obtained from making an account on HP IDOL OnDemand's website https://www.idolondemand.com/
  }
    \item{interval}{
    	optional argument; specifies segmentation length for transcripts in milliseconds; -1 indicates no segmentation and 0 indicates segmentation by words; default is "-1"
  }
    \item{encode}{
    	optional argument; passed directly to \code{POST} in the \code{httr} package; defaults to "multipart"
  }
    \item{existing.csv}{
    	optional argument; specifies CSV to post; defaults to NULL
  }
    \item{csv.location}{
    	output tag for CSV file
  }
    \item{language}{
    	optional argument; provides language code for HP IDOL OnDemand's Speech Recognition API; defaults to "en-US"
  }
    \item{verbose}{
    	optional argument; if TRUE, prints out messages indicating the percentage of audio files posted to HP to the console
  }
}
\details{
When two files share the same basename but are different file formats, only one of the files will be posted to the Speech Recognition API because after the first file is posted, the basename is logged into the transcribeR CSV. Hence, all subsequent files with the same basename will not be posted. The first file that is posted is system-dependent because the ordering of filepaths is system-dependent. Functionally, however, this still avoids redundancy in posting files to the API.
}
\examples{
\dontrun{
## Reads files from the specified directory and creates a new CSV at the specified path

fnames <- c('boxer.wav', 'merkley.wav') # Example with 2 files
urls <- paste("http://christopherlucas.org/transcribeR/", fnames, sep = '')
lapply(urls, function(x) download.file(x, destfile = basename(x), mode = 'wb'))

WAV_DIR <- getwd()

sendAudioGetJobs(wav.dir = WAV_DIR,
                 API_KEY",
                 csv.location = CSV_LOCATION)
}
}
