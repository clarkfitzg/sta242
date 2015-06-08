library(ggplot2)

timings = read.csv('timings.csv')

fit = lm(time ~ plot * program, timings)

#timing_meds = tapply(timings[, 'time'], timings[, c('plot', 'program')], median)
#timing_meds = as.data.frame(timing_meds)

ggplot(timings, aes(x=plot, y=time, color=program, group=program)) +
    geom_point() + geom_jitter() + xlab('plot type') + ylab('time (seconds)')

ggsave('timingplots.png')

timings$scaledtimes = ave(timings$time, timings$plot,
                          FUN=function(x) scale(x, center=FALSE))

ggplot(timings, aes(x=plot, y=scaledtimes, color=program, group=program)) +
    geom_point() + geom_jitter() + xlab('plot type') + ylab('scaled times')

ggsave('timingplots2.png')
