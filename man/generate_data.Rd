% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/generate_data.R
\name{generate_data}
\alias{generate_data}
\title{Generate a fake data set based on information about the variables in the model}
\usage{
generate_data(data, obs = 1000)
}
\arguments{
\item{data}{Data input containing values for each of the associated parameters for multiple observations}

\item{obs}{(numeric) Number of samples to draw for bootstrapping procedure}
}
\value{
Data frame that can be passed to the data function in snap() or resampled in the samp_data() function
}
\description{
Generate a fake data set based on information about the variables in the model
}
\examples{
{
fake_data <- generate_data(input_data, obs = 10000)
fake_data$fire_frequency <- rep(0,nrow(fake_data))
}
}
