############### STE_wind_JU2003 ###############
### 03runJags                               ###
### run JAGS model 'windfinder'             ###
### Date: 2017-11-11                        ###
### By: xf                                  ###
###############################################

## header
library(R2jags)
library(coda)

## settings
data <- list('n.valid.U', 'Ux.map', 'Uy.map', 'k.map', 'U.mu', 'U.cov.obs.array', 'U.obs.array', 'N',
             'U.ref', 'p.wdir', 'wdir.Cat', 'logWspdLower', 'logWspdUpper', 'wdirs')
parameters <- c('wdir', 'wspd', 'i.wdir', 'tau')
inits <- NULL

wf.sim <- jags(data, inits, parameters, 'windfinder.bug', n.chains = 3, n.iter = 5000, n.burnin = 1000, n.thin = 1)

wf.coda <- as.mcmc(wf.sim)
print(wf.sim)