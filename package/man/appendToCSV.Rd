\name{appendToCSV}
\alias{appendToCSV}
\title{
Appends Data Frame to An Existing CSV
}
\description{
Specifically appends a data frame to an already existing CSV, and returns \code{TRUE} if it does so. If it fails to find the specified CSV, then it alerts the user and returns \code{FALSE}.
}
\usage{
appendToCSV(existing.csv, row.frame, append = TRUE, sep = ",", row.names = FALSE, col.names = FALSE)
}
\arguments{
  \item{existing.csv}{
  	CSV to which the data frame is appended; if it doesn't exist or is \code{NULL}, causes \code{appendToCSV} to issue a warning message and return \code{FALSE}
  }
  \item{row.frame}{
  	the data frame to append
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
	\code{\link{createJobCSV}}
}
\examples{
## Appends to an existing CSV
appendToCSV(existing.csv = "/home/Desktop/my_transcribeR_csv.csv", row.frame = df)
}
