# Here, we explore the choice under risk and ambiguity (CRA) models in hBayesDM

# Linear model
?cra_linear

# Exponential model
?cra_exp

# load data
path_to_attend_data = "cra_simulated_data.txt"
  
# Fit the exponential model ---------------------------------------------------
fit1 <- cra_linear(path_to_attend_data, niter = 2000, nwarmup = 1000, nchain = 2, ncore = 2)
fit2 <- cra_linear(path_to_attend_data, niter = 2000, nwarmup = 1000, nchain = 2, ncore = 2)

# Important!!! Always check for convergence before moving on
# Make sure the chains are "mixing" well ("furry caterpillars")
plot(fit1, type = "trace"); rhat(fit1, 1.1)
plot(fit2, type = "trace"); rhat(fit2, 1.1)

# Visualize posterior distributions in multiple ways
# Method 1 -- Group parameter histograms
plot(fit1)
plot(fit2)

# Now, use LOOIC to compare model fits ----------------------------------------
printFit(fit1, fit2)
