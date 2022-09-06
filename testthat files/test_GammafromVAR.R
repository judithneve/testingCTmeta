library(testthat)

library(CTmeta)
# run Calc Gamma_fromVAR.R
# run HelpFile_Check_Phi.R
# run HelpFile_Check_SigmaVAR.R

Phi <- myPhi[1:2,1:2]
q <- dim(Phi)[1]
SigmaVAR <- diag(q)

test_that("NA in Phi",
  {
    Phi.broken <- Phi
    Phi.broken[1,1] <- NA
    expect_error(Gamma.fromVAR(Phi.broken, SigmaVAR),
                 regexp = "There are NA values in Phi")
  }
)

test_that("non-numerical Phi",
  {
    Phi.broken <- Phi
    Phi.broken[1,1] <- "text"
    expect_error(Gamma.fromVAR(Phi.broken, SigmaVAR),
                 regexp = "There are non-numerical values in Phi")
  }
)

test_that("Phi with an extra row",
          {
            Phi.broken <- rbind(Phi, c(1,1))
            expect_error(Gamma.fromVAR(Phi.broken, SigmaVAR),
                         regexp = "The lagged effects matrix Phi should be a square matrix of size q x q. Currently, it is of size \\d x \\d")
          })

test_that("Phi with an extra column",
          {
            Phi.broken <- cbind(Phi, c(1,1))
            expect_error(Gamma.fromVAR(Phi.broken, SigmaVAR),
                         regexp = "The lagged effects matrix Phi should be a square matrix of size q x q. Currently, it is of size \\d x \\d")
          })

test_that("Phi with an extra row and column",
          {
            Phi.broken <- cbind(rbind(Phi, c(1,1)), c(1,1,1))
            expect_error(Gamma.fromVAR(Phi.broken, SigmaVAR),
                         regexp = "SigmaVAR and Phi have different dimensions, but should both be square matrices with dimensions q x q")
          })


test_that("NA in SigmaVAR",
          {
            SigmaVAR.broken <- SigmaVAR
            SigmaVAR.broken[1,1] <- NA
            expect_error(Gamma.fromVAR(Phi, SigmaVAR.broken),
                         regexp = "There are NA values in SigmaVAR")
          }
)

test_that("text in SigmaVAR",
          {
            SigmaVAR.broken <- SigmaVAR
            SigmaVAR.broken[1,1] <- "text"
            expect_error(Gamma.fromVAR(Phi, SigmaVAR.broken),
                         regexp = "There are non-numerical values in SigmaVAR")
          }
)

test_that("SigmaVAR with an extra row",
          {
            SigmaVAR.broken <- rbind(SigmaVAR, c(1,1))
            expect_error(Gamma.fromVAR(Phi, SigmaVAR.broken),
                         regexp = "The residual covariance matrix SigmaVAR should, like Phi, be a square matrix with dimensions q x q, with q = \\d. In the given input, it has dimensions \\d x \\d")
          })

test_that("SigmaVAR with an extra column",
          {
            SigmaVAR.broken <- cbind(SigmaVAR, c(1,1))
            expect_error(Gamma.fromVAR(Phi, SigmaVAR.broken),
                         regexp = "The residual covariance matrix SigmaVAR should, like Phi, be a square matrix with dimensions q x q, with q = \\d. In the given input, it has dimensions \\d x \\d")
          })

test_that("SigmaVAR with an extra row and an extra column",
          {
            SigmaVAR.broken <- rbind(cbind(SigmaVAR, c(1,1)), c(1,1,1))
            expect_error(Gamma.fromVAR(Phi, SigmaVAR.broken),
                         regexp = "SigmaVAR and Phi have different dimensions, but should both be square matrices with dimensions q x q")
          })
