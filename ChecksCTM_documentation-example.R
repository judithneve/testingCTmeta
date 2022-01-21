library(CTmeta)

## Example 1 ##

##################################################################################################
# Input needed in examples below with q=2 variables.
# We use the example matrix stored in the package:
Drift <- myDrift
#
q <- dim(Drift)[1]
Sigma <- diag(q) # for ease
#
Gamma <- Gamma.fromCTM(Drift, Sigma)
##################################################################################################

sig <- ChecksCTM(Drift, Sigma)
# or
gam <- ChecksCTM(Drift, Gamma = Gamma)


## Example 2: input from fitted object of class "ctsemFit" ##
#
data <- myData
if (!require("ctsem")) install.packages("ctsem")
library(ctsem)
out_CTM <- ctFit(...)
ChecksCTM(out_CTM)

sig
gam
