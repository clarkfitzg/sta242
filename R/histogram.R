source('loadtaxi.R')

starttime = Sys.time()

pdf('histogram.pdf')

hist(rnorm(1000))

dev.off()

timer(starttime, 'histogram', 'R')
