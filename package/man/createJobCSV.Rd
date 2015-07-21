\name{createJobCSV}
\alias{createJobCSV}
\title{
Creates a New CSV to be Used with TranscribeR
}
\description{
\code{transcribeR} only accepts certain CSVs which have specified column names, and this function creates one if no existing CSV is referenced; returns \code{TRUE} if a new CSV is created
}
\usage{
createJobCSV(existing.csv, csv.location, overwrite=FALSE, append=FALSE, sep=",",row.names=FALSE, col.names=FALSE)
}
\arguments{
  \item{existing.csv}{
  	  	CSV to which the data frame is appended; if it doesn't exist or is \code{NULL}, causes \code{appendToCSV} to issue a warning message and return \code{FALSE}
  }
  \item{csv.location}{
  	the output filepath of the new CSV
  }
  \item{append}{
  	optional argument; passed to the \code{write.table} function; default is \code{TRUE}
  }
  \item{sep}{
  	optional argument; passed to the \code{write.table} function; default is \code{","}
  }
  \item{row.names}{
  	optional argument; passed to the \code{write.table} function; default is \code{FALSE}
  }
  \item{col.names}{
  	optional argument; passed to the \code{write.table} function; default is \code{FALSE}
  }
}
\seealso{
	\code{\link{write.table}}
	\code{\link{appendToCSV}}
}
\examples{
## Creates a new transcribeR CSV
createJobCSV(existing.csv = NULL, csv.location = "/home/Desktop/my_transcribeR_csv.csv")
}
