# library(CTmeta)

## Example 1 ##

##################################################################################################
# Input needed in examples below with q=2 variables.
# I will use the example matrices stored in the package:
DeltaT <- 1
Phi <- myPhi[1:2, 1:2]
# or: Drift
DeltaT <- 1
Drift <- myDrift
##################################################################################################

Area(DeltaT = DeltaT, Phi = Phi)
# or
Area(DeltaT, Phi)
# or, since DeltaT = 1
Area(Phi = Phi)

# If you would use the drift matrix Drift as input, then use:
Area(DeltaT, Drift = Drift)

# If, for instance, the time-interval range from 1 to 2 should be inspected (and not 0 to infinity), then use:
Area(DeltaT, Phi, t_min = 1, t_max = 2)


# Note that the function 'PhiPlot' can help for visualization of the curves in the Phi(DeltaT)-plot.
PhiPlot(DeltaT, Phi)


## Example 2: input from fitted object of class "varest" ##
#
data <- myData
if (!require("vars")) install.packages("vars")
library(vars)
out_VAR <- VAR(data, p = 1)
DeltaT <- 1
Area(DeltaT, out_VAR)
