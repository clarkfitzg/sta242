starttime = Sys.time()

##dplyr
sampling = sample_n(alphadata, 300, replace = FALSE)
png("sampling.png")
ggplot(sampling, aes(x = totalamount, y = triptime)) +
  geom_point(colour = "blue", alpha = 0.3)
dev.off()

timer(starttime,"samplingscatterplot","ggplot2")
