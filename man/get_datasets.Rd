\name{get_datasets}
\alias{get_datasets}
\title{Obtain full datasets from the Neotoma Paleoecological Database.}
\usage{
  get_datasets(siteid, datasettype, piid, altmin, altmax,
    loc, gpid, taxonids, taxonname, ageold, ageyoung,
    ageof, subdate)
}
\arguments{
  \item{siteid}{A numeric value corresponding to the site
  ID.}

  \item{datasettype}{A character string corresponding to
  one of the allowed dataset types in the Neotoma Database.
  Allowed types include: 'geochronologic',
  'loss-on-ignition', 'pollen', 'plant macrofossils',
  'vertebrate fauna', 'mollusks', and 'pollen surface
  sample'.}

  \item{piid}{Numeric value for the Principle
  Investigator's ID number.}

  \item{altmin}{Numeric value indicating the minimum
  altitude for the site (can be used alone or with
  altmax).}

  \item{altmax}{Numeric value indicating the maximum
  altitude for the site (can be used alone or with
  altmin).}

  \item{loc}{A numeric vector c(lonW, latS, lonE, latN)
  representing the bounding box within which to search for
  sites.  The convention here is to use negative values for
  longitudes west of Grewnwich or longitudes south of the
  equator}

  \item{gpid}{A character string or numeric value, must
  correspond to a valid geopolitical identity in the
  Neotoma Database.  Use get.tables('GeoPoliticalUnits')
  for a list of acceptable values, or link here:
  http://api.neotomadb.org/apdx/geopol.htm}

  \item{taxonids}{A numeric identifier for the taxon.  Use
  \code{get.tables('Taxa')} for a list of acceptable
  values.}

  \item{taxonname}{A character string corresponding to a
  valid taxon identity in the Neotoma Database.  Use
  \code{get.tables('Taxa')} for a list of acceptable
  values.}

  \item{ageold}{The oldest date acceptable for the search
  (in years before present).}

  \item{ageyoung}{The youngest date acceptable for the
  search.}

  \item{ageof}{If a taxon ID or taxon name is defined this
  parameter must be set to "taxon", otherwise it may refer
  to "sample", in which case the age bounds are for any
  samples within datasets or "dataset" if you want only
  datasets that are within the bounds of ageold and
  ageyoung.}

  \item{subdate}{Date of dataset submission, either
  YYYY-MM-DD or MM-DD-YYYY.}
}
\value{
  More details on the use of these parameters can be
  obtained from
  \url{http://api.neotomadb.org/doc/resources/datasets.}

  A list, with each item corresponding to an individual
  record.  Each list item (each dataset record) includes
  the following components:

  \itemize{ \item{DatasetID}{Unique database record
  identifier for the dataset.} \item{DatasetName}{Name of
  the dataset; not commonly used.}
  \item{CollUnitHandle}{Code name of the Collection Unit
  with which the dataset is associated. This code may be up
  to 10 characters. Data are frequently distributed by
  Collection Unit, and the Handle is used for file names.}
  \item{CollUnitID}{Unique database record identifier for
  the collection unit.} \item{CollType}{The collection
  type. Types include cores, sections, excavations, and
  animal middens.} \item{DatasetType}{The dataset type,
  such as: geochronologic, loss-on-ignition, pollen, plant
  macrofossils, vertebrate fauna, etc.}
  \item{AgeOldest}{The oldest of all sample ages (in
  calendar years before present) in the dataset.}
  \item{AgeYoungest}{The youngest of all sample ages (in
  calendar years before present) in the dataset.}
  \item{SubDates}{An array of objects that describe dataset
  submission events.  If multiple submissions occured then
  this is a table.} \item{DatasetPIs}{An array of objects
  that describe Principal Investigators associated with a
  dataset.} \item{Site}{An object describing the site where
  the dataset samples were taken.} }
}
\description{
  A function to access the Neotoma API and return datasets
  corresponding to the parameters defined by the user.
}
\examples{
\dontrun{
# Search for sites with "Thuja" pollen that are older than 8kyr BP and
# that are on the west coast of North America:
t8kyr.datasets <- get_datasets(taxonname='Thuja*', loc=c(-150, 20, -100, 60), ageyoung = 8000)

# Search for vertebrate fossils in Canada (gpid: 756) within the last 2kyr.
gpids <- get_table(table.name='GeoPoliticalUnits')
canID <- gpids[which(gpids$GeoPoliticalName == 'Canada'),1]

v2kyr.datasets <- get_datasets(datasettype='vertebrate fauna', gpid=canID, ageold = 2000)
}
}
\author{
  Simon J. Goring \email{simon.j.goring@gmail.com}
}
\references{
  Neotoma Project Website: http://www.neotomadb.org API
  Reference:
  http://api.neotomadb.org/doc/resources/contacts
}
\keyword{API}
\keyword{Neotoma}
\keyword{Palaeoecology}

