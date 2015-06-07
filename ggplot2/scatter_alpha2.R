starttime = Sys.time()

##dplyr package##
filteralpha = filter(alphadata, triptime < 60 & totalamount < 100)
png("alphaploting2.png")
ggplot(filteralpha, aes(x = triptime, y = totalamount)) +
  geom_point(colour = "blue", alpha = 0.1)
dev.off()

timer(starttime,"scatterplot2","ggplot2")