data {
  int<lower=0> N;
  vector[N] y;
  real<lower=0> k0;
  real mu0;
}


parameters {
  real mu;
  real<lower=0> sigma;
}


model {
  mu ~ normal(mu0, sigma/sqrt(k0));
  sigma ~ gamma(15, 1);
  y ~ normal(mu, sigma);
}

