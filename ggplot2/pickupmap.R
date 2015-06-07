starttime = Sys.time()

png("pickup.png")
nycmap <- get_map(location = as.numeric(geocode("New York")), zoom=14,maptype="roadmap", source = "google")
ggmap(nycmap)+
  geom_point(aes(x = lon, y = lat),data = cor, size = 2, alpha = 0.1, colour = "red")
dev.off()

timer(starttime,"pickupmap","ggplot2")