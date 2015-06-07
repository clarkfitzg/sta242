starttime = Sys.time()

png("dropoff.png")
boxdata = filter(taxi, total_amount < 100|total_amount == 100)
qplot(factor(payment_type), total_amount, data = boxdata, geom = "boxplot")
dev.off()

timer(starttime,"boxplot","ggplot2")