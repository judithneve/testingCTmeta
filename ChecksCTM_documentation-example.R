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


if (!require("ctsem")) install.packages("ctsem")
library(ctsem)
library(ctsemOMX)
data(ctExample1)
traitmodel <- ctModel(n.manifest=2, n.latent=2, Tpoints=6, LAMBDA=diag(2), 
                      manifestNames=c('LeisureTime', 'Happiness'), 
                      latentNames=c('LeisureTime', 'Happiness'), TRAITVAR="auto")
out_CTM <- ctFit(dat=ctExample1, ctmodelobj=traitmodel)
ChecksCTM(out_CTM, Sigma)

sig
gam
