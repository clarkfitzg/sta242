starttime = Sys.time()

png("dropoff.png")
segsample = sample_n(segdata, 50, replace = FALSE)
segdata = filter(segdata, lon < -73.9428 & lat < 40.81775 & lon > -74.01479 & lat > 40.65698 & (droplon < -73.94280) & (droplat < 40.81775) & (droplon > -74.01479) & (droplat > 40.65698))
qmplot(lon, lat, xend = droplon, yend = droplat, data = segsample, source = "stamen", urlonly = TRUE, geom = "segment", color = I("red"), zoom = 14, xlim = c(-74.01479, -73.94280), ylim = c(40.65698, 40.81775))


timer(starttime,"segmentmap","ggplot2")

##slow and have problems..