% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/tb_bluedjinn.R
\name{xyz2tif}
\alias{xyz2tif}
\title{Read, convert and write xyz DEM/DSM Data as typically provided by the Authorities to GeoTiff.}
\usage{
xyz2tif(xyzFN = NULL, epsgCode = "25832", returnRaster = TRUE)
}
\arguments{
\item{xyzFN}{ASCII tect file with xyz values}

\item{epsgCode}{"25832"}

\item{returnRaster}{logical. return as raster if TRUE}
}
\value{
object of class raster*
}
\description{
Read xyz data, generate a GeoTiff file and optionally returns a raster* object.
}
\examples{
\dontrun{
##- libraries
require(uavRst)
setwd(tempdir())
##- get typical xyz DEM data in this case from the Bavarian authority 
utils::download.file("http://www.ldbv.bayern.de/file/zip/10430/DGM_1_ascii.zip",
                    "testdata.zip")
file<- unzip("testdata.zip",list = TRUE)$Name[2]
unzip("testdata.zip",files = file,  overwrite = TRUE)
##- show structure
head(read.table(file))
##- create tiff file
##- NOTE  for creating a geotiff you have to provide the correct EPSG code from the meta data
xyz2tif(file,epsgCode = "31468")

##- visualize it
raster::plot(raster::raster(file))
}

}
