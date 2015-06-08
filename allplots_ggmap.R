# Makes all the plots and does the timings
# Pass in number of repetitions as a command line argument
# Example usage to run with 5 reps:
# 
# ~/projects/sta242 $ Rscript allplots_ggmap.R 5
# 0.007927,plot_alpha,R
# 0.000932,plot_alpha2,R
# 0.000869,plot_boxplot,R
# ... (More data)

library(ggplot2)
library(ggmap)
library(dplyr)

progname = 'ggmap'
nreps = as.integer(commandArgs(TRUE))

# No arguments => do it one time
if (length(nreps) == 0){
  nreps = 1
}

source('runRplots.R')

############################################################
# Plotting functions follow
#
# TODO- Zhewen- fill these function bodies 
# with relevant dplyr / ggmap code
# Note that you'll need to call print for each one
############################################################

plot_pickup = function()
{
  nycmap <- get_map(location = as.numeric(geocode("New York")), zoom=14,maptype="roadmap", source = "google")
  latitude = taxi$pickup_latitude
  longitude = taxi$pickup_longitude
  lat = as.numeric(as.character(latitude))
  lon = as.numeric(as.character(longitude))
  cor = as.data.frame(cbind(lon, lat))
  cor = filter(cor, (lon < -73.94280) & (lat < 40.81775) & (lon > -74.01479) & (lat> 40.65698))
  p = ggmap(nycmap)+
    geom_point(aes(x = lon, y = lat),data = cor, size = 2, alpha = 0.1, colour = "red")
  print(p)
}


plot_dropoff = function()
{
  droplat = as.numeric(as.character(taxi$dropoff_latitude))
  droplon = as.numeric(as.character(taxi$dropoff_longitude))
  dropdata = as.data.frame(cbind(droplat, droplon))
  datadrop = filter(dropdata, (droplon < -73.94280) & ( droplat < 40.81775) & droplon > -74.01479 & droplat > 40.65698)
  p = qmplot(droplon, droplat, data = datadrop, color = I("red"), zoom = 14, size = I(.5), alpha = I(0.02), xlim = c(-74.01479, -73.94280), ylim = c(40.65698, 40.81775))
  print(p)
}



############################################################

runall(progname, nreps)