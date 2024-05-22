#Code to automatically generate plot clips from the orthomosaic image
#install.packages("devtools", type="source")

#devtools::install_github("OpenDroneMap/FIELDimageR", dependencies=TRUE)

library(FIELDimageR)
library(raster)
library(rgdal)

rm(list=ls())
options(device = "windows")

nrow = 156
ncol = 32

rgbStack <- raster::stack('C:/Users/sarah/Desktop/Thesis/Data/rotated-cropped-noparents.tiff')


#Organazing the field map in function of plot order.Field map ID identification to align with plots shapefile built with fieldShape(). The plots are numbered from left to right and top to bottom.
mapData = fieldMap(fieldPlot=1:(nrow*ncol), fieldRow=rep(1:nrow, each=ncol), fieldColumn=rep(1:ncol, times=nrow) ) 
imgShape<-fieldShape(mosaic = rgbStack,ncols = ncol, nrows = nrow,fieldMap=mapData, extent=TRUE) 

polygonData = imgShape$fieldShape

dir.create(paste0('C:/Users/sarah/Desktop/Thesis/Data/clips'))

#the following setting ensures that the .aux.xml file is not created.
rgdal::setCPLConfigOption("GDAL_PAM_ENABLED", "FALSE")

for(row in 1:nrow) {
  
  for(col in 1:ncol) {
    
    plotID = mapData[row, col]
    polygonPos = which(polygonData@data$PlotName==plotID)
    tmpExtent = extent(bbox(polygonData@polygons[[polygonPos]]))
    individualPlot = crop(rgbStack,tmpExtent)
    fileName = paste0('C:/Users/sarah/Desktop/Thesis/Data/clips/R',((nrow+1)-row),'P',col,'.png') 
    writeGDAL(as(individualPlot, Class = "SpatialPixelsDataFrame"), 
              fname = fileName, 
              drivername = "PNG", 
              type = "Byte", 
              mvFlag = 255,
              options = "ALPHA='NO'"
    )
  }
}



