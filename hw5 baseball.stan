data {
  int<lower=0> J;         // number of schools 
  int<lower=0> y[J];              // estimated treatment effects
  int<lower=0> n[J];
}
parameters {
  real mu;                // population treatment effect
  vector[J] eta;          // unscaled deviation from mu by school
  real<lower=0> tau;      // standard deviation in treatment effects
}
transformed parameters {
  vector[J] theta = mu + tau * eta;        // school treatment effects

}
model {
  tau ~ cauchy(0,1);           // suggested as a good default prior
  eta ~ normal(0, 1);       // prior log-density
  y ~ binomial_logit(n,theta); // log-likelihood
}