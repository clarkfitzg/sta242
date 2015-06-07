# Makes all the plots and does the timings
# Pass in number of repetitions as a command line argument

taxi = read.csv('data/taxi.csv')


timer = function(plotfuncname)
{
    # Print out timing data for plotfunc

    plotfunc = get(plotfuncname)
    starttime = Sys.time()
    # Could have used do.call, but this is more similar to the Python
    # version
    plotfunc()
    diff = Sys.time() - starttime
    s = sprintf('%f,%s,%s\n', as.double(diff), plotfuncname, 'R')
    cat(s)
}


plot_sample = function()
{
    npoints = 300
    x = taxi[, 'trip_time_in_secs'] / 60
    y = taxi[, 'total_amount']

    set.seed(37)
    randompts = sample.int(length(x), size=npoints, replace=TRUE)

    png('sample.png')
    plot(x[randompts], y[randompts],
         xlab = 'trip time in minutes', ylab = 'total fare amount in dollars')
    dev.off()
}


plot_histogram = function()


plot_boxplot = function()


plot_alpha = function()


plot_alpha2 = function()
{
}

main = function()
{

    setwd('R')
    globals = ls(envir=.GlobalEnv)
    plotfuncnames = grep('plot_*', globals, value = TRUE)

    sapply(plotfuncnames, timer)
    setwd('..')
}

main()
