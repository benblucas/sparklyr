% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/stream_data.R
\name{stream_write_memory}
\alias{stream_write_memory}
\title{Write Memory Stream}
\usage{
stream_write_memory(x, name = random_string("sparklyr_tmp_"),
  mode = c("append", "complete", "update"),
  trigger = stream_trigger_interval(),
  checkpoint = file.path("checkpoints", name, random_string("")),
  options = list(), ...)
}
\arguments{
\item{x}{A Spark DataFrame or dplyr operation}

\item{name}{The name to assign to the newly generated stream.}

\item{mode}{Specifies how data is written to a streaming sink. Valid values are
\code{"append"}, \code{"complete"} or \code{"update"}.}

\item{trigger}{The trigger for the stream query, defaults to micro-batches runnnig
every 5 seconds. See \code{\link{stream_trigger_interval}} and
\code{\link{stream_trigger_continuous}}.}

\item{checkpoint}{The location where the system will write all the checkpoint
information to guarantee end-to-end fault-tolerance.}

\item{options}{A list of strings with additional options.}

\item{...}{Optional arguments; currently unused.}
}
\description{
Writes a Spark dataframe stream into a memory stream.
}
\examples{
\dontrun{

sc <- spark_connect(master = "local")

dir.create("csv-in")
write.csv(iris, "csv-in/data.csv", row.names = FALSE)

csv_path <- file.path("file://", getwd(), "csv-in")

stream <- stream_read_csv(sc, csv_path) \%>\% stream_write_memory("csv-out")

stream_stop(stream)

}

}
\seealso{
Other Spark stream serialization: \code{\link{stream_read_csv}},
  \code{\link{stream_read_json}},
  \code{\link{stream_read_kafka}},
  \code{\link{stream_read_orc}},
  \code{\link{stream_read_parquet}},
  \code{\link{stream_read_scoket}},
  \code{\link{stream_read_text}},
  \code{\link{stream_write_console}},
  \code{\link{stream_write_csv}},
  \code{\link{stream_write_json}},
  \code{\link{stream_write_kafka}},
  \code{\link{stream_write_orc}},
  \code{\link{stream_write_parquet}},
  \code{\link{stream_write_text}}
}
\concept{Spark stream serialization}
