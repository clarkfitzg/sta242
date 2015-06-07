starttime = Sys.time()

png("dropoff.png")
qmplot(droplon, droplat, data = datadrop, color = I("red"), zoom = 14, size = I(.5), alpha = I(0.01), xlim = c(-74.01479, -73.94280), ylim = c(40.65698, 40.81775))
dev.off()

timer(starttime,"dropoffmap","ggplot2")