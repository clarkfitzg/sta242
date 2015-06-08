# Helper script to be used in both ggplot2 and R timings 

# Do it with a small data set while developing code
#taxi = read.csv('data/smalltaxi.csv')
taxi = read.csv('data/taxi.csv')


timer = function(plotfuncname, progname)
{
    # Print out timing data for plotfunc

    plotfunc = get(plotfuncname)

    plotname = strsplit(plotfuncname, '_')[[1]][2]

    starttime = Sys.time()

    # Save file according to function name
    png(paste0(plotname, '.png'))

    # Could have used do.call below, but this is more similar to the Python
    # version
    plotfunc()
    dev.off()
    diff = Sys.time() - starttime

    s = sprintf('%f,%s,%s\n', as.double(diff), plotname, progname)
    cat(s)
}


runall = function(program, nreps)
{
    # Find all functions beginning with `plot_` and run timings on them.

    setwd(program)
    globals = ls(envir=.GlobalEnv)
    plotfuncnames = grep('plot_*', globals, value = TRUE)

    replicate(nreps, sapply(plotfuncnames, timer, progname = program))
    #for (i in 1:nreps){
        #sapply(plotfuncnames, timer, progname = program)
    #}

    setwd('..')
}
