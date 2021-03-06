% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/wide.R
\name{wide}
\alias{wide}
\alias{skim_to_wide}
\alias{skim_to_list}
\title{Working with \code{skimr}'s printed output}
\usage{
skim_to_wide(x, ...)

skim_to_list(x, ...)
}
\arguments{
\item{x}{A data frame.}

\item{...}{Further arguments passed to or from other methods.}
}
\value{
A wide data frame or a list of wide data frames.
}
\description{
These functions provide two approaches for handling the wide format produced
when you print \code{skim_df}. \code{skim_to_wide()} returns a wide data frame with one
row per variable and \code{NA} for statistics not calculated for a given type.
\code{skim_to_list()} creates a list of wide tibbles, one for each type of vector
within your data frame.
}
\details{
Note that in both cases, all columns are character vectors. This gives you
additional control of the printed output, but not the original data.
}
\examples{
# Treat the printed output as a wide data frame
skim_to_wide(iris)
iris \%>\% skim_to_wide()
iris \%>\%
  skim_to_wide() \%>\%
  dplyr::filter(type == "factor") \%>\% 
  dplyr::select(top_counts)

# Treat the printed output as a list of data frames
skim_to_list(iris)
iris \%>\% skim_to_list()

# Save the result
sl <- iris \%>\% skim_to_list() 
sl[["numeric"]]
kable(sl$numeric)

# Or grouped, this uses the magrittr exposition pipe
# see ?magrittr::`\%$\%`
library(magrittr)
iris \%>\%
  dplyr::group_by(Species) \%>\%
  skim_to_list() \%$\%
  kable(numeric)
}
