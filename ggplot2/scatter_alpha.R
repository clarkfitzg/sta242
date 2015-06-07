starttime = Sys.time()

png("alphaploting.png")
ggplot(alphadata, aes(x = triptime, y = totalamount)) +
  geom_point(colour = "blue", alpha = 0.1)
dev.off()

timer(starttime, "scatterplot", "ggplot2")
