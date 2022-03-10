library(CTmeta)

## Example 1 ##

##################################################################################################
# Input needed in examples below with q=2 variables.
# I will use the example matrix stored in the package:
DeltaT <- 1
Phi <- myPhi[1:2, 1:2]
#
q <- dim(Phi)[1]
SigmaVAR <- diag(q) # for ease
#
Gamma <- Gamma.fromVAR(Phi, SigmaVAR)
##################################################################################################

CTMparam(DeltaT, Phi, SigmaVAR)
# or
CTMparam(DeltaT, Phi, Gamma = Gamma)


## Example 2: input from fitted object of class "varest" ##
#
DeltaT <- 1
data <- myData
if (!require("vars")) install.packages("vars")
library(vars)
out_VAR <- VAR(data, p = 1)
CTMparam(DeltaT, out_VAR)
