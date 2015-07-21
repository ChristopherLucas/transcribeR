\name{cleanFun}
\alias{cleanFun}
\title{
Removes Tags from String
}
\description{
Internal function to strip tags from string. Returns original string with tags removed.
}
\usage{
	cleanFun(string)
}
\details{
	Transcripts from HP IDOL OnDemand's Speech Recognition API often has tags represented by the regular expression "<.*>", and these tags do not reflect the spoken speech in the file. Hence, this function is meant to remove such tags from transcripts.
}
\arguments{
  \item{string}{
  	the string that will be stripped of its tags
  }
}
\examples{
## Outputs "Hello, world!"
cleanFun("Hello,<NOISE> world!")
}
