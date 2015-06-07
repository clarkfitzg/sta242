# Makes all the plots and does the timings
# Pass in number of repetitions as a command line argument
# Example usage to run with 5 reps:
# 
# ~/projects/sta242 $ Rscript allplots.R 5
# 0.007927,plot_alpha,R
# 0.000932,plot_alpha2,R
# 0.000869,plot_boxplot,R
# ... (More data)

library(ggplot2)

progname = 'ggplot2'
nreps = as.integer(commandArgs(TRUE))

# No arguments => do it one time
if (length(nreps) == 0){
    nreps = 1
}

source('runRplots.R')

############################################################
# Plotting functions follow
#
# TODO- Zhewen- fill these function bodies 
# with relevant dplyr / ggplot2 code
# Note that you'll need to call print for each one
############################################################

plot_sample = function()
{
    p = qplot(1:10, 1:10)
    print(p)
}


plot_histogram = function()
{
}


plot_boxplot = function()
{
}


plot_alpha = function()
{
}


plot_alpha2 = function()
{
}

############################################################

runall(progname, nreps)
