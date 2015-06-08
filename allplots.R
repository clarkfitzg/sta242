# Makes all the plots and does the timings
# Pass in number of repetitions as a command line argument
# Example usage to run with 5 reps:
# 
# ~/projects/sta242 $ Rscript allplots.R 5
# 0.007927,plot_alpha,R
# 0.000932,plot_alpha2,R
# 0.000869,plot_boxplot,R
# ... (More data)


progname = 'R'
nreps = as.integer(commandArgs(TRUE))


# No arguments => do it one time
if (length(nreps) == 0){
    nreps = 1
}

source('runRplots.R')

############################################################
# Plotting functions follow
############################################################

plot_sample = function()
{
    npoints = 300
    x = taxi[, 'trip_time_in_secs'] / 60
    y = taxi[, 'total_amount']

    set.seed(37)
    randompts = sample.int(length(x), size=npoints, replace=TRUE)

    plot(x[randompts], y[randompts],
         xlab = 'trip time in minutes', ylab = 'total fare amount in dollars')
}


plot_histogram = function()
{
    x = taxi[, 'total_amount'][taxi[, 'total_amount'] <= 100]
    hist(x)
}


plot_boxplot = function()
{
  x = taxi[, c('payment_type','total_amount')][taxi[, 'total_amount'] <= 100,]
  boxplot(total_amount ~ payment_type,data = x, main="Boxplot for Total Amount", 
          xlab="Payment Type", ylab="Total Amount")
}




############################################################

runall(progname, nreps)
