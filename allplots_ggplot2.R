# Makes all the plots and does the timings
# Pass in number of repetitions as a command line argument
# Example usage to run with 5 reps:
# 
# ~/projects/sta242 $ Rscript allplots_ggplot2.R 5
# 0.007927,plot_alpha,R
# 0.000932,plot_alpha2,R
# 0.000869,plot_boxplot,R
# ... (More data)

library(ggplot2)
library(dplyr)

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
<<<<<<< HEAD
  triptime = as.numeric(taxi$'trip_time_in_secs')/60
  totalamount = as.numeric(taxi$'total_amount')
  alphadata = as.data.frame(cbind(triptime, totalamount))
  sampling = sample_n(alphadata, 30, replace = FALSE)
  p = ggplot(sampling, aes(x = totalamount, y = triptime)) +
=======
  taxi$minutes = taxi$'trip_time_in_secs'/60
  sampling = sample_n(taxi, 200, replace = FALSE)
  p = ggplot(sampling, aes(x = total_amount, y = minutes)) +
>>>>>>> 4ad1ff5760bc8bef89d4ed9661e7c18aeb3d8839
    geom_point(colour = "blue", alpha = 0.3)
  print(p)
}


plot_histogram = function()
{
  x = taxi[, 'total_amount'][taxi[, 'total_amount'] <= 100]
  p = qplot(x, geom="histogram") 
  print(p)
}


plot_boxplot = function()
{
  x = taxi[, c('payment_type','total_amount')][taxi[, 'total_amount'] <= 100,]
  p = qplot(factor(payment_type), total_amount, data = x, geom = "boxplot")
  print(p)
}


plot_alpha = function()
{
  triptime = as.numeric(taxi$'trip_time_in_secs')/60
  totalamount = as.numeric(taxi$'total_amount')
  alphadata = as.data.frame(cbind(triptime, totalamount))
  p = ggplot(alphadata, aes(x = triptime, y = totalamount)) +
             geom_point(colour = "blue", alpha = 0.05)
  print(p)
}


plot_alpha2 = function()
{
  triptime = as.numeric(taxi$'trip_time_in_secs')/60
  totalamount = as.numeric(taxi$'total_amount')
  alphadata = as.data.frame(cbind(triptime, totalamount))
<<<<<<< HEAD
  filteralpha = filter(alphadata, triptime < 60 & totalamount < 100)
=======
  filteralpha = filter(alphadata, triptime <= 60 & totalamount <= 100)
>>>>>>> 4ad1ff5760bc8bef89d4ed9661e7c18aeb3d8839
  p = ggplot(filteralpha, aes(x = triptime, y = totalamount)) +
    geom_point(colour = "blue", alpha = 0.05)
  print(p)
}

############################################################

runall(progname, nreps)
