timer = function(starttime, plottype, program)
{
    diff = Sys.time() - starttime
    s = sprintf('%f,%s,%s\n', as.double(diff), plottype, program)
    cat(s)
}

# Usage demo:
starttime = Sys.time()

timer(starttime, 'histogram', 'R')
timer(starttime, 'histogram', 'ggplot2')

# Then use it from the shell like this:
# $ Rscript loadtaxi.R
# It will write to stdout in the same way as the Python program
