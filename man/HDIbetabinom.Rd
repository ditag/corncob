% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/HDIbetabinom.R
\name{HDIbetabinom}
\alias{HDIbetabinom}
\title{Get highest density interval of beta-binomial}
\usage{
HDIbetabinom(percent, M, mu, phi)
}
\arguments{
\item{percent}{Numeric. Percent interval desired.}

\item{M}{Numeric vector of sequencing depth}

\item{mu}{Numeric vector of abundance parameter}

\item{phi}{Numeric vector of dispersion parameter}
}
\value{
List where \code{lower} represents the lower bound and \code{upper} represents the upper bound
}
\description{
Get highest density interval of beta-binomial
}
\examples{
\dontrun{
data(soil_phylo)
soil <- soil_phylo \%>\%
phyloseq::subset_samples(DayAmdmt \%in\% c(11,21)) \%>\%
phyloseq::tax_glom("Phylum")
mod <- bbdml(formula = OTU.1 ~ DayAmdmt,
phi.formula = ~ DayAmdmt,
data = soil)
HDIbetabinom(.95, M = mod$M[1], mu = mod$mu.resp[1], phi = mod$phi.resp[1])
}
}
